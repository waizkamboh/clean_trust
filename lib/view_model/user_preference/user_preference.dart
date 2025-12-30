// import 'package:car_project/models/signup/UserModel.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
//
// class UserPreference {
//
//
//   Future<bool> saveUser(UserModel responseModel) async{
//     SharedPreferences sp = await SharedPreferences.getInstance();
//     sp.setString('token', responseModel.token.toString());
//     return true;
//   }
//
//   Future<UserModel> getUser() async{
//     SharedPreferences sp = await SharedPreferences.getInstance();
//     String? token = sp.getString('token');
//     print(token);
//     return UserModel(
//       token: token
//     );
//   }
//
//   Future<bool> removeUser() async{
//     SharedPreferences sp = await SharedPreferences.getInstance();
//     sp.clear();
//     return true;
//
//   }
// }


import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {

  /// Save token
  Future<bool> saveToken(String token) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    print('token:$token');
    return await sp.setString('token', token);
  }

  /// Get token
  Future<String?> getToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString('token');
  }

  /// Remove token (logout)
  Future<bool> removeToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return await sp.remove('token');
  }
}
