class SubPalnListModel {
  int? status;
  String? message;
  List<Response>? response;

  SubPalnListModel({this.status, this.message, this.response});

  SubPalnListModel.fromJson(Map<String, dynamic> json) {
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
  SubscriptionPlan? subscriptionPlan;
  List<String>? subscriptionPlanFeatures;

  Response({this.subscriptionPlan, this.subscriptionPlanFeatures});

  Response.fromJson(Map<String, dynamic> json) {
    subscriptionPlan = json['subscription_plan'] != null
        ? SubscriptionPlan.fromJson(json['subscription_plan'])
        : null;
    subscriptionPlanFeatures =
        json['subscription_plan_features'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (subscriptionPlan != null) {
      data['subscription_plan'] = subscriptionPlan!.toJson();
    }
    data['subscription_plan_features'] = subscriptionPlanFeatures;
    return data;
  }
}

class SubscriptionPlan {
  String? planId;
  String? name;
  String? duration;
  String? subscriptionType;
  String? price;
  String? discount;
  String? offeredPrice;
  String? perDayPrice;

  SubscriptionPlan(
      {this.planId,
      this.name,
      this.duration,
      this.subscriptionType,
      this.price,
      this.discount,
      this.offeredPrice,
      this.perDayPrice});

  SubscriptionPlan.fromJson(Map<String, dynamic> json) {
    planId = json['plan_id'];
    name = json['name'];
    duration = json['duration'];
    subscriptionType = json['subscription_type'];
    price = json['price'];
    discount = json['discount'];
    offeredPrice = json['offered_price'];
    perDayPrice = json['per_day_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['plan_id'] = planId;
    data['name'] = name;
    data['duration'] = duration;
    data['subscription_type'] = subscriptionType;
    data['price'] = price;
    data['discount'] = discount;
    data['offered_price'] = offeredPrice;
    data['per_day_price'] = perDayPrice;
    return data;
  }
}



