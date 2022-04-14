import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taniku/model/all.dart';
import 'package:taniku/service/local/sharepref.dart';



class allapi {
  var client = http.Client();
  var baseUrl = "http://34.126.79.39:81/";

  Future<all> getall(BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/reservasi/getAll").replace();
    final tokenLocal = "OTE0YmNjNGFhZjhiNTRiMGMzMjAyMjg1YjBhZmM0MzQ5YjViNDhhZg==";
    final localuser = "85";

    Map<String, String> headersToken(String token) {
      return {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
    }
    var _body = jsonEncode({
      "page": "1",
      "sort": "desc",
      "status": "",
      "type_user": "PTN",
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
        return all.fromJson(jsonDecode(response.body));
      } else {
        return all.withError("Gagal Load Data");
      }
    } on TimeoutException catch (_) {
      return all.withError("Waktu Habis, Silahkan Coba Kembali");
    }
  }
}
