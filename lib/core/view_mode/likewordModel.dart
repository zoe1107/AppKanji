import 'package:flutter/cupertino.dart';

class LikeWordModel extends ChangeNotifier {

  bool _likeword = true;
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