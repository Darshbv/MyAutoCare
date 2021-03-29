import 'dart:convert';
import 'dart:io';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:my_autocare/chat/models/message_model.dart';
import 'package:my_autocare/chat/models/message_sent_model.dart';
import 'package:my_autocare/chat/models/user_model.dart';
import 'package:http_parser/http_parser.dart';

class ChatController
{
  Future<UserChatModel> getUserChat({String sessionId})async
  {
    UserChatModel userChatModel;
    var response=await http.get("http://myautocare.in/Socialmedia/mobile_api/get_chats?session_id=$sessionId");
    if(response.statusCode==200)
      {
        userChatModel= userChatModelFromJson(response.body);
        return userChatModel;

      }
    else{
      throw Exception("Error");
    }

  }

  Future<MessageModel> getUserMessageChat(String sessionId,String otherUserId)async
  {
    MessageModel messageModel;
    var response=await http.get("http://myautocare.in/Socialmedia/mobile_api/get_messages?session_id=$sessionId&user_id=$otherUserId");
    if(response.statusCode==200)
    {
      messageModel= messageModelFromJson(response.body);
      return messageModel;
    }
    else
      {
      throw Exception("Error");
    }

  }
  
  Future<MessageSentModel> getSentMessageInfo({sessionId,otherUserId,message}) async
  {
    MessageSentModel messageSentModel;
        var response=await http.post("http://myautocare.in/Socialmedia/mobile_api/send_message",
        body: {
          "session_id":sessionId,
          "user_id":otherUserId,
          "type":"text",
          "message":message
        });

        if(response.statusCode ==200)
          {
              messageSentModel= messageSentModelFromJson(response.body);
              return messageSentModel;
          }
        else{
          throw Exception("Error");
        }
  }

  Future<void> getSentImageInfo({List<File> files,sessionId,otherUserId,message}) async
  {
    /*var uri = Uri.parse("http://myautocare.in/Socialmedia/mobile_api/send_message");
    var request = new http.MultipartRequest("POST", uri);


    for (var file in files) {
      String fileName = file.toString().split("/").last;
      print(fileName);
      var stream = new http.ByteStream(DelegatingStream.typed(file.openRead()));
      var length = await file.length();
      var multipartFileSign = new http.MultipartFile('image', stream, length, filename: fileName);
      request.files.add(multipartFileSign);
    }

    request.fields['session_id'] = sessionId;
    request.fields['user_id']=otherUserId;
    request.fields['type']="media";
    request.fields['message']=message;

    print(sessionId);
    print(otherUserId);
    print(message);

    var response = await request.send();

    print(response.statusCode);
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });*/

    var uri = Uri.parse('http://myautocare.in/Socialmedia/mobile_api/send_message');
    var request = http.MultipartRequest('POST', uri);
    for (var file in files) {
      /*String fileName = file.toString().split("/").last;
      print(fileName);
      var stream = new http.ByteStream(DelegatingStream.typed(file.openRead()));
      var length = await file.length();*/
      var multipartFileSign = new http.MultipartFile.fromBytes('image', await File.fromUri(file.uri).readAsBytes(), contentType: MediaType('image', 'png'));
      request.files.add(multipartFileSign);
    }
    request.fields['session_id'] = sessionId;
    request.fields['user_id']=otherUserId;
    request.fields['type']="media";
    request.fields['message']=message;
    request.headers['content-type']='application/x-tar';

    var response = await request.send();
    if (response.statusCode == 200)
      {
        print('Uploaded!');
        response.stream.transform(utf8.decoder).listen((event) {print(event);});
      }


  }
}
