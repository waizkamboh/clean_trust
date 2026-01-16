class GetAppSettingModel {
  bool? success;
  String? message;
  Data? data;

  GetAppSettingModel({this.success, this.message, this.data});

  GetAppSettingModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Settings? settings;

  Data({this.settings});

  Data.fromJson(Map<String, dynamic> json) {
    settings = json['settings'] != null
        ? new Settings.fromJson(json['settings'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.settings != null) {
      data['settings'] = this.settings!.toJson();
    }
    return data;
  }
}

class Settings {
  bool? allowNotifications;
  bool? allowLocation;
  bool? autoSync;

  Settings({this.allowNotifications, this.allowLocation, this.autoSync});

  Settings.fromJson(Map<String, dynamic> json) {
    allowNotifications = json['allow_notifications'];
    allowLocation = json['allow_location'];
    autoSync = json['auto_sync'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['allow_notifications'] = this.allowNotifications;
    data['allow_location'] = this.allowLocation;
    data['auto_sync'] = this.autoSync;
    return data;
  }
}
