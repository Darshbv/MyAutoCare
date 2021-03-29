import 'package:http/http.dart' as http;
import 'package:my_autocare/Authentication/model/login_model.dart';

class LoginUserController
{
  Future<LoginUser> getLoginInfo(String mb) async
  {
    var response=await http.post("http://myautocare.in/admin/api/userlogin",
        body: {"mobile_no":mb});
    if(response.statusCode ==200)
      {
        var data=response.body;
        return loginUserFromJson(data);
      }
    else{
      print("Error");
    }
  }
}
