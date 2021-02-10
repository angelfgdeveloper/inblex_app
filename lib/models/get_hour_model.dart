import 'package:flutter/material.dart';

class HourModel extends ChangeNotifier {
  String _hour = '';

  String get hourSelected => this._hour;
  set hourSelected(String value) {
    this._hour = value;
    notifyListeners();
  }

}