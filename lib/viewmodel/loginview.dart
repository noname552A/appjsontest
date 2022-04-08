import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taniku/model/reslog.dart';
import 'package:taniku/service/api/logapi.dart';
import 'package:taniku/service/local/sharepref.dart';
import 'package:taniku/view/botnav.dart';


class loginmod extends ChangeNotifier{
  final _loginApi = logapi();
  final _sharedPref = sharepref();
  Data dataLogin = new Data();

  loginmod(BuildContext) {
    _sharedPref.removeSharedPref();
  }

  void login(String username, String password, BuildContext context) async{
    final response = await _loginApi.login(username, password, context);
    if (response.error == null) {
      if (response.isSuccess == true) {
        dataLogin = response.data!;
        _sharedPref.setStringSharedPref("token", dataLogin.token.toString());
        _sharedPref.setStringSharedPref(
            "petani_id", dataLogin.detail!.petaniId.toString());
        _sharedPref.setStringSharedPref("user_id", dataLogin.userId.toString());
        print(jsonEncode(dataLogin));
        print(_sharedPref.getStringSharedPref('token'));
        Navigator.push(context, MaterialPageRoute(builder: (context) => botnav()));
      }
      else {
        print(response.message.toString());
      }
    }
      else {
        print(response.error.toString());
    }
    notifyListeners();
    }

    Future<bool> loginWithReturn(String username, String password, BuildContext context) async {
    final response = await _loginApi.login(username, password, context);
    if (response.error == null) {
      if (response.isSuccess == true) {
        dataLogin = response.data!;
        _sharedPref.setStringSharedPref("token", dataLogin.token.toString());
        _sharedPref.setStringSharedPref(
            "petani_id", dataLogin.detail!.petaniId.toString());
        _sharedPref.setStringSharedPref("user_id", dataLogin.userId.toString());
        print(jsonEncode(dataLogin));
        return true;
      }
      else {
        print(response.message.toString());
        return false;
      }
    }
      else {
        print (response.error.toString());
        return false;
    }
    }

    }

