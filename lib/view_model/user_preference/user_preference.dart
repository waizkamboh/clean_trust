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

  Future<void> saveSettings({
    required bool allowNotifications,
    required bool allowLocation,
    required bool autoSync,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('allow_notifications', allowNotifications);
    await prefs.setBool('allow_location', allowLocation);
    await prefs.setBool('auto_sync', autoSync);
  }

  Future<bool> getAllowNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('allow_notifications') ?? false;
  }

  Future<bool> getAllowLocation() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('allow_location') ?? false;
  }

  Future<bool> getAutoSync() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('auto_sync') ?? false;
  }


  Future<void> saveAppVersion(String version) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('app_version', version);
  }

  Future<String?> getAppVersion() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('app_version');
  }

  Future<void> saveBuildNumber(String build) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('build_number', build);
  }

  Future<String?> getBuildNumber() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('build_number');
  }

  Future<void> saveLastUpdated(String date) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('last_updated', date);
  }

  Future<String?> getLastUpdated() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('last_updated');
  }
}
