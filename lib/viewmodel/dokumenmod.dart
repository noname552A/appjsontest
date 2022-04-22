import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:taniku/service/api/dokumenapi.dart';
import 'package:taniku/model/dokumen.dart';

class dokumenmod extends ChangeNotifier {
  final _dokumenApi = dokumenapi();
  List<Data2> listdokumen = [];

  dokumenmod(BuildContext context) {
    getdokumen(context);
  }

  void getdokumen(BuildContext context) async {
    final response = await _dokumenApi.getdokumen(context);
    if (response.error == null) {
      if (response.isSuccess == true) {
        listdokumen = response.data!;
        print(jsonEncode(listdokumen));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }
}

