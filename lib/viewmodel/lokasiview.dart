import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:taniku/service/api/lokasiapi.dart';
import 'package:taniku/model/provinsi.dart';
import 'package:taniku/model/kota.dart';
import 'package:taniku/model/kecamatan.dart';
import 'package:taniku/model/kelurahan.dart';

class lokasimod extends ChangeNotifier {
  final lokasiApi = lokasiapi();
  List<Data> listprovinsi = [];
  List<Data2> listkota = [];
  List<Data3> listcamat = [];
  List<Data4> listdesa = [];

  lokasimod(BuildContext context) {
    getprovinsi(context);
  }

  void getprovinsi(BuildContext context) async {
    final response = await lokasiApi.getprovinsi(context);
    if (response.error == null) {
      if (response.isSuccess == true) {
        listprovinsi = response.data!;
        print(jsonEncode(listprovinsi));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }

  void getkota(String id, BuildContext context) async {
    final response = await lokasiApi.getkota(id, context);
    if (response.error == null) {
      if (response.isSuccess == true) {
        listkota = response.data!;
        print(jsonEncode(listkota));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }

  void getkecamatan(String id, BuildContext context) async {
    final response = await lokasiApi.getkecamatan(id, context);
    if (response.error == null) {
      if (response.isSuccess == true) {
        listcamat = response.data!;
        print(jsonEncode(listcamat));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }

  void getdesa(String id, BuildContext context) async {
    final response = await lokasiApi.getdesa(id, context);
    if (response.error == null) {
      if (response.isSuccess == true) {
        listdesa = response.data!;
        print(jsonEncode(listdesa));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }
}

