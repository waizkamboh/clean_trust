class GetUnreadCountModel {
  bool? success;
  String? message;
  UnreadData? data;

  GetUnreadCountModel({this.success, this.message, this.data});

  GetUnreadCountModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data =
    json['data'] != null ? UnreadData.fromJson(json['data']) : null;
  }
}

class UnreadData {
  int? unreadCount;

  UnreadData({this.unreadCount});

  UnreadData.fromJson(Map<String, dynamic> json) {
    unreadCount = json['unread_count'];
  }
}
