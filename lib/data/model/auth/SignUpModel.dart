class SignUpModel {
  bool? success;
  String? message;
  bool? requiresApproval;

  SignUpModel({this.success, this.message, this.requiresApproval});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    requiresApproval = json['requiresApproval'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['requiresApproval'] = this.requiresApproval;
    return data;
  }
}
