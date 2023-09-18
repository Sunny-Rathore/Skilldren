class TransactionModel {
  int? status;
  String? message;
  List<Response>? response;

  TransactionModel({this.status, this.message, this.response});

  TransactionModel.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? planId;
  String? studentId;
  String? transactionNumber;
  String? amount;
  String? paymentStatus;
  String? expiryDate;
  String? createdAt;
  String? updatedAt;

  Response(
      {this.id,
      this.planId,
      this.studentId,
      this.transactionNumber,
      this.amount,
      this.paymentStatus,
      this.expiryDate,
      this.createdAt,
      this.updatedAt});

  Response.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    planId = json['plan_id'];
    studentId = json['student_id'];
    transactionNumber = json['transaction_number'];
    amount = json['amount'];
    paymentStatus = json['payment_status'];
    expiryDate = json['expiry_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['plan_id'] = planId;
    data['student_id'] = studentId;
    data['transaction_number'] = transactionNumber;
    data['amount'] = amount;
    data['payment_status'] = paymentStatus;
    data['expiry_date'] = expiryDate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
