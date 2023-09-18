// ignore_for_file: camel_case_types

class Competition_model {
  String? status;
  String? msg;
  List<Response>? response;

  Competition_model({this.status, this.msg, this.response});

  Competition_model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
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
    data['msg'] = msg;
    if (response != null) {
      data['response'] = response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Response {
  String? cId;
  String? cTitle;
  String? cUrl;
  String? cBanner;
  String? cDescription;
  bool? istrue = false;

  Response(
      {this.cId,
      this.cTitle,
      this.cUrl,
      this.cBanner,
      this.cDescription,
      this.istrue});

  Response.fromJson(Map<String, dynamic> json) {
    cId = json['c_id'];
    cTitle = json['c_title'];
    cUrl = json['c_url'];
    cBanner = json['c_banner'];
    cDescription = json['c_description'];
    istrue = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['c_id'] = cId;
    data['c_title'] = cTitle;
    data['c_url'] = cUrl;
    data['c_banner'] = cBanner;
    data['c_description'] = cDescription;
    data['istrue'] = istrue;
    return data;
  }
}
