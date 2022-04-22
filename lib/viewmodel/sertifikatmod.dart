import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:taniku/service/api/sertifikatapi.dart';
import 'package:taniku/model/sertifikat.dart';

class sertifikatmod extends ChangeNotifier {
  final _sertifikatApi = sertifikatapi();
  List<Data3> listsertifikat = [];

  sertifikatmod(BuildContext context) {
    getsertifikat(context);
  }

  void getsertifikat(BuildContext context) async {
    final response = await _sertifikatApi.getsertifikat(context);
    if (response.error == null) {
      if (response.isSuccess == true) {
        listsertifikat = response.data!;
        print(jsonEncode(listsertifikat));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }
}

