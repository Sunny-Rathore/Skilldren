class ReelsdModel {
  int? status;
  String? message;
  List<Response>? response;

  ReelsdModel({this.status, this.message, this.response});

  ReelsdModel.fromJson(Map<String, dynamic> json) {
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
  String? reelId;
  String? reelTitle;
  String? catagoryName;
  String? topicName;
  String? chapterName;
  String? reelVideo;
  String? status;
  String? createDate;
  int? reelTotalLikes;
  bool? liked;

  Response({
    this.reelId,
    this.reelTitle,
    this.catagoryName,
    this.topicName,
    this.chapterName,
    this.reelVideo,
    this.status,
    this.createDate,
    this.reelTotalLikes,
    this.liked = false,
  });

  Response.fromJson(Map<String, dynamic> json) {
    reelId = json['reel_id'];
    reelTitle = json['reel_title'];
    catagoryName = json['catagory_name'];
    topicName = json['topic_name'];
    chapterName = json['chapter_name'];
    reelVideo = json['reel_video'];
    status = json['status'];

    createDate = json['create_date'];
    reelTotalLikes = json['reel_total_likes'];
    liked = json['liked'] = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['reel_id'] = reelId;
    data['reel_title'] = reelTitle;
    data['catagory_name'] = catagoryName;
    data['topic_name'] = topicName;
    data['chapter_name'] = chapterName;
    data['reel_video'] = reelVideo;
    data['status'] = status;

    data['create_date'] = createDate;
    data['reel_total_likes'] = reelTotalLikes;
    data['liked'] = liked;
    return data;
  }
}
