

import 'package:flutter/material.dart';

class testProvider extends ChangeNotifier{

  int count = 0;


  addCount(){
    count += 1;
    notifyListeners();
  }


}