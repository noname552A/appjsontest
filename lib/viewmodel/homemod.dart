import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:taniku/service/api/homeapi.dart';
import 'package:taniku/model/home.dart';

class homemod extends ChangeNotifier {
  final _homeApi = homeapi();
  List<Data> listhome = [];

  homemod(BuildContext context) {
    gethome(context);
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
}
