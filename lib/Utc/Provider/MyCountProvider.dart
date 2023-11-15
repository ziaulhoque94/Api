import 'package:flutter/cupertino.dart';

class MyCountProvider extends ChangeNotifier{

  var cou=0;
  int get con=>cou;

  void addCount(){
    cou+=1;
    ChangeNotifier;
  }

  void subtractCount(){
    cou-=1;
    ChangeNotifier;
  }

}