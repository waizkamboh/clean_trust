import 'package:clean_trust/util/app_colors.dart';
import 'package:clean_trust/util/app_images.dart';
import 'package:clean_trust/util/app_util.dart';
import 'package:clean_trust/util/custom_snackbar.dart';
import 'package:clean_trust/view_model/controller/home/attendance/get_today_and_monthly_attendance_controller.dart';
import 'package:clean_trust/view_model/controller/home/attendance/scanqrcode_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../../helper/internet_check.dart';
import '../../../helper/routes/routes_name.dart';
import '../../../util/size_config.dart';
import '../../../util/text_style.dart';
import '../../../view_model/controller/employee/editProfileController.dart';
import '../../../view_model/controller/notification/get_unread_count_controller.dart';
import '../../../view_model/controller/notification/get_notification_controller.dart';
import '../../base/round_button.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();

    _loadData();

    ever(notificationController.unreadCount, (_) {
      unreadCountController.fetchUnreadCount();
    });
  }

  Future<void> _loadData() async {
    final online = await isOnline();

    if (!online) {
      debugPrint('OFFLINE → API not called');
      showCustomSnackBar('Please check internet connection');
      return;
    }

    getAttendanceHistoryController.fetchTodayAttendance();
    getAttendanceHistoryController.fetchMonthlyAttendance();
    unreadCountController.fetchUnreadCount();
  }




 GetNotificationController notificationController = Get.find();

 GetTodayAndMonthlyAttendanceController getAttendanceHistoryController = Get.find<GetTodayAndMonthlyAttendanceController>();

   final UnreadCountController unreadCountController = Get.find<UnreadCountController>();



  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: SizedBox.expand(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            _topHeader(),
            Obx((){
              if (getAttendanceHistoryController.isLoading.value) {
                return Center(
                  child: SpinKitSpinningLines(color: AppColors.kSkyBlueColor),
                );
              }
           return Positioned.fill(

              top: getHeight(160),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),

                child: Column(
                  children: [
                    _todayAttendanceCard(),
                    SizedBox(height: getHeight(30)),
                    _scanQRCard(),
                    SizedBox(height: getHeight(20)),
                    _manualAttendanceEntry(),
                    SizedBox(height: getHeight(20)),
                    _leaveRequestCard(),
                    SizedBox(height: getHeight(40)),
                    _monthlyAttendanceCard(),
                    SizedBox(height: getHeight(50),)

                  ],
                ),
              ),
            );

            }),

          ],
        ),
      )
    );
  }


  Widget _topHeader(){
    return Container(
      width: double.infinity,
      height: getHeight(201),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              AppColors.kGradientColor5,
              AppColors.kGradientColor6,

            ]),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25)),
      ),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.homePersonImage,
                width: getWidth(49),
                height: getHeight(49),
              ),

              SizedBox(width: getWidth(12)),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'homeScreen1'.tr,
                    style: kSize10W400KBlackColorlatoRegular
                        .copyWith(
                      fontSize: getFont(14),
                      color: AppColors.kWhiteColor,
                    ),
                  ),

                  Row(
                    children: [
                      Obx(()=>
                      Text(
                      getAttendanceHistoryController.userName.value,
                        style: kSize10W400KBlackColorlatoRegular
                            .copyWith(
                          fontSize: getFont(20),
                          color: AppColors.kWhiteColor,

                        ),
                      ),),

                      SizedBox(width: getWidth(6)),

                      Image.asset(AppImages.handIcon),
                    ],
                  ),
                ],
              ),

              Spacer(),

              GestureDetector(
                onTap: () {
                  Get.toNamed(RouteName.notificationScreen);
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: getWidth(39),
                      height: getHeight(38),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: AppColors.kWhiteColor.withOpacity(
                            0.22),
                      ),
                      child: Image.asset(AppImages.bellIcon),
                    ),

                    Obx(() {
                      if (unreadCountController.unreadCount
                          .value == 0) {
                        return const SizedBox();
                      }

                      return Positioned(
                        right: -4,
                        top: -4,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 18,
                            minHeight: 18,
                          ),
                          child: Center(
                            child: Text(
                              unreadCountController.unreadCount
                                  .value.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),

            ],
          )

      ),
    );

  }


  Widget _todayAttendanceCard(){
    return Container(
      padding: EdgeInsetsGeometry.symmetric(
          horizontal: getWidth(24), vertical: getHeight(24)),
      width: getWidth(327),
      decoration: BoxDecoration(
        color: AppColors.kWhiteColor,
        borderRadius: BorderRadius.all(Radius.circular(16)),
        border: Border.all(color: AppColors.kLightCoolGreyColor,
            width: 1),
        boxShadow: [
          BoxShadow(
            color: AppColors.kBlackColor.withOpacity(0.10),
            offset: const Offset(0, 10),
            blurRadius: 15,
            spreadRadius: 0,
          ),

          BoxShadow(
            color: AppColors.kBlackColor.withOpacity(0.10),
            offset: const Offset(0, 4),
            blurRadius: 6,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: getWidth(118),
            height: getHeight(28),
            decoration: BoxDecoration(
              color: AppColors.kLightGreenColor,
              borderRadius: BorderRadius.circular(9999),
              border: Border.all(
                  color: AppColors.kLightCoolGreyColor,
                  width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: getWidth(8),
                  height: getHeight(8),
                  decoration: BoxDecoration(
                    color: AppColors.kGreenColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: AppColors.kLightCoolGreyColor,
                        width: 1),
                  ),

                ),
                SizedBox(width: getWidth(10),),
                Text(
                  'homeScreen3'.tr,
                  style: kSize14W500kForestGreenColorInterMedium
                ),


              ],
            ),
          ),
          SizedBox(height: getHeight(10),),
          Obx(() {
            return Text(
              getAttendanceHistoryController.todayTotalHours
                  .value,
              style: kSize24W700kMidnightBlueColorInterBold
            );
          }),

          Text(
            'homeScreen5'.tr,
            style: kSize17W400KCharcoalBlackColorInterRegular.copyWith(
                color: AppColors.kCoolGreyColor,
                fontSize: getFont(14)
            ),
          ),
          SizedBox(height: getHeight(20),),
          Container(
            padding: EdgeInsetsGeometry.symmetric(
                horizontal: getWidth(12),
                vertical: getHeight(12)),
            width: getWidth(131.5),
            decoration: BoxDecoration(
              color: AppColors.kColor1,
              borderRadius: BorderRadius.all(
                  Radius.circular(8)),
              border: Border.all(
                  color: AppColors.kLightCoolGreyColor,
                  width: 1),

            ),
            child: Column(
              children: [
                Text(
                  'homeScreen6'.tr,
                  style: kSize17W400KCharcoalBlackColorInterRegular
                      .copyWith(
                      color: AppColors.kCoolGreyColor,
                      fontSize: getFont(12)
                  ),
                ),
                Obx(() {
                  return Text(
                    getAttendanceHistoryController.checkInTime
                        .value,
                    style: kSize16W600kMidnightBlueColorInterSemiBold
                  );
                })


              ],
            ),
          ),


        ],
      ),
    );

  }

  Widget _scanQRCard(){
    return  GestureDetector(
      onTap: () async {
        bool shouldShowDialog =
        await shouldAskForLocationPermission();

        if (shouldShowDialog) {
          showLocationEnabledDialog();
        } else {
          Get.toNamed(RouteName.scanQRCodeScreen);
        }
      },

      child: Container(
        padding: EdgeInsetsGeometry.symmetric(
            horizontal: getWidth(24), vertical: getHeight(24)),
        width: getWidth(327),
        decoration: BoxDecoration(
          color: AppColors.kSkyBlueColor,
          borderRadius: BorderRadius.all(Radius.circular(16)),
          border: Border.all(
              color: AppColors.kLightCoolGreyColor, width: 1),
          boxShadow: [
            BoxShadow(
              color: AppColors.kBlackColor.withOpacity(0.10),
              offset: const Offset(0, 10),
              blurRadius: 15,
              spreadRadius: 0,
            ),

            BoxShadow(
              color: AppColors.kBlackColor.withOpacity(0.10),
              offset: const Offset(0, 4),
              blurRadius: 6,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.dragHandleIcon,
              width: getWidth(21),
              height: getHeight(24),
            ),

            SizedBox(width: getWidth(20)),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'homeScreen8'.tr,
                  style: kSize16W600kMidnightBlueColorInterSemiBold
                      .copyWith(
                      fontSize: getFont(18),
                      color: AppColors.kWhiteColor

                  ),
                ),

                Text(
                  'homeScreen9'.tr,
                  style: kSize17W400KCharcoalBlackColorInterRegular
                      .copyWith(
                    fontSize: getFont(14),
                    color: AppColors.kLightBlueColor

                  ),
                ),
              ],
            ),


          ],
        ),
      ),
    );

  }
  Widget _manualAttendanceEntry(){
    return   GestureDetector(
      onTap: () {
        Get.toNamed(RouteName.manualEntryScreen);
      },
      child: Container(
        padding: EdgeInsetsGeometry.symmetric(
           vertical: getHeight(22)),
        width: getWidth(327),
        decoration: BoxDecoration(
          color: AppColors.kColor1,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(
              color: AppColors.kLightCoolGreyColor, width: 2),
        ),
        child: Center(
          child: Text(
            'homeScreen10'.tr,
            style: kSize14W500kForestGreenColorInterMedium.copyWith(
                fontSize: getFont(16),
                color: AppColors.kMidnightBlueColor.withOpacity(0.58)

            ),
          ),
        ),
      ),
    );

  }
  Widget _leaveRequestCard(){
    return   GestureDetector(
      onTap: () {
        Get.toNamed(RouteName.leaveRequestScreen);
      },
      child: Container(
        padding: EdgeInsetsGeometry.symmetric(
           vertical: getHeight(22)),
        width: getWidth(327),
        decoration: BoxDecoration(
          color: AppColors.kColor1,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(
              color: AppColors.kLightCoolGreyColor, width: 2),
        ),
        child: Center(
          child: Text(
            'homeScreen15'.tr,
            style:  kSize14W500kForestGreenColorInterMedium.copyWith(
                fontSize: getFont(16),
                color: AppColors.kMidnightBlueColor.withOpacity(0.58)

            ),
          ),
        ),
      ),
    );

  }

  Widget _monthlyAttendanceCard(){
    return  GestureDetector(
      onTap:(){
        Get.toNamed(RouteName.attendanceHistoryScreen);
      },
      child: Container(
        padding: EdgeInsetsGeometry.symmetric(
            horizontal: getWidth(21), vertical: getHeight(21)),
        width: getWidth(335),
        decoration: BoxDecoration(
          color: AppColors.kWhiteColor.withOpacity(0.60),
          borderRadius: BorderRadius.all(Radius.circular(24)),
          border: Border.all(
              color: AppColors.kLightGreyColor, width: 0.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'homeScreen11'.tr,
              style: kSize24W700kMidnightBlueColorInterBold.copyWith(
                  color: AppColors.darkSlateBlue,
                  fontSize: getFont(16)
              ),
            ),
            Text(
              'homeScreen12'.tr,
              style: kSize14W500kForestGreenColorInterMedium.copyWith(
                  color: AppColors.kSlateGray,
                  fontSize: getFont(10)
              ),
            ),
            SizedBox(height: getHeight(20),),
            Container(
                padding: EdgeInsetsGeometry.symmetric(
                    horizontal: getWidth(12), vertical: getHeight(18)),
                width: getWidth(293),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    AppColors.kVeryLightGreenColor,
                    AppColors.kLightGreenColor.withOpacity(0.50),
                  ]),

                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  border: Border.all(
                      color: AppColors.kLightGreen, width: 0.30),
                ),
                child: Row(
                  children: [
                    Container(
                      width: getWidth(40),
                      height: getHeight(40),
                      decoration: BoxDecoration(
                        color: AppColors.kGreenColor.withOpacity(0.10),
                        borderRadius: BorderRadius.all(
                            Radius.circular(12)),
                        border: Border.all(
                            color: AppColors.kLightCoolGreyColor,
                            width: 1),
                      ),
                      child: Image.asset(AppImages.circleTickIcon),

                    ),
                    SizedBox(width: getWidth(10)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'homeScreen13'.tr,
                          style: kSize14W500kForestGreenColorInterMedium.copyWith(
                              color: AppColors.kSlateGray,
                              fontSize: getFont(12)
                          ),
                        ),
                        Obx(() =>
                            Text(
                              getAttendanceHistoryController
                                  .monthlyTotalHours.value,
                              style: kSize24W700kMidnightBlueColorInterBold.copyWith(
                                  color: AppColors.darkSlateBlue,
                              ),
                            ),),
                      ],
                    ),


                  ],
                ),
              ),



          ],
        ),
      ),
    );

  }
  void showLocationEnabledDialog() {
    Get.dialog(
      Dialog(
        backgroundColor: AppColors.kWhiteColor,
        shadowColor: AppColors.kBlackColor.withOpacity(0.10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),

        ),
        child: SizedBox(
          width: getWidth(335),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: getWidth(335),
                height: getHeight(188),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)),
                  color: AppColors.kGradientColor5,

                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: getWidth(80),
                        height: getHeight(80),
                        decoration: BoxDecoration(
                          color: AppColors.kWhiteColor.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(AppImages.locationIcon, color: AppColors.kWhiteColor,)

                    ),
                    SizedBox(height: getHeight(20),),
                    Text(
                        'enableLocation1'.tr,
                        style: kSize24W700kMidnightBlueColorInterBold.copyWith(fontSize: getFont(20), color: AppColors.kWhiteColor)
                    ),


                  ],
                ),
              ),
              SizedBox(height: getHeight(20),),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: getWidth(24), vertical: getHeight(34)),
                child: Column(
                  children: [
                    Text(
                      'enableLocation2'.tr,
                      textAlign: TextAlign.center,
                      style: kSize17W400KCharcoalBlackColorInterRegular.copyWith(
                        color: AppColors.kDarkSlateGray,
                        fontSize: getFont(16),
                      ),
                    ),

                    SizedBox(height: getHeight(30),),

                    RoundButton(
                      onPress: () async{
                        if (Get.isDialogOpen == true) {
                          Get.back();
                        }
                        try {
                          await getCurrentLocation();

                        } catch (e) {
                          if (kDebugMode) {
                            print(e);
                          }
                        }

                      },
                      radius: BorderRadius.circular(16),
                      title: 'enableLocation3'.tr,
                      textStyle: kSize16W600kMidnightBlueColorInterSemiBold.copyWith(color: AppColors.kWhiteColor),
                      buttonColor: AppColors.kSkyBlueColor,
                      borderColor: Colors.transparent,
                      width: getWidth(287),
                      height: getHeight(56),

                    ),
                    SizedBox(height: getHeight(10),),

                    RoundButton(
                      onPress: () async{
                        // Close dialog before navigation
                        if (Get.isDialogOpen == true) {
                          Get.back();
                        }

                        Get.toNamed(RouteName.scanQRCodeScreen);


                      },
                      radius: BorderRadius.circular(16),
                      title: 'enableLocation4'.tr,
                      textStyle: kSize16W600kMidnightBlueColorInterSemiBold.copyWith(color: AppColors.kDarkSlateGray),
                      buttonColor: AppColors.kLightGrayBackground,
                      borderColor: AppColors.kLightCoolGreyColor,
                      width: getWidth(287),
                      height: getHeight(56),

                    ),

                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }


}


