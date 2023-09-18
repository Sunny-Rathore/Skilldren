class AddFavModel {
  int? status;
  String? message;
  String? response;

  AddFavModel({this.status, this.message, this.response});

  AddFavModel.fromJson(Map<String, dynamic> json) {
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
