import 'package:flutter/material.dart';
import 'package:taniku/model/addkebun.dart';
import 'package:taniku/service/api/addkebunapi.dart';

class TabViewModel extends ChangeNotifier{
  final _kebunApi = KebunApi();
  AddKebunModel addKebunModel = AddKebunModel();

  void addKebun(BuildContext context) async {
    final response = await _kebunApi.addKebun(addKebunModel, context);
    print(response);
    notifyListeners();
  }

}