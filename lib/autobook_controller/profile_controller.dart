import 'package:http/http.dart' as http;
import 'package:my_autocare/main_model/profile_model.dart';
import 'package:my_autocare/shared_perferences/login_user_data.dart';

class ProfileController {
  Future<ProfileModel> getProfileInfo(String userid) async {
    String session_id = await getUserAuth();
    String user_id = await getUserId();
    var uri = Uri.parse("https://myautocare.in/admin/api/getuser/$user_id");
    print(session_id);
    print(user_id);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      return profileModelFromJson(response.body);
    } else {
      print("Error");
    }
    return null;
  }
}
