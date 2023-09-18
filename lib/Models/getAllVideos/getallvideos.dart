// ignore_for_file: camel_case_types

class getAll_Video_Model {
  String? status;
  String? msg;
  List<Response>? response;

  getAll_Video_Model({this.status, this.msg, this.response});

  getAll_Video_Model.fromJson(Map<String, dynamic> json) {
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
  String? vId;
  String? videoTitle;
  String? vImage;
  String? videoFile;

  Response({this.vId, this.videoTitle, this.vImage, this.videoFile});

  Response.fromJson(Map<String, dynamic> json) {
    vId = json['v_id'];
    videoTitle = json['video_title'];
    vImage = json['v_image'];
    videoFile = json['video_file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['v_id'] = vId;
    data['video_title'] = videoTitle;
    data['v_image'] = vImage;
    data['video_file'] = videoFile;
    return data;
  }
}
