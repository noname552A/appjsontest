import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taniku/service/local/sharepref.dart';
import 'package:taniku/model/sertifikat.dart';
import 'package:taniku/model/dokumen.dart';
import 'package:taniku/model/one.dart';



class detaileddapi {
  var client = http.Client();
  var baseUrl = "http://34.126.79.39:81/";

  Future<dokumen> getdokumen(BuildContext context, String kebunId) async {
    var uri = Uri.parse(baseUrl + "api/niaga/kebun/getKebunSertifikat").replace();
    final tokenLocal = "OTE0YmNjNGFhZjhiNTRiMGMzMjAyMjg1YjBhZmM0MzQ5YjViNDhhZg==";
    final localkebun = await sharepref().getStringSharedPref("kebun_id");
    final localuser = "85";

    Map<String, String> headersToken(String token) {
      return {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
    }
    var _body = jsonEncode({
      'orderBy': "id",
      'kebun_id': kebunId,
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
        return dokumen.fromJson(jsonDecode(response.body));
      } else {
        return dokumen.withError("Gagal Load Data");
      }
    } on TimeoutException catch (_) {
      return dokumen.withError("Waktu Habis, Silahkan Coba Kembali");
    }
  }

  Future<sertifikat> getsertifikat(BuildContext context, String kebunId) async {
    var uri = Uri.parse(baseUrl + "api/niaga/kebun/getSertifikatList").replace();
    final tokenLocal = 'OTE0YmNjNGFhZjhiNTRiMGMzMjAyMjg1YjBhZmM0MzQ5YjViNDhhZg==';
    final localuser = "85";
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
      'kebun_id': kebunId,
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

  Future<one> getone(BuildContext context, String kebunId) async {
    var uri = Uri.parse(baseUrl + "api/niaga/kebun/findOneKebun").replace();
    final tokenLocal = 'OTE0YmNjNGFhZjhiNTRiMGMzMjAyMjg1YjBhZmM0MzQ5YjViNDhhZg==';
    final localuser = "85";
    //final localkebun = await sharepref().getStringSharedPref("kebun_id");

    Map<String, String> headersToken(String token) {
      return {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
    }
    var _body = jsonEncode({
      'kebun_id': kebunId,
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
        return one.fromJson(jsonDecode(response.body));
      } else {
        return one.withError("Gagal Load Data");
      }
    } on TimeoutException catch (_) {
      return one.withError("Waktu Habis, Silahkan Coba Kembali");
    }
  }

}
