import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taniku/service/local/sharepref.dart';
import 'package:taniku/model/lahan.dart';
import 'package:taniku/model/bibit.dart';



class kebunapi {
  var client = http.Client();
  var baseUrl = "http://34.126.79.39:81/";

  Future<bibit> getbibit(BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/listJenisBibit").replace();
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
        return bibit.fromJson(jsonDecode(response.body));
      } else {
        return bibit.withError("Gagal Load Data");
      }
    } on TimeoutException catch (_) {
      return bibit.withError("Waktu Habis, Silahkan Coba Kembali");
    }
  }

  Future<lahan> getlahan(BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/listStatusLahan").replace();
    final tokenLocal = await sharepref().getStringSharedPref("token");

    Map<String, String> headersToken(String token) {
      return {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
    }

    print("token_vetical => ${tokenLocal.toString()}");


    try {
      final response = await client
          .get(uri, headers: headersToken(tokenLocal))
          .timeout(const Duration(seconds: 30));
      print(response.body);
      if (response.statusCode == HttpStatus.ok) {
        return lahan.fromJson(jsonDecode(response.body));
      } else {
        return lahan.withError("Gagal Load Data");
      }
    } on TimeoutException catch (_) {
      return lahan.withError("Waktu Habis, Silahkan Coba Kembali");
    }
  }

}
