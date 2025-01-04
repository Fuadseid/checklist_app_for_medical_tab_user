import 'package:flutter/material.dart';
import 'package:checklist_app/model/Model.dart';

class Checkerprovider with ChangeNotifier {
  bool _toggleBvalue = false;
  bool _toggleBvalue1 = false;

  // Expose the model from the provider
  final Model model = Model();

  bool get bvalue => _toggleBvalue;
  bool get bvalue1 => _toggleBvalue1;

  set toggleBvalue(bool value) {
    _toggleBvalue = value;

    // Update the model's 'bvalue' and notify listeners
    model.dates[0][3] = value;  // Update today's morning status (index 0)
    notifyListeners(); // Notify listeners to rebuild UI
  }

  set toggleBvalue1(bool value) {
    _toggleBvalue1 = value;

    // Update the model's 'bvalue1' and notify listeners
    model.dates[0][4] = value;  // Update today's evening status (index 0)
    notifyListeners(); // Notify listeners to rebuild UI
  }
}
