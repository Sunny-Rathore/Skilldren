class GetAllTopicModel {
  String? status;
  String? msg;
  String? errormsg;
  List<Response>? response;

  GetAllTopicModel({this.status, this.msg, this.response});

  GetAllTopicModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['response'] != null &&
        json['response'].runtimeType.toString() != "String") {
      response = <Response>[];
      json['response'].forEach((v) {
        response!.add(Response.fromJson(v));
      });
    }
    if (json['response'].runtimeType.toString() == "String") {
      errormsg = json['response'].toString();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    data['errormsg'] = errormsg;
    if (response != null) {
      data['response'] = response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Response {
  String? tid;
  String? topicName;
  String? topicIcon;
  String? categoryId;
  String? categoryName;

  Response(
      {this.tid,
      this.topicName,
      this.topicIcon,
      this.categoryId,
      this.categoryName});

  Response.fromJson(Map<String, dynamic> json) {
    tid = json['tid'];
    topicName = json['topic_name'];
    topicIcon = json['topic_icon'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tid'] = tid;
    data['topic_name'] = topicName;
    data['topic_icon'] = topicIcon;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    return data;
  }
}
