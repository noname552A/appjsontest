// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:taniku/model/home_vertical.dart';
// import 'package:taniku/service/api/verticalapi.dart';
//
// class verticalview extends ChangeNotifier {
//   final _verticalApi = verticalapi();
//   List<Data> listvertical = [];
//
//   verticalview(BuildContext context) {
//     getvertical(context);
//   }
//
//   void getvertical(BuildContext context) async {
//     final response = await _verticalApi.getvertical(context);
//     if (response.error == null) {
//       if (response.isSuccess == true) {
//         listvertical = response.data!;
//         print(jsonEncode(listvertical));
//       } else {
//         print(response.message.toString());
//       }
//     } else {
//       print(response.error.toString());
//     }
//     notifyListeners();
//   }
// }
