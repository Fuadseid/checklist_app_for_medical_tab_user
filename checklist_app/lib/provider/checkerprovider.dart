import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:checklist_app/model/Model.dart';

class Checkerprovider with ChangeNotifier {
  bool _toggleBvalue = false;
  bool _toggleBvalue1 = false;

  final Model model = Model();

  // Getter for bvalue
  bool get bvalue => _toggleBvalue;

  // Getter for bvalue1
  bool get bvalue1 => _toggleBvalue1;

  // Setter for toggleBvalue
  set toggleBvalue(bool value) {
    _toggleBvalue = value;
    model.dates[0][3] = value;  // Update today's morning status
    save();  // Save the updated value to SharedPreferences
    notifyListeners();  // Notify listeners to rebuild UI
  }

  // Setter for toggleBvalue1
  set toggleBvalue1(bool value) {
    _toggleBvalue1 = value;
    model.dates[0][4] = value;  // Update today's evening status
    save();  // Save the updated value to SharedPreferences
    notifyListeners();  // Notify listeners to rebuild UI
  }

  Future<void> save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('morningReminder', _toggleBvalue);  // Save morning reminder
    await prefs.setBool('eveningReminder', _toggleBvalue1); // Save evening reminder
  }

  // Method to load the checkbox states from SharedPreferences
  Future<void> load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _toggleBvalue = prefs.getBool('morningReminder') ?? false; // Load morning reminder
    _toggleBvalue1 = prefs.getBool('eveningReminder') ?? false; // Load evening reminder

    // Update the model with the loaded values
    model.dates[0][3] = _toggleBvalue;
    model.dates[0][4] = _toggleBvalue1;

    notifyListeners();  // Notify listeners to rebuild UI
  }
}
