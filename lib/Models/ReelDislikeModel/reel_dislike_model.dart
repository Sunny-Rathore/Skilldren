class RealDislikeModelModel {
  int? status;
  String? message;
  String? response;

  RealDislikeModelModel({this.status, this.message, this.response});

  RealDislikeModelModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    response = json['response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['response'] = response;
    return data;
  }
}
