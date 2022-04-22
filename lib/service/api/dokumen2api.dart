import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taniku/model/dokumen2.dart';
import 'package:taniku/service/local/sharepref.dart';



class dokumenapi2 {
  var client = http.Client();
  var baseUrl = "http://34.126.79.39:81/";

  Future<dokumen2> getdokumen(BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/listJenisDokumen").replace();
    final tokenLocal = await sharepref().getStringSharedPref("token");

    Map<String, String> headersToken(String token) {
      return {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
    }

    print(tokenLocal);

    try {
      final response = await client
          .get(uri, headers: headersToken(tokenLocal))
          .timeout(const Duration(seconds: 30));
      print(response.body);
      if (response.statusCode == HttpStatus.ok) {
        return dokumen2.fromJson(jsonDecode(response.body));
      } else {
        return dokumen2.withError("Gagal Load Data");
      }
    } on TimeoutException catch (_) {
      return dokumen2.withError("Waktu Habis, Silahkan Coba Kembali");
    }
  }

}