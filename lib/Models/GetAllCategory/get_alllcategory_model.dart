class GetAllcategoryModel {
  String? status;
  String? msg;

  List<Response>? response;

  GetAllcategoryModel({this.status, this.msg, this.response});

  GetAllcategoryModel.fromJson(Map<String, dynamic> json) {
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
  String? cid;
  String? catName;
  String? cImage;

  Response({this.cid, this.catName, this.cImage});

  Response.fromJson(Map<String, dynamic> json) {
    cid = json['cid'];
    catName = json['cat_name'];
    cImage = json['c_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cid'] = cid;
    data['cat_name'] = catName;
    data['c_image'] = cImage;
    return data;
  }
}
