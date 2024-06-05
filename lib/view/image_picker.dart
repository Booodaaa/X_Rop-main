// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../test/service.dart';

class UploadImage extends StatefulWidget {
  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  String isImageUploade = "";
  File? _selectedImage;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _selectedImage == null
                      ? const SizedBox()
                      : Container(
                          height: 600,
                          width: 400,
                          child: Image.file(
                            _selectedImage!,
                            fit: BoxFit.contain,
                          ),
                        ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent),
                    onPressed: () async {
                      final ImagePicker picker = ImagePicker();
                      final XFile? image =
                          await picker.pickImage(source: ImageSource.gallery);
                      setState(() {
                        _selectedImage = File(image!.path);
                      });
                      if (image != null) {
                        setState(() {
                          isLoading = true;
                        });
                        Uint8List bytes = await image.readAsBytes();
                        UploadApiImage()
                            .uploadImage(bytes, image.name)
                            .then((value) {
                          setState(() {
                            isImageUploade = value["image_path"].toString();
                            isLoading = false;
                          });
                          // print(isImageUploade);
                          print(
                              "Updated Successfully with link ${value.toString()}");
                        }).onError((error, stackTrace) {
                          setState(() {
                            isLoading = true;
                          });
                          print(error.toString());
                        });
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        "Upload Image",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
