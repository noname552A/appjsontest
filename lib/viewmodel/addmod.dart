import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:taniku/model/add.dart';
import 'package:taniku/service/api/addapi.dart';

class addmod extends ChangeNotifier {
  final _addapi = addapi();


  addmod(BuildContext context, id, nama) {
    // getadd(context, id, tanggal, tonasi);
  }

  void getadd(BuildContext context,id, nama) async {
    final response = await _addapi.getadd(context, id, nama);
    if (response.error == null) {
      if (response.isSuccess == true) {
        print(response.message.toString());
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }
}
