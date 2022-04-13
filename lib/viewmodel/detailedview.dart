import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:taniku/service/api/detailedapi.dart';
import 'package:taniku/model/sertifikat.dart';
import 'package:taniku/model/one.dart';
import 'package:taniku/model/dokumen.dart';

class detailedmod extends ChangeNotifier {
  final _detailedApi = detaileddapi();
  List<Data> listone = [];
  List<Data2> listdokumen = [];
  List<Data3> listsertifikat = [];

  detailedmod(BuildContext context, kebunId) {
    getdokumen(context, kebunId);
    getone(context, kebunId);
    getsertifikat(context, kebunId);
  }

  void getdokumen(BuildContext context, kebunId) async {
    final response = await _detailedApi.getdokumen(context,kebunId);
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

  void getone(BuildContext context, kebunId) async {
    final response = await _detailedApi.getone(context, kebunId);
    if (response.error == null) {
      if (response.isSuccess == true) {
        listone = response.data!;
        print(jsonEncode(listone));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }

  void getsertifikat(BuildContext context, kebunId) async {
    final response = await _detailedApi.getsertifikat(context, kebunId);
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

