class LoginModel {
  int? status;
  String? message;
  String? errorMessage;
  Response? response;

  LoginModel({this.status, this.message, this.response, this.errorMessage});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    response = json['response'] != null &&
            json['response'].runtimeType.toString() != "String"
        ? Response.fromJson(json['response'])
        : null;

    if (json['response'].runtimeType.toString() == "String") {
      errorMessage = json['response'].toString();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['errorMessage'] = errorMessage;
    if (response != null) {
      data['response'] = response!.toJson();
    }
    return data;
  }
}

class Response {
  String? studnetId;
  String? studentMob;
  String? name;
  int? otp;

  Response({this.studnetId, this.studentMob, this.otp});

  Response.fromJson(Map<String, dynamic> json) {
    studnetId = json['studnet_id'];
    studentMob = json['student_mob'];
    otp = json['otp'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['studnet_id'] = studnetId;
    data['student_mob'] = studentMob;
    data['otp'] = otp;
    data['name'] = name;
    return data;
  }
}
