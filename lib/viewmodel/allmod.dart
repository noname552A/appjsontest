import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:taniku/model/all.dart';
import 'package:taniku/service/api/allapi.dart';

class allmod extends ChangeNotifier {
  final _allapi = allapi();
  List<Data> listall = [];

  allmod(BuildContext context) {
    getall(context);
  }

  void getall(BuildContext context) async {
    final response = await _allapi.getall(context);
    if (response.error == null) {
      if (response.isSuccess == true) {
        listall = response.data!;
        print(jsonEncode(listall));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }

  void getedit(String reservasi, String tanggal, BuildContext context) async {
    final response = await _allapi.getedit(reservasi, tanggal, context);
    if (response.error == null) {
      if (response.isSuccess == true) {
              } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }
}
