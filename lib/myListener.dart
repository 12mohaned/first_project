import 'package:flutter/foundation.dart';

class MyListener with ChangeNotifier {
  String _stateManagementTime = "Mohamed Mashaly";
  String get stateManagementTime => _stateManagementTime;

  set stateManagementTime(String newValue) {
    _stateManagementTime = newValue;
    notifyListeners();
  }
}
