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