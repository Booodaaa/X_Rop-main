import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends StatefulWidget {
  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  File? _selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _selectedImage != null
            ? Image.file(_selectedImage!)
            : const Text("please chossee Image"),
      ),
      floatingActionButton: IconButton(
          onPressed: () {
            _pickImageFromGallery();
          },
          icon: Icon(Icons.search_outlined)),
    );
  }

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage.path);
    });
  }
}
