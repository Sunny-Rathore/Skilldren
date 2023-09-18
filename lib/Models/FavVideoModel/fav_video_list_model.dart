class FavVideoListModel {
  int? status;
  String? message;
  List<Response>? response;

  FavVideoListModel({this.status, this.message, this.response});

  FavVideoListModel.fromJson(Map<String, dynamic> json) {
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
  String? favoriteId;
  String? videoThumbnail;
  String? video;

  Response({this.favoriteId, this.videoThumbnail, this.video});

  Response.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    videoThumbnail = json['video_thumbnail'];
    video = json['video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['favorite_id'] = favoriteId;
    data['video_thumbnail'] = videoThumbnail;
    data['video'] = video;
    return data;
  }
}
