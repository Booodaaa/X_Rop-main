class Data {
  /*
   "data": {
    "id": 1,
    "password": "000000",
    "gps": "https:\/\/maps.app.goo.gl\/dPWz3zVBekJpr2LM6",
    "active": 1,
    "status": "explore",
    "user_id": 1,
    "created_at": "2024-05-04T19:43:22.000000Z",
    "updated_at": "2024-05-04T19:43:22.000000Z"
  }*/


  int id, active, userId;
  String gps, status, password;
  double createdAt, updatedAt;

  Data({required this.id, required this.active, required this.userId, required this.gps, required this.status, required this.password,
    required this.createdAt, required this.updatedAt});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: int.parse(json["id"]),
      active: json["active"],
      userId: json["userId"],
      gps: json["gps"],
      status: json["status"],
      password: json["password"],
      createdAt: double.parse(json["createdAt"]),
      updatedAt: json["updatedAt"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "active": active,
      "userId": userId,
      "gps": gps,
      "status": status,
      "password": password,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
    };
  }

//
}