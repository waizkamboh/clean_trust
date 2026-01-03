

class AppUrl{
  //Select Language
  static const String language = "language";

   static const String baseUrl = 'http://192.168.1.4:3000/api';
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
   static const String getAllNotificationApi = '${baseUrl}/notifications?page=1&limit=20';
   static const String getUnreadCountNotificationApi = '${baseUrl}/notifications/unread-count';
   static String markNotificationReadApi(int id) => "${baseUrl}/notifications/$id/read";
   static const String markAllNotificationReadApi = '${baseUrl}/notifications/read-all';
   static String getEmployeeByIdApi(int id) => "${baseUrl}/employees/$id";
   static String updateEmployeeApi(int id) => "${baseUrl}/employees/$id";
























}