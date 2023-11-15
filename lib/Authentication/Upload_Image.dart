
import 'dart:html';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';


class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {

  XFile? image ;
  final _picker = ImagePicker();
  bool showSpinner = false ;

  Future getImage()async{
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery , imageQuality: 80);
    if(pickedFile!= null ){
      return await image!.readAsBytes();
      setState(() {

      });
    }else {
      print('no image selected');
    }
  }

  Future<void> uploadImage() async{
    setState(() {
      showSpinner=true;
    });
    
    var stream=new http.ByteStream(image!.openRead());
    stream.cast();
    
    var lenght=await image!.length();
    var uri=Uri.parse('');
    var request=new http.MultipartRequest('POST', uri);
    request.fields['title']='static title';
    
    var multiPart=new http.MultipartFile('image', stream, lenght);
    request.files.add(multiPart);

    var response=await request.send();
    print(response.stream.toString());

    if(response.statusCode==200){
      setState(() {
        showSpinner=false;
      });
      print("Image Uploaded");
    }else{
      print("Upload failed");
      setState(() {
        showSpinner=false;
      });
    }
    
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: image==null? Center(child: Text("Pick Image"),)
            : Container(),
          )
        ]
      )
    );
  }
}
