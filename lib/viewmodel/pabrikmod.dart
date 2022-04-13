import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:taniku/model/pabrik.dart';
import 'package:taniku/service/api/pabrikapi.dart';

class pabrikmod extends ChangeNotifier {
  final _pabrikapi = pabrikapi();
  List<Data> listpabrik = [];

  pabrikmod(BuildContext context) {
    getpabrik(context);
  }

  void getpabrik(BuildContext context) async {
    final response = await _pabrikapi.getpabrik(context);
    if (response.error == null) {
      if (response.isSuccess == true) {
        listpabrik = response.data!;
        print(jsonEncode(listpabrik));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }
}
