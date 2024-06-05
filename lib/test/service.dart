import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

class UploadApiImage {
  Future<dynamic> uploadImage(
    Uint8List bytes,
    String title,
  ) async {
    Uri url = Uri.parse("https://api-x-robot.future-developers.cloud/api/search/create");
    var request = http.MultipartRequest("POST", url);
    var myFile = http.MultipartFile(
      "image",
      http.ByteStream.fromBytes(bytes),
      bytes.length,
      filename: title,
    );
    request.files.add(myFile);
    final respones = await request.send();
    if (respones.statusCode == 201 || respones.statusCode == 200) {
      var data = await respones.stream.bytesToString();
      return jsonDecode(data);
    } else {
      return null;
    }
  }
}