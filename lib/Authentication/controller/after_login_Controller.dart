import 'package:http/http.dart' as http;
import 'package:my_autocare/Authentication/model/after_login_model.dart';

class AfterLoginController
{
  Future<AfterLogin> getLoggedInInfo(String mb,String otp) async
  {
    var response=await http.post("http://myautocare.in/admin/api/verify_otp",body: {"mobile_no":mb,"otp":otp});
    if(response.statusCode ==200)
    {
      var data=response.body;
      return afterLoginFromJson(data);
    }
    else{
      print("Error");
    }
  }
}
