import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taniku/model/home.dart';
import 'package:taniku/service/local/sharepref.dart';



class homeapi {
  var client = http.Client();
  var baseUrl = "http://34.126.79.39:81/";

  Future<home> gethome(BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/news").replace();
    final tokenLocal = await sharepref().getStringSharedPref("token");
    final localpetani = await sharepref().getStringSharedPref("petani_id");
    final localuser = await sharepref().getStringSharedPref("user_id");

    Map<String, String> headersToken(String token) {
      return {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
    }
    var _body = jsonEncode({
      'orderBy': "id",
      'petani_id': localpetani,
      'sort': "asc",
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
        return home.fromJson(jsonDecode(response.body));
      } else {
        return home.withError("Gagal Load Data");
      }
    } on TimeoutException catch (_) {
      return home.withError("Waktu Habis, Silahkan Coba Kembali");
    }
  }

}