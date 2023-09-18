class ManageVideoModel {
  int? status;
  String? message;
  List<Response>? response;

  ManageVideoModel({this.status, this.message, this.response});

  ManageVideoModel.fromJson(Map<String, dynamic> json) {
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
  String? videoId;
  String? videoTitle;
  String? videoImage;
  String? videoLink;

  Response({this.videoId, this.videoTitle, this.videoImage, this.videoLink});

  Response.fromJson(Map<String, dynamic> json) {
    videoId = json['video_id'];
    videoTitle = json['video_title'];
    videoImage = json['video_image'];
    videoLink = json['video_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['video_id'] = videoId;
    data['video_title'] = videoTitle;
    data['video_image'] = videoImage;
    data['video_link'] = videoLink;
    return data;
  }
}
