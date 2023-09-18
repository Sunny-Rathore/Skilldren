// ignore_for_file: camel_case_types

class getAllTaskModel {
  int? status;
  String? message;
  List<Response>? response;

  getAllTaskModel({this.status, this.message, this.response});

  getAllTaskModel.fromJson(Map<String, dynamic> json) {
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
  String? taskId;
  String? taskTitle;
  String? taskDuration;
  String? taskImage;
  String? taskReward;
  String? taskDescription;
  String? taskType;

  Response(
      {this.taskId,
      this.taskTitle,
      this.taskDuration,
      this.taskImage,
      this.taskReward,
      this.taskDescription,
      this.taskType});

  Response.fromJson(Map<String, dynamic> json) {
    taskId = json['task_id'];
    taskTitle = json['task_title'];
    taskDuration = json['task_duration'];
    taskImage = json['task_image'];
    taskReward = json['task_reward'];
    taskDescription = json['task_description'];
    taskType = json['task_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['task_id'] = taskId;
    data['task_title'] = taskTitle;
    data['task_duration'] = taskDuration;
    data['task_image'] = taskImage;
    data['task_reward'] = taskReward;
    data['task_description'] = taskDescription;
    data['task_type'] = taskType;
    return data;
  }
}
