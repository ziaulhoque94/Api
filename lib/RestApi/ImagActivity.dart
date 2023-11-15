import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ImageActivity extends StatefulWidget {
  const ImageActivity({super.key});

  @override
  State<ImageActivity> createState() => _ImageActivityState();
}

class _ImageActivityState extends State<ImageActivity> {

  List<ImgModel> imgList=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photos fetch"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),

      body: Center(
        child: Column(
          children: [
            
            Expanded(
              child: FutureBuilder(
                  future: getPhotos(), 
                  builder:(context,AsyncSnapshot<List<ImgModel>> snapshot) {
                    if(!snapshot.hasData){
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator()
                        ],
                      );
                    }else{
                      return ListView.builder(
                        itemCount: imgList.length,
                        itemBuilder: (context, index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 10,
                              shadowColor: Colors.black,
                              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [

                                  Container(
                                    height: 200,
                                    width: 200,
                                    child: Image.network(snapshot.data![index].url.toString()),
                                  ),
                                  
                                  ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(snapshot.data![index].url.toString()),
                                    ),
                                    title: Text("Notes id : ${snapshot.data![index].id.toString()}"),
                                    subtitle: Text(snapshot.data![index].title.toString()),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  }, 
              
              ),
            )

          ],
        ),
      ),
    );
  }

  Future<List<ImgModel>> getPhotos() async{
    final response=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data=jsonDecode(response.body.toString());

    if(response.statusCode==200){
      imgList.clear();
      for(Map i in data){
      ImgModel imgModel=ImgModel(title: i["title"], url: i["url"], id: i["id"]);
      imgList.add(imgModel);
      }
    return imgList;
    }else{
    return imgList;
    }
  }

}




class ImgModel{
  String title, url;
  int id;

  ImgModel({required this.title, required this.url, required this.id});

  //ImgModel(this.title, this.url);
}
