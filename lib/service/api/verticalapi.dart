import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taniku/model/home.dart';
import 'package:taniku/model/home_vertical.dart';
import 'package:taniku/model/profile.dart';
import 'package:taniku/service/local/sharepref.dart';



class verticalapi {
  var client = http.Client();
  var baseUrl = "http://34.126.79.39:81/";

  Future<vertical> getvertical(BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/kebun/getKebun").replace();
    final tokenLocal = "MDAyMThkNWQxYzA1OGY1NmEyYTVjNmQ5YzNkNTRlMjgyZDg3MmMxNQ==";
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
        return vertical.fromJson(jsonDecode(response.body));
      } else {
        return vertical.withError("Gagal Load Data");
      }
    } on TimeoutException catch (_) {
      return vertical.withError("Waktu Habis, Silahkan Coba Kembali");
    }
  }
}
