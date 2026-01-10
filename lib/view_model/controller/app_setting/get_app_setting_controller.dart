import 'package:clean_trust/data/repository/app_setting/get_app_version_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../data/model/app_setting/GetAppSettingModel.dart';
import '../../../data/model/app_setting/GetAppVersionModel.dart';
import '../../../data/repository/app_setting/get_app_setting.dart';
import '../../../data/repository/app_setting/update_app_setting_repository.dart';
import '../../../util/app_images.dart';
import '../../user_preference/user_preference.dart';
import '../../../util/custom_snackbar.dart';

class AppSettingController extends GetxController {
  final UserPreference _userPreference = UserPreference();
  final GetAppSettingRepository _repo = GetAppSettingRepository();
  final GetAppVersionRepository _repo1 = GetAppVersionRepository();
  final UpdateAppSettingRepository _updateRepo = UpdateAppSettingRepository();

  RxBool allowNotifications = false.obs;
  RxBool allowLocation = false.obs;
  RxBool autoSync = false.obs;

  RxString appVersion = ''.obs;
  RxString buildNumber = ''.obs;
  RxString lastUpdated = ''.obs;

  RxBool isFetching = false.obs;
  RxBool isUpdating = false.obs;


  @override
  void onInit() {
    super.onInit();
    _loadFromCache();
    fetchFromApi();
    fetchAppVersion();

  }

  Future<void> _loadFromCache() async {
    allowNotifications.value = await _userPreference.getAllowNotifications();
    allowLocation.value = await _userPreference.getAllowLocation();
    autoSync.value = await _userPreference.getAutoSync();

    appVersion.value = await _userPreference.getAppVersion() ?? '';
    buildNumber.value = await _userPreference.getBuildNumber() ?? '';
    lastUpdated.value = await _userPreference.getLastUpdated() ?? '';
  }

  Future<void> fetchFromApi() async {
    try {
      isFetching.value = true;
      final token = await _userPreference.getToken();
      if (token == null || token.isEmpty) return;

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final GetAppSettingModel response = await _repo.getAppSettingApi(headers);
      final settings = response.data?.settings;
      if (settings == null) return;

      allowNotifications.value = settings.allowNotifications ?? false;
      allowLocation.value = settings.allowLocation ?? false;
      autoSync.value = settings.autoSync ?? false;

      await _userPreference.saveSettings(
        allowNotifications: allowNotifications.value,
        allowLocation: allowLocation.value,
        autoSync: autoSync.value,
      );
    } catch (e, s) {
      if (kDebugMode) print(s);
    } finally {
      isFetching.value = false;
    }
  }
  String getSwitchIcon(bool value) {
    return value
        ? AppImages.switchButtonIcon
        : AppImages.switchButtonIcon1;
  }


  Future<void> fetchAppVersion() async {
    try {
      isFetching.value = true;

      final token = await _userPreference.getToken();
      if (token == null || token.isEmpty) return;

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final GetAppVersionModel response =
      await _repo1.getAppVersionApi(headers);

      final versionData = response.data?.appVersion;
      if (versionData == null) return;

      appVersion.value = versionData.version ?? '';
      buildNumber.value = versionData.buildNumber ?? '';
      lastUpdated.value = versionData.lastUpdated ?? '';

      await _userPreference.saveAppVersion(appVersion.value);
      await _userPreference.saveBuildNumber(buildNumber.value);
      await _userPreference.saveLastUpdated(lastUpdated.value);
    } catch (e, s) {
      if (kDebugMode) print(s);
    } finally {
      isFetching.value = false;
    }
  }


  Future<void> updateAppSetting({
    bool? notifications,
    bool? location,
    bool? sync,
  }) async {
    try {
      isUpdating.value = true;

      final token = await _userPreference.getToken();
      if (token == null || token.isEmpty) return;

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final body = {
        "allow_notifications": notifications ?? allowNotifications.value,
        "allow_location": location ?? allowLocation.value,
        "auto_sync": sync ?? autoSync.value,
      };

      final response = await _updateRepo.updateAppSettingApi(body, headers);

      if (response.success == true) {
        // ✅ Update local state
        allowNotifications.value = body["allow_notifications"]!;
        allowLocation.value = body["allow_location"]!;
        autoSync.value = body["auto_sync"]!;

        await _userPreference.saveSettings(
          allowNotifications: allowNotifications.value,
          allowLocation: allowLocation.value,
          autoSync: autoSync.value,
        );
      } else {
        showCustomSnackBar(response.message ?? "Failed to update");
      }
    } catch (e, s) {
      if (kDebugMode) print(s);
      showCustomSnackBar("Something went wrong");
    } finally {
      isUpdating.value = false;
    }
  }
}
