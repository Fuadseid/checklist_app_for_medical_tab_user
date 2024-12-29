import 'package:flutter/material.dart';

class Checkerprovider extends ChangeNotifier {
  bool bvalue = false;
  bool bvalue1 = false;
Checkerprovider({this.bvalue = false, this.bvalue1 = false});
 

  set toggleBvalue(bool newvalue) {
    bvalue = newvalue;
    notifyListeners();
  }

  set toggleBvalue1(bool newvalue1) {
    bvalue1 = newvalue1;
    notifyListeners();
  }
}
