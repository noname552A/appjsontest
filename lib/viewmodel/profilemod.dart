import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:taniku/model/profile.dart';
import 'package:taniku/service/api/profileapi.dart';
import 'package:taniku/model/home_vertical.dart';


class profilemod extends ChangeNotifier {
  final _profileapi = profileapi();
  List<Data2> listvertical = [];
  Data listprofile = Data();

  profilemod(BuildContext context) {
    getprofile(context);
    getvertical(context);
  }


  void getprofile(BuildContext context) async {
    final response = await _profileapi.getprofile(context);
    if (response.error == null) {
      if (response.isSuccess == true) {
        listprofile = response.data!;
        print(jsonEncode(listprofile));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }
  void getvertical(BuildContext context) async {
    final response = await _profileapi.getvertical(context);
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
