class GetAllChapterModel {
  int? status;
  String? message;
  String? errormessage;
  List<Response>? response;

  GetAllChapterModel(
      {this.status, this.message, this.response, this.errormessage});

  GetAllChapterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['response'] != null &&
        json['response'].runtimeType.toString() != "String") {
      response = <Response>[];
      json['response'].forEach((v) {
        response!.add(Response.fromJson(v));
      });
    }
    if (json['response'].runtimeType.toString() == "String") {
      errormessage = json['response'].toString();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['errormessage'] = errormessage;
    if (response != null) {
      data['response'] = response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Response {
  String? chapterId;
  String? categoryName;
  String? topicName;
  String? chapterName;
  String? chapterSubTitle;
  String? chapterLevel;
  String? chapterPdfFile;
  String? chapterIcon;

  Response(
      {this.chapterId,
      this.categoryName,
      this.topicName,
      this.chapterName,
      this.chapterSubTitle,
      this.chapterLevel,
      this.chapterPdfFile,
      this.chapterIcon});

  Response.fromJson(Map<String, dynamic> json) {
    chapterId = json['chapter_id'];
    categoryName = json['category_name'];
    topicName = json['topic_name'];
    chapterName = json['chapter_name'];
    chapterSubTitle = json['chapter_sub_title'];
    chapterLevel = json['chapter_level'];
    chapterPdfFile = json['chapter_pdf_file'];
    chapterIcon = json['chapter_icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chapter_id'] = chapterId;
    data['category_name'] = categoryName;
    data['topic_name'] = topicName;
    data['chapter_name'] = chapterName;
    data['chapter_sub_title'] = chapterSubTitle;
    data['chapter_level'] = chapterLevel;
    data['chapter_pdf_file'] = chapterPdfFile;
    data['chapter_icon'] = chapterIcon;
    return data;
  }
}

// class GetAllChapterModel {
//   int? status;
//   String? message;
//   String? errormessage;
//   List<Response>? response;

//   GetAllChapterModel(
//       {this.status, this.message, this.response, this.errormessage});

//   GetAllChapterModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     if (json['response'] != null &&
//         json['response'].runtimeType.toString() != "String") {
//       response = <Response>[];
//       json['response'].forEach((v) {
//         response!.add(Response.fromJson(v));
//       });
//     }
    // if (json['response'].runtimeType.toString() == "String") {
    //   errormessage = json['response'].toString();
    // }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     data['message'] = message;
//     data['errormessage'] = errormessage;
//     if (response != null) {
//       data['response'] = response!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Response {
//   String? chapterId;
//   String? categoryName;
//   String? topicName;
//   String? chapterName;
//   String? chapterDescription;
//   String? chapterLevel;
//   String? pdfFile;

//   Response(
//       {this.chapterId,
//       this.categoryName,
//       this.topicName,
//       this.chapterName,
//       this.chapterDescription,
//       this.chapterLevel,
//       this.pdfFile});

//   Response.fromJson(Map<String, dynamic> json) {
//     chapterId = json['chapter_id'];
//     categoryName = json['category_name'];
//     topicName = json['topic_name'];
//     chapterName = json['chapter_name'];
//     chapterDescription = json['chapter_description'];
//     chapterLevel = json['chapter_level'];
//     pdfFile = json['pdf_file'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['chapter_id'] = chapterId;
//     data['category_name'] = categoryName;
//     data['topic_name'] = topicName;
//     data['chapter_name'] = chapterName;
//     data['chapter_description'] = chapterDescription;
//     data['chapter_level'] = chapterLevel;
//     data['pdf_file'] = pdfFile;
//     return data;
//   }
// }
