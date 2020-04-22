import 'package:flutter/foundation.dart';

class HomeModel extends ChangeNotifier {

  bool _likeword = false;
  bool get Likeword => _likeword;
  setLikeword(bool _val) {
    if(_val != _likeword) {
      _likeword = _val;
      notifyListeners();
    }

  }
  change(){
    setLikeword(!_likeword);
  }

}