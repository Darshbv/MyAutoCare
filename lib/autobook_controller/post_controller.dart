import 'package:http/http.dart' as http;
import 'package:my_autocare/main_model/post_user_likes.dart';
import 'package:my_autocare/main_model/post_user_media.dart';
import 'package:my_autocare/main_model/post_user_model.dart';

class PostController
{
  Future<PostUserModel> fetchUserPost(String userId, String session_id)async
  {
    var response=await http.get("http://myautocare.in/Socialmedia/mobile_api/profile_posts?session_id=$session_id&type=posts&user_id=$userId");
    if(response.statusCode == 200)
      {
        return postUserModelFromJson(response.body);
      }
    else{
      throw Exception("Error");
    }
  }


  Future<PostUserMedia> fetchUserMedia(String userId, String session_id)async
  {
    var response=await http.get("http://myautocare.in/Socialmedia/mobile_api/profile_posts?session_id=$session_id&type=media&user_id=$userId");
    if(response.statusCode == 200)
    {
      return postUserMediaFromJson(response.body);
    }
    else{
      throw Exception("Error");
    }
  }

  Future<PostUserLikes> fetchUserLikes(String userId, String session_id)async
  {
    var response=await http.get("http://myautocare.in/Socialmedia/mobile_api/profile_posts?session_id=$session_id&type=likes&user_id=$userId");
    if(response.statusCode == 200)
    {
      return postUserLikesFromJson(response.body);
    }
    else{
      throw Exception("Error");
    }
  }


}