class LiveClassModel {
  int? status;
  String? message;
  String? errorMsg;
  List<Response>? response;

  LiveClassModel({this.status, this.message, this.response, this.errorMsg});

  LiveClassModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    errorMsg = json['errorMsg'];
    if (json['response'] != null &&
        json['response'].runtimeType.toString() != 'String') {
      response = <Response>[];
      json['response'].forEach((v) {
        response!.add(Response.fromJson(v));
      });
    }
    if (json['response'].runtimeType.toString() == "String") {
      errorMsg = json['response'].toString();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['errorMsg'] = errorMsg;
    if (response != null) {
      data['response'] = response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Response {
  String? id;
  String? title;
  String? link;
  String? classStatus;
  String? startClassDate;
  String? startClassTime;
  String? description;
  String? batch;

  Response(
      {this.id,
      this.title,
      this.link,
      this.classStatus,
      this.startClassDate,
      this.startClassTime,
      this.description,
      this.batch});

  Response.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    link = json['link'];
    classStatus = json['class_status'];
    startClassDate = json['start_class_date'];
    startClassTime = json['start_class_time'];
    description = json['description'];
    batch = json['batch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['link'] = link;
    data['class_status'] = classStatus;
    data['start_class_date'] = startClassDate;
    data['start_class_time'] = startClassTime;
    data['description'] = description;
    data['batch'] = batch;
    return data;
  }
}
