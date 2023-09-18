class BatchModel {
  int? status;
  String? message;
  List<Response>? response;

  BatchModel({this.status, this.message, this.response});

  BatchModel.fromJson(Map<String, dynamic> json) {
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
  String? batchId;
  String? batchName;

  Response({this.batchId, this.batchName});

  Response.fromJson(Map<String, dynamic> json) {
    batchId = json['batch_id'];
    batchName = json['batch_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['batch_id'] = batchId;
    data['batch_name'] = batchName;
    return data;
  }
}
