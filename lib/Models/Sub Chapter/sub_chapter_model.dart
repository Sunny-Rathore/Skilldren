class SubChapterModel {
  int? status;
  String? message;
  String? errormsg;
  List<Response>? response;

  SubChapterModel({this.status, this.message, this.response, this.errormsg});

  SubChapterModel.fromJson(Map<String, dynamic> json) {
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
      errormsg = json['response'].toString();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['errormsg'] = errormsg;
    if (response != null) {
      data['response'] = response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Response {
  String? subChapterId;
  String? categoryName;
  String? topicName;
  String? chapterName;
  String? chapterSubTitle;
  String? chapterLevel;
  String? chapterPdfFile;
  String? chapterIcon;
  String? subChapterName;
  String? subChapterSubTitle;
  String? subChapterXpPoint;
  String? subChapterVideoThumbnail;
  String? subChapterVideoLink;
  String? subChapterDescription;

  Response(
      {this.subChapterId,
      this.categoryName,
      this.topicName,
      this.chapterName,
      this.chapterSubTitle,
      this.chapterLevel,
      this.chapterPdfFile,
      this.chapterIcon,
      this.subChapterName,
      this.subChapterSubTitle,
      this.subChapterXpPoint,
      this.subChapterVideoThumbnail,
      this.subChapterVideoLink,
      this.subChapterDescription});

  Response.fromJson(Map<String, dynamic> json) {
    subChapterId = json['sub_chapter_id'];
    categoryName = json['category_name'];
    topicName = json['topic_name'];
    chapterName = json['chapter_name'];
    chapterSubTitle = json['chapter_sub_title'];
    chapterLevel = json['chapter_level'];
    chapterPdfFile = json['chapter_pdf_file'];
    chapterIcon = json['chapter_icon'];
    subChapterName = json['sub_chapter_name'];
    subChapterSubTitle = json['sub_chapter_sub_title'];
    subChapterXpPoint = json['sub_chapter_xp_point'];
    subChapterVideoThumbnail = json['sub_chapter_video_thumbnail'];
    subChapterVideoLink = json['sub_chapter_video_link'];
    subChapterDescription = json['sub_chapter_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sub_chapter_id'] = subChapterId;
    data['category_name'] = categoryName;
    data['topic_name'] = topicName;
    data['chapter_name'] = chapterName;
    data['chapter_sub_title'] = chapterSubTitle;
    data['chapter_level'] = chapterLevel;
    data['chapter_pdf_file'] = chapterPdfFile;
    data['chapter_icon'] = chapterIcon;
    data['sub_chapter_name'] = subChapterName;
    data['sub_chapter_sub_title'] = subChapterSubTitle;
    data['sub_chapter_xp_point'] = subChapterXpPoint;
    data['sub_chapter_video_thumbnail'] = subChapterVideoThumbnail;
    data['sub_chapter_video_link'] = subChapterVideoLink;
    data['sub_chapter_description'] = subChapterDescription;
    return data;
  }
}


// class SubChapterModel {
//   int? status;
//   String? message;
//   String? errormsg;
//   List<Response>? response;

//   SubChapterModel({this.status, this.message, this.response});

//   SubChapterModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     if (json['response'] != null &&
//         json['response'].runtimeType.toString() != "String") {
//       response = <Response>[];
//       json['response'].forEach((v) {
//         response!.add(Response.fromJson(v));
//       });
//     }
//     if (json['response'].runtimeType.toString() == "String") {
//       errormsg = json['response'].toString();
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     data['message'] = message;
//     data['errormsg'] = errormsg;
//     if (response != null) {
//       data['response'] = response!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Response {
//   String? subChapterId;
//   String? categoryName;
//   String? topicName;
//   String? chapterName;
//   String? chapterDescription;
//   String? chapterLevel;
//   String? pdfFile;
//   String? subChapterName;
//   String? subChapterDescription;
//   String? subChapterVideo;

//   Response(
//       {this.subChapterId,
//       this.categoryName,
//       this.topicName,
//       this.chapterName,
//       this.chapterDescription,
//       this.chapterLevel,
//       this.pdfFile,
//       this.subChapterName,
//       this.subChapterDescription,
//       this.subChapterVideo});

//   Response.fromJson(Map<String, dynamic> json) {
//     subChapterId = json['sub_chapter_id'];
//     categoryName = json['category_name'];
//     topicName = json['topic_name'];
//     chapterName = json['chapter_name'];
//     chapterDescription = json['chapter_description'];
//     chapterLevel = json['chapter_level'];
//     pdfFile = json['pdf_file'];
//     subChapterName = json['sub_chapter_name'];
//     subChapterDescription = json['sub_chapter_description'];
//     subChapterVideo = json['sub_chapter_video'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['sub_chapter_id'] = subChapterId;
//     data['category_name'] = categoryName;
//     data['topic_name'] = topicName;
//     data['chapter_name'] = chapterName;
//     data['chapter_description'] = chapterDescription;
//     data['chapter_level'] = chapterLevel;
//     data['pdf_file'] = pdfFile;
//     data['sub_chapter_name'] = subChapterName;
//     data['sub_chapter_description'] = subChapterDescription;
//     data['sub_chapter_video'] = subChapterVideo;
//     return data;
//   }
// }
