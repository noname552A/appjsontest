import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taniku/service/local/sharepref.dart';
import 'package:taniku/model/sertifikat.dart';



class sertifikatapi {
  var client = http.Client();
  var baseUrl = "http://34.126.79.39:81/";

  Future<sertifikat> getsertifikat(BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/kebun/getSertifikatList").replace();
    final tokenLocal = await sharepref().getStringSharedPref("token");
    final localuser = await sharepref().getStringSharedPref("user_id");
    //final localkebun = await sharepref().getStringSharedPref("kebun_id");

    Map<String, String> headersToken(String token) {
      return {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
    }
    var _body = jsonEncode({
      'orderBy': "nomor",
      'kebun_id': localuser,
      'sort': "asc",
      'user_id': localuser,
    });
    print("token_vetical => ${tokenLocal.toString()}");
    print(_body);

    try {
      final response = await client
          .post(uri, headers: headersToken(tokenLocal), body: _body)
          .timeout(const Duration(seconds: 30));
      print(response.body);
      if (response.statusCode == HttpStatus.ok) {
        return sertifikat.fromJson(jsonDecode(response.body));
      } else {
        return sertifikat.withError("Gagal Load Data");
      }
    } on TimeoutException catch (_) {
      return sertifikat.withError("Waktu Habis, Silahkan Coba Kembali");
    }
  }

}
