import 'package:weather_app/model/status.dart';
import 'data.dart';
import 'message.dart';

class CurrentData {
   Status status;
   Message message;
   List<Data> data;

  CurrentData({
    required this.status,
    required this.message,
    required this.data,
  });


  factory CurrentData.fromJson(Map<String, dynamic> json) {
    return CurrentData(
      status: Status.fromJson(json["status"]),
      message: Message.fromJson(json["message"]),
      data: List<Data>.of(json["data"])
          .map((i) => i /* can't generate it properly yet */).toList(),
    );
  }
//
}
