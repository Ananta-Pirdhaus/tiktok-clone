import 'package:flutter/material.dart';
import 'package:modul3/app/modules/home/controllers/image_picker_helper.dart';


class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  ImagePickerHelper _imagePickerHelper = ImagePickerHelper();

  Future<void> _pickImageFromCamera() async {
    await _imagePickerHelper.pickImageFromCamera();
    // Lakukan sesuatu dengan gambar yang dipilih dari kamera
  }

  Future<void> _pickImageFromGallery() async {
    await _imagePickerHelper.pickImageFromGallery();
    // Lakukan sesuatu dengan gambar yang dipilih dari galeri
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _pickImageFromCamera,
              child: Text('Ambil Foto dari Kamera'),
            ),
            ElevatedButton(
              onPressed: _pickImageFromGallery,
              child: Text('Ambil Foto dari Galeri'),
            ),
          ],
        ),
      ),
    );
  }
}
