import 'dart:convert';
import 'dart:io';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_autocare/post_upload/post_upload_image.dart';
import 'package:my_autocare/shared_perferences/login_user_data.dart';
import 'package:path/path.dart';

class PostImageex extends StatefulWidget {
  @override
  _PostImageexState createState() => _PostImageexState();
}

class _PostImageexState extends State<PostImageex>
{
  PostVideo pi;
  var pickedImage;
  File _image;
  final picker=ImagePicker();
  TextEditingController nameController=TextEditingController();

  Future choiceImage() async
  {
    pickedImage=await picker.getImage(source: ImageSource.gallery);
    setState(()
    {
      _image=File(pickedImage.path);
    });
  }

  Future uploadImage(File image) async
  {

    String sessionId=await getUserAuth();
    print(sessionId);

    PostImage pi;

   /* var request = http.MultipartRequest('POST', Uri.parse('http://myautocare.in/Socialmedia/mobile_api/upload_post_media'));
    request.fields.addAll({
      'session_id': sessionId,
      'type': 'image'
    });
    request.files.add(await http.MultipartFile.fromPath('file', image.path));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }*/
    Map<String, String> headers = { "Content-Type": "multipart/form-data"};
    var stream=new http.ByteStream(DelegatingStream.typed(image.openRead()));
    var length=await image.length();
    var uri=Uri.parse("http://myautocare.in/Socialmedia/mobile_api/upload_post_media");
    var request=new http.MultipartRequest("POST", uri);
    var multipartFile=new http.MultipartFile("file", stream, length,filename: basename(image.path));
    request.files.add(multipartFile);
    request.fields.addAll({
      'session_id': sessionId,
      'type': 'image'
    });
    request.headers.addAll(headers);
    var response=await request.send();
    if(response.statusCode==200)
      {
        print("image uploaded");
        print(await response.stream.bytesToString());
        var res=await http.post("http://myautocare.in/Socialmedia/mobile_api/publish_post",body: {
          "session_id":sessionId,
          "post_text":nameController.text
        });
        if(res.statusCode==200)
          {
            print("Done");
          }
        else
          {
            print("Not Done");
          }

      }
    else
      {
        print("upload failed");
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Image"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                    labelText: "Name"
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.camera),
              onPressed: (){
                choiceImage();
              },
            ),
            Container(
              child: _image==null?Text("No Image Selected"):Image.file(_image,width: 0.9*MediaQuery.of(context).size.width,
              height: 0.5*MediaQuery.of(context).size.height,),
            ),
            RaisedButton(onPressed: (){
              uploadImage(_image);
            },child: Text("Upload"),
            ),
          ],
        ),
      ),
    );
  }
}


class PostVideo extends StatefulWidget {
  @override
  _PostVideoState createState() => _PostVideoState();
}

class _PostVideoState extends State<PostVideo> {

  File _video;

  Future getVideoGallery() async{
    var imageFile = await ImagePicker.pickVideo(source: ImageSource.gallery);

    setState(() {
      _video = imageFile;
    });
  }

  Future getVideoCamera() async{
    var imageFile = await ImagePicker.pickVideo(source: ImageSource.camera);
    setState(() {
      _video = imageFile;
    });
  }

  Future uploadVideo(File videoFile) async{
    String sessionId=await getUserAuth();
    var uri = Uri.parse("http://myautocare.in/Socialmedia/mobile_api/upload_post_media");
    var request = new http.MultipartRequest("POST", uri);
    request.fields.addAll({
      'session_id': sessionId,
      'type': 'video'
    });
    var multipartFile = await http.MultipartFile.fromPath("file", videoFile.path);
    request.files.add(multipartFile);
    http.StreamedResponse response = await request.send();
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
    if(response.statusCode==200){
      print("Video uploaded");
    }else{
      print("Video upload failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Upload Video"),),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _video==null
                ? new Text("No video selected!")
                : new Text("video is selected"),
            SizedBox(
              height: 10,
            ),
            Column(
              children: <Widget>[
                RaisedButton(
                  child: Icon(Icons.video_library),
                  onPressed: getVideoGallery,
                ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  child: Icon(Icons.videocam),
                  onPressed: getVideoCamera,
                ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  child: Text("UPLOAD video"),
                  onPressed:(){
                    uploadVideo(_video);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


