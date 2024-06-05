class Status {
  String status;

  Status({required this.status});

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      status: json["status"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status,
    };
  }

//
}