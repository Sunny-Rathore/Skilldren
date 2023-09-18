// ignore_for_file: file_names

class StudentRankModel {
  int? status;
  String? message;
  Response? response;

  StudentRankModel({this.status, this.message, this.response});

  StudentRankModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    response =
        json['response'] != null ? Response.fromJson(json['response']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (response != null) {
      data['response'] = response!.toJson();
    }
    return data;
  }
}

class Response {
  String? studentRank;
  String? studentName;
  int? studentXpPoint;
  int? totalXpPoint;

  Response(
      {this.studentRank,
      this.studentName,
      this.studentXpPoint,
      this.totalXpPoint});

  Response.fromJson(Map<String, dynamic> json) {
    studentRank = json['student_rank'];
    studentName = json['student_name'];
    studentXpPoint = json['student_xp_point'];
    totalXpPoint = json['total_xp_point'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['student_rank'] = studentRank;
    data['student_name'] = studentName;
    data['student_xp_point'] = studentXpPoint;
    data['total_xp_point'] = totalXpPoint;
    return data;
  }
}
