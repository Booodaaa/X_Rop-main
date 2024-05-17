// ignore_for_file: camel_case_types

class things_model {
  String? status;
  String? message;
  List<Data>? data;

  things_model({this.status, this.message, this.data});

  things_model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }
}

class Data {
  int? id;
  String? title;
  String? gps;
  String? imagePath;
  int? robotId;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.title,
        this.gps,
        this.imagePath,
        this.robotId,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    gps = json['gps'];
    imagePath = json['image_path'];
    robotId = json['robot_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}