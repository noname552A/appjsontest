import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:taniku/model/profile.dart';
import 'package:taniku/service/api/profileapi.dart';

class profilemod extends ChangeNotifier {
  final _profileapi = profileapi();
  Data2 listprofile = Data2();

  profilemod(BuildContext context) {
    getprofile(context);
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
}
