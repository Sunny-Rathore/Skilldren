class StudentInfoModel {
  int? status;
  String? message;
  Response? response;

  StudentInfoModel({this.status, this.message, this.response});

  StudentInfoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    response =
        json['response'] != null ? Response.fromJson(json['response']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (response != null) {
      data['response'] = response!.toJson();
    }
    return data;
  }
}

class Response {
  StudentInfo? studentInfo;
  SubscriptionInfo? subscriptionInfo;
  String? subscriptionMsg;
  String? certificateMsg;
  List<CertificateList>? certificateList;

  Response(
      {this.studentInfo,
      this.subscriptionInfo,
      this.certificateList,
      this.certificateMsg,
      this.subscriptionMsg});

  Response.fromJson(Map<String, dynamic> json) {
    studentInfo = json['studentInfo'] != null
        ? StudentInfo.fromJson(json['studentInfo'])
        : null;
    subscriptionInfo = json['subscriptionInfo'] != null &&
            json['subscriptionInfo'].runtimeType.toString() != "String"
        ? SubscriptionInfo.fromJson(json['subscriptionInfo'])
        : null;
    if (json['certificateList'] != null &&
        json['certificateList'].runtimeType.toString() != 'String') {
      certificateList = <CertificateList>[];
      json['certificateList'].forEach((v) {
        certificateList!.add(CertificateList.fromJson(v));
      });
    }
    if (json['certificateList'].runtimeType.toString() == 'String') {
      certificateMsg = json['certificateList'].toString();
    }
    if (json['subscriptionInfo'].runtimeType.toString() == 'String') {
      subscriptionMsg = json['subscriptionInfo'].toString();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['certificateMsg'] = certificateMsg;
    data['subscriptionMsg'] = subscriptionMsg;
    if (studentInfo != null) {
      data['studentInfo'] = studentInfo!.toJson();
    }
    if (subscriptionInfo != null) {
      data['subscriptionInfo'] = subscriptionInfo!.toJson();
    }
    if (certificateList != null) {
      data['certificateList'] =
          certificateList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StudentInfo {
  String? studentId;
  String? refCode;
  String? firstName;
  String? lastName;
  String? mobile;
  String? email;
  String? dateOfBirth;
  String? age;
  String? grade;
  String? profileImage;
  String? address;
  String? country;
  String? totalPoints;
  String? planExpiryDate;
  String? stateId;
  String? stateName;
  String? districtId;
  String? districtName;
  String? cityId;
  String? cityName;
  String? pincodeId;
  String? pincodeName;

  StudentInfo(
      {this.studentId,
      this.refCode,
      this.firstName,
      this.lastName,
      this.mobile,
      this.email,
      this.dateOfBirth,
      this.age,
      this.grade,
      this.profileImage,
      this.address,
      this.country,
      this.totalPoints,
      this.planExpiryDate,
      this.stateId,
      this.stateName,
      this.districtId,
      this.districtName,
      this.cityId,
      this.cityName,
      this.pincodeId,
      this.pincodeName});

  StudentInfo.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    refCode = json['ref_code'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobile = json['mobile'];
    email = json['email'];
    dateOfBirth = json['date_of_birth'];
    age = json['age'];
    grade = json['grade'];
    profileImage = json['profile_image'];
    address = json['address'];
    country = json['country'];
    totalPoints = json['total_points'];
    planExpiryDate = json['plan_expiry_date'];
    stateId = json['state_id'];
    stateName = json['state_name'];
    districtId = json['district_id'];
    districtName = json['district_name'];
    cityId = json['city_id'];
    cityName = json['city_name'];
    pincodeId = json['pincode_id'];
    pincodeName = json['pincode_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['student_id'] = studentId;
    data['ref_code'] = refCode;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['mobile'] = mobile;
    data['email'] = email;
    data['date_of_birth'] = dateOfBirth;
    data['age'] = age;
    data['grade'] = grade;
    data['profile_image'] = profileImage;
    data['address'] = address;
    data['country'] = country;
    data['total_points'] = totalPoints;
    data['plan_expiry_date'] = planExpiryDate;
    data['state_id'] = stateId;
    data['state_name'] = stateName;
    data['district_id'] = districtId;
    data['district_name'] = districtName;
    data['city_id'] = cityId;
    data['city_name'] = cityName;
    data['pincode_id'] = pincodeId;
    data['pincode_name'] = pincodeName;
    return data;
  }
}

class SubscriptionInfo {
  String? subscriptionId;
  String? subscriptionTransactionNumber;
  String? subscriptionPaymentStatus;
  String? subscriptionExpiryDate;
  String? subscriptionPurchaseDate;
  String? subscriptionName;
  String? subscriptionSubTitle;
  String? subscriptionDuration;
  String? subscriptionType;
  String? subscriptionPrice;
  String? subscriptionDiscount;
  String? subscriptionOfferedPrice;
  String? subscriptionPerDayPrice;

  SubscriptionInfo(
      {this.subscriptionId,
      this.subscriptionTransactionNumber,
      this.subscriptionPaymentStatus,
      this.subscriptionExpiryDate,
      this.subscriptionPurchaseDate,
      this.subscriptionName,
      this.subscriptionSubTitle,
      this.subscriptionDuration,
      this.subscriptionType,
      this.subscriptionPrice,
      this.subscriptionDiscount,
      this.subscriptionOfferedPrice,
      this.subscriptionPerDayPrice});

  SubscriptionInfo.fromJson(Map<String, dynamic> json) {
    subscriptionId = json['subscription_id'];
    subscriptionTransactionNumber = json['subscription_transaction_number'];
    subscriptionPaymentStatus = json['subscription_payment_status'];
    subscriptionExpiryDate = json['subscription_expiry_date'];
    subscriptionPurchaseDate = json['subscription_purchase_date'];
    subscriptionName = json['subscription_name'];
    subscriptionSubTitle = json['subscription_sub_title'];
    subscriptionDuration = json['subscription_duration'];
    subscriptionType = json['subscription_type'];
    subscriptionPrice = json['subscription_price'];
    subscriptionDiscount = json['subscription_discount'];
    subscriptionOfferedPrice = json['subscription_offered_price'];
    subscriptionPerDayPrice = json['subscription_per_day_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subscription_id'] = subscriptionId;
    data['subscription_transaction_number'] = subscriptionTransactionNumber;
    data['subscription_payment_status'] = subscriptionPaymentStatus;
    data['subscription_expiry_date'] = subscriptionExpiryDate;
    data['subscription_purchase_date'] = subscriptionPurchaseDate;
    data['subscription_name'] = subscriptionName;
    data['subscription_sub_title'] = subscriptionSubTitle;
    data['subscription_duration'] = subscriptionDuration;
    data['subscription_type'] = subscriptionType;
    data['subscription_price'] = subscriptionPrice;
    data['subscription_discount'] = subscriptionDiscount;
    data['subscription_offered_price'] = subscriptionOfferedPrice;
    data['subscription_per_day_price'] = subscriptionPerDayPrice;
    return data;
  }
}

class CertificateList {
  String? certificateId;
  String? certificateTitle;
  String? certificateImage;
  String? certificateDate;

  CertificateList(
      {this.certificateId,
      this.certificateTitle,
      this.certificateImage,
      this.certificateDate});

  CertificateList.fromJson(Map<String, dynamic> json) {
    certificateId = json['certificate_id'];
    certificateTitle = json['certificate_title'];
    certificateImage = json['certificate_image'];
    certificateDate = json['certificate_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['certificate_id'] = certificateId;
    data['certificate_title'] = certificateTitle;
    data['certificate_image'] = certificateImage;
    data['certificate_date'] = certificateDate;
    return data;
  }
}




// class StudentInfoModel {
//   int? status;
//   String? message;
//   Response? response;

//   StudentInfoModel({this.status, this.message, this.response});

//   StudentInfoModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     response =
//         json['response'] != null ? Response.fromJson(json['response']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     data['message'] = message;
//     if (response != null) {
//       data['response'] = response!.toJson();
//     }
//     return data;
//   }
// }

// class Response {
//   StudentInfo? studentInfo;
//   SubscriptionInfo? subscriptionInfo;
//   List<CertificateList>? certificateList;

//   Response({this.studentInfo, this.subscriptionInfo, this.certificateList});

//   Response.fromJson(Map<String, dynamic> json) {
//     studentInfo = json['studentInfo'] != null
//         ? StudentInfo.fromJson(json['studentInfo'])
//         : null;
//     subscriptionInfo = json['subscriptionInfo'] != null
//         ? SubscriptionInfo.fromJson(json['subscriptionInfo'])
//         : null;
//     if (json['certificateList'] != null) {
//       certificateList = <CertificateList>[];
//       json['certificateList'].forEach((v) {
//         certificateList!.add(CertificateList.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (studentInfo != null) {
//       data['studentInfo'] = studentInfo!.toJson();
//     }
//     if (subscriptionInfo != null) {
//       data['subscriptionInfo'] = subscriptionInfo!.toJson();
//     }
//     if (certificateList != null) {
//       data['certificateList'] =
//           certificateList!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class StudentInfo {
//   String? studentId;
//   String? refCode;
//   String? firstName;
//   String? lastName;
//   String? mobile;
//   String? email;
//   String? dateOfBirth;
//   String? age;
//   String? grade;
//   String? profileImage;
//   String? address;
//   String? country;
//   String? totalPoints;
//   String? planExpiryDate;
//   String? stateId;
//   String? stateName;
//   String? districtId;
//   String? districtName;
//   String? cityId;
//   String? cityName;
//   String? pincodeId;
//   String? pincodeName;

//   StudentInfo(
//       {this.studentId,
//       this.refCode,
//       this.firstName,
//       this.lastName,
//       this.mobile,
//       this.email,
//       this.dateOfBirth,
//       this.age,
//       this.profileImage,
//       this.address,
//       this.country,
//       this.totalPoints,
//       this.planExpiryDate,
//       this.stateId,
//       this.stateName,
//       this.districtId,
//       this.districtName,
//       this.cityId,
//       this.cityName,
//       this.pincodeId,
//       this.pincodeName,
//       this.grade});

//   StudentInfo.fromJson(Map<String, dynamic> json) {
//     studentId = json['student_id'];
//     refCode = json['ref_code'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     mobile = json['mobile'];
//     email = json['email'];
//     dateOfBirth = json['date_of_birth'];
//     age = json['age'];
//     grade = json['grade'];
//     profileImage = json['profile_image'];
//     address = json['address'];
//     country = json['country'];
//     totalPoints = json['total_points'];
//     planExpiryDate = json['plan_expiry_date'];
//     stateId = json['state_id'];
//     stateName = json['state_name'];
//     districtId = json['district_id'];
//     districtName = json['district_name'];
//     cityId = json['city_id'];
//     cityName = json['city_name'];
//     pincodeId = json['pincode_id'];
//     pincodeName = json['pincode_name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['student_id'] = studentId;
//     data['ref_code'] = refCode;
//     data['first_name'] = firstName;
//     data['last_name'] = lastName;
//     data['mobile'] = mobile;
//     data['email'] = email;
//     data['date_of_birth'] = dateOfBirth;
//     data['age'] = age;
//     data['grade'] = grade;
//     data['profile_image'] = profileImage;
//     data['address'] = address;
//     data['country'] = country;
//     data['total_points'] = totalPoints;
//     data['plan_expiry_date'] = planExpiryDate;
//     data['state_id'] = stateId;
//     data['state_name'] = stateName;
//     data['district_id'] = districtId;
//     data['district_name'] = districtName;
//     data['city_id'] = cityId;
//     data['city_name'] = cityName;
//     data['pincode_id'] = pincodeId;
//     data['pincode_name'] = pincodeName;
//     return data;
//   }
// }

// class SubscriptionInfo {
//   String? subscriptionMgs;

//   SubscriptionInfo({this.subscriptionMgs});

//   SubscriptionInfo.fromJson(Map<String, dynamic> json) {
//     subscriptionMgs = json['subscription_mgs'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['subscription_mgs'] = subscriptionMgs;
//     return data;
//   }
// }

// class CertificateList {
//   String? certificateId;
//   String? certificateTitle;
//   String? certificateImage;
//   String? certificateDate;
//   String? certificatemgs;
//   CertificateList(
//       {this.certificateId,
//       this.certificateTitle,
//       this.certificateImage,
//       this.certificateDate,
//       this.certificatemgs});

//   CertificateList.fromJson(Map<String, dynamic> json) {
//     certificateId = json['certificate_id'];
//     certificateTitle = json['certificate_title'];
//     certificateImage = json['certificate_image'];
//     certificateDate = json['certificate_date'];
//     certificatemgs = json['certificate_mgs'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['certificate_id'] = certificateId;
//     data['certificate_title'] = certificateTitle;
//     data['certificate_image'] = certificateImage;
//     data['certificate_date'] = certificateDate;
//     data['certificate_mgs'] = certificatemgs;
//     return data;
//   }
// }
