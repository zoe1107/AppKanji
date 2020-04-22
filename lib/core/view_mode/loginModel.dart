import 'package:flutter/foundation.dart';

class LoginModel extends ChangeNotifier {


  bool _count = true;

  bool get count => _count;

  void setCount(bool val) {
    if (val != _count) {
      _count = val;
      notifyListeners();
    }
  }

  change() {
    setCount(!_count);
  }

}