import 'package:flutter/cupertino.dart';

class DummyData with ChangeNotifier{
  final List<Map<String,String>> _users =[];
  bool _isAuth = false;

  bool get isAuth => _isAuth;

  void addNewUser(String email,String password){
    _users.add({
      "email" : email,
      "password" : password
    });
    _isAuth = true;
    notifyListeners();
  }

  void tryToLogin(String email,String password){
    int index  = _users.indexOf({
      "email" : email,
      "password" : password
    });
    if(index > -1){
      _isAuth = true;
      notifyListeners();
    }
  }

  void logout(){
    _isAuth = false;
    notifyListeners();
  }
}