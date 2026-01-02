/// success : true
/// message : "If an account with that email exists, a password reset link has been sent to your email."

class ForgetPasswordModel {
  ForgetPasswordModel({
      bool? success, 
      String? message,}){
    _success = success;
    _message = message;
}

  ForgetPasswordModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
  }
  bool? _success;
  String? _message;
ForgetPasswordModel copyWith({  bool? success,
  String? message,
}) => ForgetPasswordModel(  success: success ?? _success,
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