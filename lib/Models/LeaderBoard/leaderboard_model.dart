class LeaderBoardModel {
  int? status;
  String? message;
  List<Response>? response;

  LeaderBoardModel({this.status, this.message, this.response});

  LeaderBoardModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['response'] != null) {
      response = <Response>[];
      json['response'].forEach((v) {
        response!.add(Response.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (response != null) {
      data['response'] = response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Response {
  String? studentRank;
  String? studentName;
  int? studentXpPoint;
  String? studentProfileImage;

  Response(
      {this.studentRank,
      this.studentName,
      this.studentXpPoint,
      this.studentProfileImage});

  Response.fromJson(Map<String, dynamic> json) {
    studentRank = json['student_rank'];
    studentName = json['student_name'];
    studentXpPoint = json['student_xp_point'];
    studentProfileImage = json['student_profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['student_rank'] = studentRank;
    data['student_name'] = studentName;
    data['student_xp_point'] = studentXpPoint;
    data['student_profile_image'] = studentProfileImage;
    return data;
  }
}
