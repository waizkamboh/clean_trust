import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations {

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'onboardingScreen1': 'Smart Attendance,\nMade Simple',
      'onboardingScreen2': 'Track work hours effortlessly with\nquick and secure QR code scans.',
      'onboardingScreen3': 'Gets start',
      'onboardingScreen4': 'Works Even Offline',
      'onboardingScreen5': 'No network? No problem. Your scans\nare saved and synced automatically\nwhen online.',
      'onboardingScreen6': 'View and Manage Your\nRecords',
      'onboardingScreen7': 'Check attendance history and\nsubmit manual requests anytime.',


      'loginScreen1': 'Welcome To Smart Attendance',
      'loginScreen2': 'Email',
      'loginScreen3': '..........',
      'loginScreen4': 'Password',
      'loginScreen5': 'Remember me',
      'loginScreen6': 'Forget Password?',
      'loginScreen7': 'Sign In',
      'loginScreen8': 'OR',
      'loginScreen9': 'Don’t have an Account?',
      'loginScreen10': 'Create Account',




      'signupScreen1': 'Register',
      'signupScreen2': 'Create your new account',
      'signupScreen3': 'Enter Email',
      'signupScreen4': 'email@gmail,com',
      'signupScreen5': 'Phone Number',
      'signupScreen6': '+92 3455555555',
      'signupScreen7': 'Password',
      'signupScreen8': '..........',
      'signupScreen9': 'By signing up you agree to our Terms & Conditions and\nPrivacy Policy',
      'signupScreen10': 'Sign Up',
      'signupScreen11': 'OR',
      'signupScreen12': 'Have an Account? ',
      'signupScreen13': 'Sign In',




      'forgotPassword1': 'Create Account',
      'forgotPassword2': 'Enter Your email adress',
      'forgotPassword3': 'Enter Email',
      'forgotPassword4': 'email@gmail,com',
      'forgotPassword5': 'Send Code',



      'conformPassword1': 'Enter Your Confirm Password',
      'conformPassword2': 'Password',
      'conformPassword3': '..........',
      'conformPassword4': 'Confirm Password',
      'conformPassword5': 'Continue',


      'scanQrCode1': 'Scan QR Code',
      'scanQrCode2': 'GPS Required',
      'scanQrCode3': 'Location access needed for\nscanning',
      'scanQrCode4': 'Enable',
      'scanQrCode5': 'Scan',
      'scanQrCode6': 'Turn on Flash',
      'scanQrCode7': 'Location Status',
      'scanQrCode8': 'Active',
      'scanQrCode9': 'GPS Coordinates',
      'scanQrCode10': '37.7749° N, 122.4194° W',
      'scanQrCode11': 'Attendance Time',
      'scanQrCode12': 'Ready to capture',




      'scanResult1': 'Scan Result',
      'scanResult2': 'Clock In Successful!',
      'scanResult3': 'Your attendance has been recorded',
      'scanResult4': 'Current Time',
      'scanResult5': '09:15 AM',
      'scanResult6': 'Monday, Nov 18, 2024',
      'scanResult7': 'Main Office',
      'scanResult8': '123 Business Street, Downtown',
      'scanResult9': 'Go to Dashboard',




      'attendanceHistory1': 'Attendance History',
      'attendanceHistory2': 'Filter',
      'attendanceHistory3': 'Date Range',
      'attendanceHistory4': '2024-01-01',
      'attendanceHistory5': '2024-01-31',
      'attendanceHistory6': 'Status',
      'attendanceHistory7': 'All Status',
      'attendanceHistory8': 'Apply',
      'attendanceHistory9': 'Reset',
      'attendanceHistory10': 'Total Hours in Selected Range',
      'attendanceHistory11': '38h 26m',
      'attendanceHistory12': 'Hours worked between 01 Jan – 31 Jan 2024',
      'attendanceHistory13': 'Attendance Records',
      'attendanceHistory14': 'Monday, Jan 15',
      'attendanceHistory15': 'Office A, Building B, Store C',
      'attendanceHistory16': 'Check In:',
      'attendanceHistory17': '09:00 AM',
      'attendanceHistory18': 'Check Out:',
      'attendanceHistory19': '06:30 PM',
      'attendanceHistory20': 'Total Hours:',
      'attendanceHistory21': '8h 30m',
      'attendanceHistory22': 'Tuesday, Jan 16',
      'attendanceHistory23': 'Load More',

      'attendanceDetail1': 'Attendance Details',
      'attendanceDetail2': 'March 15, 2024',
      'attendanceDetail3': 'Friday',
      'attendanceDetail4': 'Worked on 15 March',
      'attendanceDetail5': '142h 35m',
      'attendanceDetail6': 'Office Tower – Level 3',
      'attendanceDetail7': 'Clock In',
      'attendanceDetail8': 'Clock Out',
      'attendanceDetail9': '09:00 AM',
      'attendanceDetail10': '06:00 PM',
      'attendanceDetail11': 'Total Hours (This Object)',
      'attendanceDetail12': '8h 24m',
      'attendanceDetail13': 'Entry Type',
      'attendanceDetail14': 'GPS Status',
      'attendanceDetail15': 'QR Scan',
      'attendanceDetail16': 'Location Verified',
      'attendanceDetail17': 'Check In Location',
      'attendanceDetail18': '123 Business District, Downtown',
      'attendanceDetail19': 'Check Out Location',
      'attendanceDetail20': '123 Business District, Downtown',
      'attendanceDetail21': 'Manager Notes',
      'attendanceDetail22': 'Attendance Adjusted',
      'attendanceDetail23': 'Clock-in time adjusted due to system\nmaintenance. Original time was\n9:05 AM.',
      'attendanceDetail24': 'Edited by John Smith',
      'attendanceDetail25': '2 hours ago',
      'attendanceDetail26': 'Work Summary',
      'attendanceDetail27': '9h 15m',
      'attendanceDetail28': '8h 0m',
      'attendanceDetail29': 'Total Hours',
      'attendanceDetail30': 'Regular Hours',
      'attendanceDetail31': 'Overtime',
      'attendanceDetail32': '1h 15m',




      'manualEntry1': 'Manual Entry',
      'manualEntry2': 'Submit Manual Attendance\nEntry',
      'manualEntry3': 'Fill in the details below to request a manual\nattendance entry',
      'manualEntry4': 'Date',
      'manualEntry5': 'mm/dd/yyyy',
      'manualEntry6': 'Select Object',
      'manualEntry7': 'Choose Object',
      'manualEntry8': 'Employee MUST select an object (cannot submit without it)',
      'manualEntry9': 'Clock In Time',
      'manualEntry10': '--:-- --',
      'manualEntry11': 'Clock Out Time',
      'manualEntry12': '--:-- --',
      'manualEntry13': 'Reason',
      'manualEntry14': 'Please explain why you need a manual entry',
      'manualEntry15': 'Minimum 20 characters',
      'manualEntry16': 'Submit Entry',
      'manualEntry17': 'Submit Other Entry',

      'leaveRequest1': 'Leave Request',
      'leaveRequest2': 'Request Time Off',
      'leaveRequest3': 'Fill out the form below to submit your leave request',
      'leaveRequest4': 'Request Time Off',
      'leaveRequest5': 'Fill out the form below to submit your\nleave request',
       'leaveRequest6': 'Leave Type',
       'leaveRequest7': 'Sick',
       'leaveRequest8': 'Vacation',
       'leaveRequest9': 'Other',
      'leaveRequest10': 'Start Date',
      'leaveRequest11': 'mm/dd/yyyy',
      'leaveRequest12': 'End Date',
      'leaveRequest13': 'mm/dd/yyyy',
      'leaveRequest14': 'Reason',
      'leaveRequest15': 'Upload Document',
      'leaveRequest16': '(optional)',
      'leaveRequest17': 'Tap to upload a file',
      'leaveRequest18': 'PDF, DOC, or Image files',
      'leaveRequest19': 'Submit Leave Request',




      'attendanceOffline1': 'Attendance',
      'attendanceOffline2': 'You are offline',
      'attendanceOffline3': 'Attendance will sync automatically when connection is\nrestored.',
      'attendanceOffline4': 'Pending Sync',
      'attendanceOffline5': '3 items waiting to upload',
      'attendanceOffline6': 'Unsynced Attendance',
      'attendanceOffline7': 'Check-in Scan',
      'attendanceOffline8': 'Today, 9:15 AM',
      'attendanceOffline9': 'Building A - Floor 3',
      'attendanceOffline10': 'Pending',
      'attendanceOffline11': 'Auto-Sync Information',
      'attendanceOffline12': 'Your attendance data is stored locally and\nwill automatically sync when you reconnect\nto the internet. No data will be lost.',







      'homeScreen1': 'Welcome back!',
      'homeScreen2': 'Hi Ali Khan',
      'homeScreen3': 'Clocked In',
      'homeScreen4': '8h 24m',
      'homeScreen5': 'Working hours today',
      'homeScreen6': 'Clock In',
      'homeScreen7': '9:15 AM',
      'homeScreen8': 'Scan QR Code',
      'homeScreen9': 'Clock In / Clock Out',
      'homeScreen10': 'Manual Entry (Clock In / Clock Out)',
      'homeScreen11': 'Monthly Summary',
      'homeScreen12': 'Calculated from actual Clock In & Clock Out records',
      'homeScreen13': 'Total Hours Worked (This Month)',
      'homeScreen14': '142h 35m',



      'profileScreen1': 'Profile',
      'profileScreen2': 'Sarah Anderson',
      'profileScreen3': 'Product Designer',
      'profileScreen4': 'Email',
      'profileScreen5': 'sarah.ander@email.com',
      'profileScreen6': 'Phone',
      'profileScreen7': '+1 (555) 123-4567',









    },
  };
}