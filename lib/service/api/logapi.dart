import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taniku/model/reslog.dart';

class logapi {
  var client = http.Client();
  var baseUrl = "http://34.126.79.39:81/";

  Future<reslog> login(String username, String password ,BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/auth/login").replace();
    Map<String, String> headers() {
      return {'Content-Type' : 'application/json' , 'Accept' : 'application/json'};
    }

    var _body = jsonEncode({
      'username' : username,
      'password' : password
    });

    try {
      final response = await client
          .post(uri, headers: headers(), body: _body)
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == HttpStatus.ok) {
        return reslog.fromJson(jsonDecode(response.body));
      } else {
        return reslog.withError("Gagal Load Data");
      }
    } on TimeoutException catch (_) {
      return reslog.withError("Waktu Habis, Silahkan Coba Kembali");
    }
    }

  }