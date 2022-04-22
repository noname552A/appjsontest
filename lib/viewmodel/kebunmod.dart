import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:taniku/model/bibit.dart';
import 'package:taniku/service/api/kebunapi.dart';
import 'package:taniku/model/lahan.dart';


class kebunmod extends ChangeNotifier {
  final _kebunapi = kebunapi();
  List<Data2> listlahan = [];
  List<Data> listbibit = [];

  kebunmod(BuildContext context) {
    getlahan(context);
    getbibit(context);
  }


  void getbibit(BuildContext context) async {
    final response = await _kebunapi.getbibit(context);
    if (response.error == null) {
      if (response.isSuccess == true) {
        listbibit = response.data!;
        print(jsonEncode(listbibit));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }
  void getlahan(BuildContext context) async {
    final response = await _kebunapi.getlahan(context);
    if (response.error == null) {
      if (response.isSuccess == true) {
        listlahan = response.data!;
        print(jsonEncode(listlahan));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }

}
