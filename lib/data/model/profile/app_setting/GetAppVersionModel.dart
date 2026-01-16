class GetAppVersionModel {
  bool? success;
  String? message;
  Data? data;

  GetAppVersionModel({this.success, this.message, this.data});

  GetAppVersionModel.fromJson(Map<String, dynamic> json) {
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
  AppVersion? appVersion;

  Data({this.appVersion});

  Data.fromJson(Map<String, dynamic> json) {
    appVersion = json['app_version'] != null
        ? new AppVersion.fromJson(json['app_version'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.appVersion != null) {
      data['app_version'] = this.appVersion!.toJson();
    }
    return data;
  }
}

class AppVersion {
  String? version;
  String? buildNumber;
  String? lastUpdated;
  bool? isLatest;

  AppVersion({this.version, this.buildNumber, this.lastUpdated, this.isLatest});

  AppVersion.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    buildNumber = json['build_number'];
    lastUpdated = json['last_updated'];
    isLatest = json['is_latest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['version'] = this.version;
    data['build_number'] = this.buildNumber;
    data['last_updated'] = this.lastUpdated;
    data['is_latest'] = this.isLatest;
    return data;
  }
}
