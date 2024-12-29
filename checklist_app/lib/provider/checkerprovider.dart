
import 'package:flutter/material.dart';

class Checkerprovider with ChangeNotifier {

  bool _toggleBvalue = false;

  bool _toggleBvalue1 = false;



  bool get bvalue => _toggleBvalue;

  bool get bvalue1 => _toggleBvalue1;


  set toggleBvalue(bool value) {

    _toggleBvalue = value;

    notifyListeners();

  }



  set toggleBvalue1(bool value) {

    _toggleBvalue1 = value;

    notifyListeners();

  }

}
