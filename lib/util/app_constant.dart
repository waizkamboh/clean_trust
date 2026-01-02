

class AppUrl{
  //Select Language
  static const String language = "language";




   static const String baseUrl = 'http://192.168.1.3:3000/api';

   static const String loginApi = '${baseUrl}/auth/signin';
   static const String signUpApi = '${baseUrl}/auth/signup';
   static const String changePasswordApi = '${baseUrl}/auth/change-password';
   static const String forgetPasswordApi = '${baseUrl}/auth/forgot-password';
   static const String getAppSettingApi = '${baseUrl}/app-settings';
   static const String updateAppSettingApi = '${baseUrl}/app-settings';
   static const String getAppVersionApi = '${baseUrl}/app-settings/version';
   static const String scanQRCodeApi = '${baseUrl}/attendance/scan';
   static const String manualAttendanceEntryApi = '${baseUrl}/attendance/manual';
   static const String getTodayAttendanceApi = '${baseUrl}/attendance/today';
   static const String leaveRequestApi = '${baseUrl}/leave-requests';






















}