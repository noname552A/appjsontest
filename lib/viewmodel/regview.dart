import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taniku/model/reglog.dart';
import 'package:taniku/service/api/regapi.dart';
import 'package:taniku/service/local/sharepref.dart';


class regmod extends ChangeNotifier{
  final _registerApi = regapi();

  regmod(BuildContext) {}

  void register(String type_user, String name, String phone, String password, String confirmpassword, BuildContext context) async{
    final response = await _registerApi.register(type_user, name, phone, password, confirmpassword);
    if (response.error == null) {
      if (response.isSuccess == true) {
        print(response.message.toString());
        //Navigator.push(context, MaterialPageRoute(builder: (context) => ListKebunScreen()));
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

  Future<bool> registerWithReturn(String type_user, String name,String phone, String password, String confirmpassword, BuildContext context) async {
    final response = await _registerApi.register(type_user, name, phone, password, confirmpassword);
    if (response.error == null) {
      if (response.isSuccess == true) {
        print(response.message.toString());
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

