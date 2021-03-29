import 'package:my_autocare/main_model/autobook_model.dart';
import 'package:http/http.dart' as http;

class AutobookController
{
  Future<AutobookModel> getAutobookInfo(String session_id)async
  {
    var response=await http.post("http://myautocare.in/Socialmedia/mobile_api/feeds?session_id=$session_id",
        body: {"session_id":session_id});
    if(response.statusCode==200)
      {
        return autobookModelFromJson(response.body);
      }
  }
}