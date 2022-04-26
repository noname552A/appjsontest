import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:taniku/model/addkebun.dart';
import 'package:taniku/service/local/sharepref.dart';

class KebunApi {
  var client = http.Client();
  var baseUrl = "http://34.126.79.39:81/";

  Future<String> addKebun(AddKebunModel addKebunModel, BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/kebun/addKebun").replace();
    final tokenLocal = await sharepref().getStringSharedPref("token");
    Map<String, String> headersToken(String token) {
      return {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
    }
    var _body = jsonEncode(addKebunModel);

    print(tokenLocal);
    print(_body);

    try {
      final response = await client
          .post(uri, headers: headersToken(tokenLocal), body: _body)
          .timeout(const Duration(seconds: 30));
      print(response.body);
      if (response.statusCode == HttpStatus.ok) {
        // return ResponseListKebun.fromJson(jsonDecode(response.body));
        return "";
      } else {
        // return ResponseListKebun.withError("Gagal Load Data");
        return "";
      }
    } on TimeoutException catch (_) {
      // return ResponseListKebun.withError("Waktu Habis, Silahkan Coba Kembali");
      return "";
    }
  }

}