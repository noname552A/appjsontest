import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:taniku/service/api/homeapi.dart';
import 'package:taniku/model/home.dart';
import 'package:taniku/model/home_vertical.dart';
import 'package:taniku/service/api/verticalapi.dart';

class homemod extends ChangeNotifier {
  final _homeApi = homeapi();
  final _verticalApi = verticalapi();
  List<Data> listhome = [];
  List<Data2> listvertical = [];

  homemod(BuildContext context) {
    gethome(context);
    getvertical(context);
  }

  void gethome(BuildContext context) async {
    final response = await _homeApi.gethome(context);
    if (response.error == null) {
      if (response.isSuccess == true) {
        listhome = response.data!;
        print(jsonEncode(listhome));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }

  void getvertical(BuildContext context) async {
    final response = await _homeApi.getvertical(context);
    if (response.error == null) {
      if (response.isSuccess == true) {
        listvertical = response.data!;
        print(jsonEncode(listvertical));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }
}