// import 'package:clean_trust/util/app_colors.dart';
// import 'package:clean_trust/util/app_images.dart';
// import 'package:clean_trust/view/screens/home/scan_qrcode_screen.dart';
// import 'package:clean_trust/view_model/controller/home/attendance/get_today_and_monthly_attendance_controller.dart';
// import 'package:clean_trust/view_model/controller/home/attendance/scanqrcode_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../helper/routes/routes_name.dart';
// import '../../../util/size_config.dart';
// import '../../../util/text_style.dart';
// import '../../../view_model/controller/notification/get_unread_count_controller.dart';
// import '../../../view_model/controller/notification/get_notification_controller.dart';
// import '../../base/round_button.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
//
// class HomeScreen extends StatefulWidget {
//   HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getAttendanceHistoryController.fetchTodayAttendance();
//     getAttendanceHistoryController.fetchMonthlyAttendance();
//     unreadCountController.fetchUnreadCount();
//
//     ever(notificationController.unreadCount, (_) {
//       unreadCountController.fetchUnreadCount();
//     });
//
//   }
//
//   ScanQrCodeController scanQrCodeController = Get.find();
//   NotificationController notificationController = Get.find();
//
//   GetTodayAndMonthlyAttendanceController getAttendanceHistoryController = Get.find<GetTodayAndMonthlyAttendanceController>();
//
//   final UnreadCountController unreadCountController =
//   Get.find<UnreadCountController>();
//
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Scaffold(
//         backgroundColor: AppColors.kWhiteColor,
//         body: Obx(() {
//           if (getAttendanceHistoryController.isLoading.value) {
//             return  Center(
//               child: SpinKitSpinningLines(color: AppColors.kSkyBlueColor),
//             );
//           }
//           return SingleChildScrollView(
//             child: Column(
//               children: [
//                 Stack(
//                   clipBehavior: Clip.none,
//                   children: [
//                     Container(
//                       width: getWidth(393),
//                       height: getHeight(201),
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                             colors: [
//                               AppColors.kGradientColor5,
//                               AppColors.kGradientColor6,
//
//                             ]),
//                         borderRadius: BorderRadius.only(
//                             bottomLeft: Radius.circular(25),
//                             bottomRight: Radius.circular(25)),
//                       ),
//                       child: Padding(
//                           padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 AppImages.homePersonImage,
//                                 width: getWidth(49),
//                                 height: getHeight(49),
//                               ),
//
//                               SizedBox(width: getWidth(12)),
//
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     'homeScreen1'.tr,
//                                     style: kSize16W400KWhiteColorOutfitRegular
//                                         .copyWith(
//                                       fontSize: getFont(14),
//                                     ),
//                                   ),
//
//                                   Row(
//                                     children: [
//                                       Text(
//                                         'homeScreen2'.tr,
//                                         style: kSize16W400KWhiteColorOutfitRegular
//                                             .copyWith(
//                                           fontSize: getFont(20),
//                                         ),
//                                       ),
//
//                                       SizedBox(width: getWidth(6)),
//
//                                       Image.asset(AppImages.handIcon),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//
//                               Spacer(),
//
//                               GestureDetector(
//                                 onTap: () {
//                                   Get.toNamed(RouteName.notificationScreen);
//                                 },
//                                 child: Stack(
//                                   clipBehavior: Clip.none,
//                                   children: [
//                                     Container(
//                                       width: getWidth(39),
//                                       height: getHeight(38),
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(6),
//                                         color: AppColors.kWhiteColor.withOpacity(
//                                             0.22),
//                                       ),
//                                       child: Image.asset(AppImages.bellIcon),
//                                     ),
//
//                                     /// 🔴 Unread Badge
//                                     Obx(() {
//                                       if (unreadCountController.unreadCount
//                                           .value == 0) {
//                                         return const SizedBox();
//                                       }
//
//                                       return Positioned(
//                                         right: -4,
//                                         top: -4,
//                                         child: Container(
//                                           padding: const EdgeInsets.all(5),
//                                           decoration: const BoxDecoration(
//                                             color: Colors.red,
//                                             shape: BoxShape.circle,
//                                           ),
//                                           constraints: const BoxConstraints(
//                                             minWidth: 18,
//                                             minHeight: 18,
//                                           ),
//                                           child: Center(
//                                             child: Text(
//                                               unreadCountController.unreadCount
//                                                   .value.toString(),
//                                               style: const TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: 10,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       );
//                                     }),
//                                   ],
//                                 ),
//                               ),
//
//                             ],
//                           )
//
//                       ),
//                     ),
//                     Positioned(
//                       left: getWidth(30),
//                       right: getWidth(30),
//                       bottom: getHeight(-200),
//                       child: Container(
//                         padding: EdgeInsetsGeometry.symmetric(
//                             horizontal: getWidth(24), vertical: getHeight(24)),
//                         width: getWidth(327),
//                         decoration: BoxDecoration(
//                           color: AppColors.kWhiteColor,
//                           borderRadius: BorderRadius.all(Radius.circular(16)),
//                           border: Border.all(color: AppColors.kLightCoolGreyColor,
//                               width: 1),
//                           boxShadow: [
//                             BoxShadow(
//                               color: AppColors.kBlackColor.withOpacity(0.10),
//                               offset: const Offset(0, 10),
//                               blurRadius: 15,
//                               spreadRadius: 0,
//                             ),
//
//                             BoxShadow(
//                               color: AppColors.kBlackColor.withOpacity(0.10),
//                               offset: const Offset(0, 4),
//                               blurRadius: 6,
//                               spreadRadius: 0,
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           children: [
//                             Container(
//                               width: getWidth(118),
//                               height: getHeight(28),
//                               decoration: BoxDecoration(
//                                 color: AppColors.kLightGreenColor,
//                                 borderRadius: BorderRadius.circular(9999),
//                                 border: Border.all(
//                                     color: AppColors.kLightCoolGreyColor,
//                                     width: 1),
//                               ),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     width: getWidth(8),
//                                     height: getHeight(8),
//                                     decoration: BoxDecoration(
//                                       color: AppColors.kGreenColor,
//                                       shape: BoxShape.circle,
//                                       border: Border.all(
//                                           color: AppColors.kLightCoolGreyColor,
//                                           width: 1),
//                                     ),
//
//                                   ),
//                                   SizedBox(width: getWidth(10),),
//                                   Text(
//                                     'homeScreen3'.tr,
//                                     style: kSize16W400KWhiteColorOutfitRegular
//                                         .copyWith(
//                                       color: AppColors.kForestGreenColor,
//                                     ),
//                                   ),
//
//
//                                 ],
//                               ),
//                             ),
//                             SizedBox(height: getHeight(10),),
//                             Obx(() {
//                               return Text(
//                                 getAttendanceHistoryController.todayTotalHours
//                                     .value,
//                                 style: const TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               );
//                             }),
//
//                             Text(
//                               'homeScreen5'.tr,
//                               style: kSize16W400KWhiteColorOutfitRegular.copyWith(
//                                   color: AppColors.kCoolGreyColor,
//                                   fontSize: getFont(14)
//                               ),
//                             ),
//                             SizedBox(height: getHeight(20),),
//                             Container(
//                               padding: EdgeInsetsGeometry.symmetric(
//                                   horizontal: getWidth(12),
//                                   vertical: getHeight(12)),
//                               width: getWidth(131),
//                               decoration: BoxDecoration(
//                                 color: AppColors.kColor1,
//                                 borderRadius: BorderRadius.all(
//                                     Radius.circular(8)),
//                                 border: Border.all(
//                                     color: AppColors.kLightCoolGreyColor,
//                                     width: 1),
//
//                               ),
//                               child: Column(
//                                 children: [
//                                   Text(
//                                     'homeScreen6'.tr,
//                                     style: kSize16W400KWhiteColorOutfitRegular
//                                         .copyWith(
//                                         color: AppColors.kCoolGreyColor,
//                                         fontSize: getFont(12)
//                                     ),
//                                   ),
//                                   Obx(() {
//                                     return Text(
//                                       getAttendanceHistoryController.checkInTime
//                                           .value,
//                                       style: const TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     );
//                                   })
//
//
//                                 ],
//                               ),
//                             ),
//
//
//                           ],
//                         ),
//                       ),
//                     ),
//
//
//                   ],
//                 ),
//                 SizedBox(height: getHeight(220)),
//                 GestureDetector(
//                   onTap: () async {
//                     bool shouldShowDialog =
//                     await scanQrCodeController.shouldAskForLocationPermission();
//
//                     if (shouldShowDialog) {
//                       showLocationEnabledDialog();
//                     } else {
//                       Get.to(() => ScanQrcodeScreen());
//                     }
//                   },
//
//                   child: Container(
//                     padding: EdgeInsetsGeometry.symmetric(
//                         horizontal: getWidth(24), vertical: getHeight(24)),
//                     width: getWidth(327),
//                     decoration: BoxDecoration(
//                       color: AppColors.kSkyBlueColor,
//                       borderRadius: BorderRadius.all(Radius.circular(16)),
//                       border: Border.all(
//                           color: AppColors.kLightCoolGreyColor, width: 1),
//                       boxShadow: [
//                         BoxShadow(
//                           color: AppColors.kBlackColor.withOpacity(0.10),
//                           offset: const Offset(0, 10),
//                           blurRadius: 15,
//                           spreadRadius: 0,
//                         ),
//
//                         BoxShadow(
//                           color: AppColors.kBlackColor.withOpacity(0.10),
//                           offset: const Offset(0, 4),
//                           blurRadius: 6,
//                           spreadRadius: 0,
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       children: [
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Image.asset(
//                               AppImages.dragHandleIcon,
//                               width: getWidth(21),
//                               height: getHeight(24),
//                             ),
//
//                             SizedBox(width: getWidth(20)),
//
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   'homeScreen8'.tr,
//                                   style: kSize16W600KBlackColorOutfitSemiBold
//                                       .copyWith(
//                                       fontSize: getFont(18),
//                                       color: AppColors.kWhiteColor
//
//                                   ),
//                                 ),
//
//                                 Text(
//                                   'homeScreen9'.tr,
//                                   style: kSize16W400KWhiteColorOutfitRegular
//                                       .copyWith(
//                                     fontSize: getFont(14),
//
//                                   ),
//                                 ),
//                               ],
//                             ),
//
//
//                           ],
//                         )
//
//
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: getHeight(10)),
//                 GestureDetector(
//                   onTap: () {
//                     Get.toNamed(RouteName.manualEntryScreen);
//                   },
//                   child: Container(
//                     padding: EdgeInsetsGeometry.symmetric(
//                         horizontal: getWidth(29), vertical: getHeight(22)),
//                     width: getWidth(327),
//                     decoration: BoxDecoration(
//                       color: AppColors.kColor1,
//                       borderRadius: BorderRadius.all(Radius.circular(8)),
//                       border: Border.all(
//                           color: AppColors.kLightCoolGreyColor, width: 2),
//                     ),
//                     child: Center(
//                       child: Text(
//                         'homeScreen10'.tr,
//                         style: kSize16W600KBlackColorOutfitSemiBold.copyWith(
//                             fontSize: getFont(14),
//                             color: AppColors.kMidnightBlueColor.withOpacity(0.50)
//
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: getHeight(30)),
//                 Container(
//                   padding: EdgeInsetsGeometry.symmetric(
//                       horizontal: getWidth(21), vertical: getHeight(21)),
//                   width: getWidth(335),
//                   decoration: BoxDecoration(
//                     color: AppColors.kWhiteColor,
//                     borderRadius: BorderRadius.all(Radius.circular(24)),
//                     border: Border.all(
//                         color: AppColors.kLightGreyColor, width: 1),
//                     boxShadow: [
//                       BoxShadow(
//                         color: AppColors.kBlackColor.withOpacity(0.25),
//                         offset: const Offset(0, 1),
//                         blurRadius: 4,
//                         spreadRadius: 0,
//                       ),
//
//                     ],
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text(
//                         'homeScreen11'.tr,
//                         style: kSize20W700KWhiteColorOutfitBold.copyWith(
//                             color: AppColors.kMidnightBlueColor,
//                             fontSize: getFont(16)
//                         ),
//                       ),
//                       Text(
//                         'homeScreen12'.tr,
//                         style: kSize16W400KWhiteColorOutfitRegular.copyWith(
//                             color: AppColors.kCoolGreyColor,
//                             fontSize: getFont(14)
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Get.toNamed(RouteName.leaveRequestScreen);
//                         },
//                         child: Container(
//                           padding: EdgeInsetsGeometry.symmetric(
//                               horizontal: getWidth(12), vertical: getHeight(18)),
//                           width: getWidth(293),
//                           decoration: BoxDecoration(
//                             gradient: LinearGradient(colors: [
//                               AppColors.kVeryLightGreenColor,
//                               AppColors.kLightGreenColor.withOpacity(0.50),
//                             ]),
//
//                             borderRadius: BorderRadius.all(Radius.circular(16)),
//                             border: Border.all(
//                                 color: AppColors.kLightCoolGreyColor, width: 1),
//                           ),
//                           child: Row(
//                             children: [
//                               Container(
//                                 width: getWidth(45),
//                                 height: getHeight(50),
//                                 decoration: BoxDecoration(
//                                   color: AppColors.kGreenColor.withOpacity(0.10),
//                                   borderRadius: BorderRadius.all(
//                                       Radius.circular(12)),
//                                   border: Border.all(
//                                       color: AppColors.kLightCoolGreyColor,
//                                       width: 1),
//                                 ),
//                                 child: Image.asset(AppImages.circleTickIcon),
//
//                               ),
//                               SizedBox(width: getWidth(10)),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     'homeScreen13'.tr,
//                                     style: kSize16W400KWhiteColorOutfitRegular
//                                         .copyWith(
//                                         color: AppColors.kCoolGreyColor,
//                                         fontSize: getFont(13)
//                                     ),
//                                   ),
//                                   Obx(() =>
//                                       Text(
//                                         getAttendanceHistoryController
//                                             .monthlyTotalHours.value,
//                                         style: kSize20W700KWhiteColorOutfitBold
//                                             .copyWith(
//                                             color: AppColors.kMidnightBlueColor,
//                                             fontSize: getFont(24)
//                                         ),
//                                       ),),
//                                 ],
//                               ),
//
//
//                             ],
//                           ),
//                         ),
//                       ),
//
//
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: getHeight(50),)
//
//
//               ],
//             ),
//           );
//         }));
//   }
//
//   void showLocationEnabledDialog() {
//     Get.dialog(
//       Dialog(
//         backgroundColor: AppColors.kWhiteColor,
//         shadowColor: AppColors.kBlackColor.withOpacity(0.10),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16),
//
//         ),
//         child: SizedBox(
//           width: getWidth(335),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 width: getWidth(335),
//                 height: getHeight(188),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)),
//                   color: AppColors.kGradientColor5,
//                   border: Border.all(
//                     color: AppColors.kLightCoolGreyColor,
//                     width: 1,
//                   ),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Container(
//                         width: getWidth(80),
//                         height: getHeight(80),
//                         decoration: BoxDecoration(
//                           color: AppColors.kWhiteColor.withOpacity(0.2),
//                           shape: BoxShape.circle,
//                           border: Border.all(
//                             color: AppColors.kLightCoolGreyColor,
//                             width: 1,
//                           ),
//                         ),
//                         child: Image.asset(AppImages.locationIcon, color: AppColors.kWhiteColor,)
//
//                     ),
//                     SizedBox(height: getHeight(10),),
//                     Text(
//                         'enableLocation1'.tr,
//                         style: kSize20W700KWhiteColorOutfitBold
//                     ),
//
//
//                   ],
//                 ),
//               ),
//               SizedBox(height: getHeight(20),),
//               Padding(
//                 padding:  EdgeInsets.symmetric(horizontal: getWidth(24), vertical: getHeight(34)),
//                 child: Column(
//                   children: [
//                     Text(
//                       'enableLocation2'.tr,
//                       textAlign: TextAlign.center,
//                       style: kSize16W400KWhiteColorOutfitRegular.copyWith(
//                         color: AppColors.kDarkSlateGray,
//                       ),
//                     ),
//
//                     SizedBox(height: getHeight(30),),
//
//                     RoundButton(
//                       onPress: () async{
//
//                         scanQrCodeController.getCurrentLocation();
//                       },
//                       radius: BorderRadius.circular(16),
//                       title: 'enableLocation3'.tr,
//                       textStyle: kSize16W600KBlackColorOutfitSemiBold.copyWith(color: AppColors.kWhiteColor),
//                       buttonColor: AppColors.kSkyBlueColor,
//                       borderColor: AppColors.kLightCoolGreyColor,
//                       width: getWidth(287),
//                       height: getHeight(56),
//
//                     ),
//                     SizedBox(height: getHeight(10),),
//
//                     RoundButton(
//                       onPress: () async{
//
//                         Get.back();
//
//                       },
//                       radius: BorderRadius.circular(16),
//                       title: 'enableLocation4'.tr,
//                       textStyle: kSize16W600KBlackColorOutfitSemiBold.copyWith(color: AppColors.kDarkSlateGray),
//                       buttonColor: AppColors.kLightGrayBackground,
//                       borderColor: AppColors.kLightCoolGreyColor,
//                       width: getWidth(287),
//                       height: getHeight(56),
//
//                     ),
//
//                   ],
//                 ),
//               )
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
