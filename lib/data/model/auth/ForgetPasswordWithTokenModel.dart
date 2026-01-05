import 'dart:convert';
/// success : true
/// message : "Password reset successfully. You can now login with your new password."

ForgetPasswordWithTokenModel forgetPasswordWithTokenModelFromJson(String str) => ForgetPasswordWithTokenModel.fromJson(json.decode(str));
String forgetPasswordWithTokenModelToJson(ForgetPasswordWithTokenModel data) => json.encode(data.toJson());
class ForgetPasswordWithTokenModel {
  ForgetPasswordWithTokenModel({
      bool? success, 
      String? message,}){
    _success = success;
    _message = message;
}

  ForgetPasswordWithTokenModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
  }
  bool? _success;
  String? _message;
ForgetPasswordWithTokenModel copyWith({  bool? success,
  String? message,
}) => ForgetPasswordWithTokenModel(  success: success ?? _success,
  message: message ?? _message,
);
  bool? get success => _success;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    return map;
  }

}