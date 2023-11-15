import 'dart:html';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LoadImage extends StatefulWidget {
  const LoadImage({super.key});

  @override
  State<LoadImage> createState() => _LoadImageState();
}

class _LoadImageState extends State<LoadImage> {
  File? image;
  ImagePicker _imagePicker=ImagePicker();
  bool showSpinner=false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

      ],
    );
  }
  Future getImage() async{
    final pickedFile=await _imagePicker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if(pickedFile!=null){
      //image=File(pickedFile.path);
    }
  }

  Future<void> UploadImage() async{

  }

}
