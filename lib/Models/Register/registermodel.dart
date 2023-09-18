// class RegisterModelModel {
//   int? status;
//   String? message;
//   String? errormessage;
//   Response? response;

//   RegisterModelModel(
//       {this.status, this.message, this.response, this.errormessage});

//   RegisterModelModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];

// response = json['response'] != null &&
//         json['response'].runtimeType.toString() != "String"
//     ? Response.fromJson(json['response'])
//     : null;

// if (json['response'].runtimeType.toString() == 'String') {
//   errormessage = json['response'].toString();
// }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     data['message'] = message;
//     data['errormessage'] = errormessage;
//     if (response != null) {
//       data['response'] = response!.toJson();
//     }
//     return data;
//   }
// }

// class Response {
//   int? studnetId;
//   String? studentMob;
//   int? otp;

//   Response({this.studnetId, this.studentMob, this.otp});

//   Response.fromJson(Map<String, dynamic> json) {
//     studnetId = json['studnet_id'];
//     studentMob = json['student_mob'];
//     otp = json['otp'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['studnet_id'] = studnetId;
//     data['student_mob'] = studentMob;
//     data['otp'] = otp;
//     return data;
//   }
// }

class RegisterModelModel {
  int? status;
  String? message;
  String? errormessage;
  Response? response;

  RegisterModelModel(
      {this.status, this.message, this.response, this.errormessage});

  RegisterModelModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    response = json['response'] != null &&
            json['response'].runtimeType.toString() != "String"
        ? Response.fromJson(json['response'])
        : null;

    if (json['response'].runtimeType.toString() == 'String') {
      errormessage = json['response'].toString();
    }
    // response =
    //     json['response'] != null ? Response.fromJson(json['response']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['errormessage'] = errormessage;
    if (response != null) {
      data['response'] = response!.toJson();
    }
    return data;
  }
}

class Response {
  int? studnetId;
  String? studentMob;
  int? otp;
  String? name;

  Response({this.studnetId, this.studentMob, this.otp, this.name});

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
