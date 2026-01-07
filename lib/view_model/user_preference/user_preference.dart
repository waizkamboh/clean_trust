import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {

  // ================= ONBOARDING =================

  Future<void> setOnboardingSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_seen', true);
  }

  Future<bool> isOnboardingSeen() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboarding_seen') ?? false;
  }

  // ================= AUTH =================

  Future<bool> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString('token', token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<bool> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove('token');
  }

  Future<bool> saveUserName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString('user_name', name);
  }

  Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_name');
  }
  Future<bool> saveUserId(int userId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setInt('user_id', userId);
  }

  Future<int?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('user_id');
  }

  // ================= APP SETTINGS =================

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

  // ================= APP INFO =================

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

  // ================= PROFILE =================

  Future<void> saveProfile({
    required String fullName,
    required String email,
    required String role,
    required String position,
    required String phoneNumber,
    required String profilePicture,
    required String createdAt,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('full_name', fullName);
    await prefs.setString('profile_email', email);
    await prefs.setString('role', role);
    await prefs.setString('position', position);
    await prefs.setString('phone_number', phoneNumber);
    await prefs.setString('profile_picture', profilePicture);
    await prefs.setString('created_at', createdAt);
  }

  Future<Map<String, String>> getProfile() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'full_name': prefs.getString('full_name') ?? '',
      'profile_email': prefs.getString('profile_email') ?? '',
      'role': prefs.getString('role') ?? '',
      'position': prefs.getString('position') ?? '',
      'phone_number': prefs.getString('phone_number') ?? '',
      'profile_picture': prefs.getString('profile_picture') ?? '',
      'created_at': prefs.getString('created_at') ?? '',
    };
  }

  Future<void> clearProfile() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('full_name');
    await prefs.remove('profile_email');
    await prefs.remove('role');
    await prefs.remove('position');
    await prefs.remove('phone_number');
    await prefs.remove('profile_picture');
    await prefs.remove('created_at');
  }




}
