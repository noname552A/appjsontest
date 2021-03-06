import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taniku/model/pabrik.dart';
import 'package:taniku/service/local/sharepref.dart';



class pabrikapi {
  var client = http.Client();
  var baseUrl = "http://34.126.79.39:81/";

  Future<pabrik> getpabrik(BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/pabrik/getPabrik").replace();
    final tokenLocal = await sharepref().getStringSharedPref("token");
    final localuser = await sharepref().getStringSharedPref("user_id");

    Map<String, String> headersToken(String token) {
      return {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
    }
    var _body = jsonEncode({
      'jarak_maksimum' :"1000000000000",
      'jarak_minimum' : "0",
      'latitude':"20.149",
      'longitude':"77.49",
      'orderBy':"jarak_pabrik",
      'sort':"desc",
      'user_id': localuser,
    });
    print(tokenLocal);
    print(_body);

    try {
      final response = await client
          .post(uri, headers: headersToken(tokenLocal), body: _body)
          .timeout(const Duration(seconds: 30));
      print(response.body);
      if (response.statusCode == HttpStatus.ok) {
        return pabrik.fromJson(jsonDecode(response.body));
      } else {
        return pabrik.withError("Gagal Load Data");
      }
    } on TimeoutException catch (_) {
      return pabrik.withError("Waktu Habis, Silahkan Coba Kembali");
    }
  }
}
