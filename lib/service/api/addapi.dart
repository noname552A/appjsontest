import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taniku/model/add.dart';
import 'package:taniku/model/pabrik.dart';
import 'package:taniku/service/local/sharepref.dart';



class addapi {
  var client = http.Client();
  var baseUrl = "http://34.126.79.39:81/";

  Future<add> getadd(String tgl, String tonasi, String id) async {
    var uri = Uri.parse(baseUrl + "api/niaga/reservasi/add").replace();
    final tokenLocal = await sharepref().getStringSharedPref("token");
    final localuser = await sharepref().getStringSharedPref("user_id");
    final localpetani = await sharepref().getStringSharedPref("petani_id");

    Map<String, String> headersToken(String token) {
      return {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
    }
    var _body = jsonEncode({
      "koperasi_id": "",
      "pabrik_id": id,
      "petani_id": localpetani,
      "tanggal_pengiriman": "$tgl",
      "tonasi": "$tonasi" ,
      "user_id" : localuser,
    });
    print(tokenLocal);
    print(_body);

    try {
      final response = await client
          .post(uri, headers: headersToken(tokenLocal), body: _body)
          .timeout(const Duration(seconds: 30));
      print(response.body);
      if (response.statusCode == HttpStatus.ok) {
        return add.fromJson(jsonDecode(response.body));
      } else {
        return add.withError("Gagal Load Data");
      }
    } on TimeoutException catch (_) {
      return add.withError("Waktu Habis, Silahkan Coba Kembali");
    }
  }
}
