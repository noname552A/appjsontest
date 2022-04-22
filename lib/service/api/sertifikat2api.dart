import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taniku/model/sertifikat2.dart';
import 'package:taniku/service/local/database.dart';
import 'package:taniku/model/dokumen2.dart';
import 'package:taniku/service/local/sharepref.dart';



class sertifikat2api {
  var client = http.Client();
  var baseUrl = "http://34.126.79.39:81/";

  Future<sertifikat2> getsertifikat(BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/listSertifikasi").replace();
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
        return sertifikat2.fromJson(jsonDecode(response.body));
      } else {
        return sertifikat2.withError("Gagal Load Data");
      }
    } on TimeoutException catch (_) {
      return sertifikat2.withError("Waktu Habis, Silahkan Coba Kembali");
    }
  }

}