import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taniku/model/reglog.dart';

class regapi {
  var client = http.Client();
  var baseUrl = "http://34.126.79.39:81/";

  Future<reglog> register(String type_user, String name,String phone, String password, String confirmpassword) async {
    var uri = Uri.parse(baseUrl + "api/niaga/auth/register").replace();
    Map<String, String> headers() {
      return {'Content-Type' : 'application/json' , 'Accept' : 'application/json'};
    }

    var _body = jsonEncode({
      "type_user" : type_user,
      'name' : name,
      'mobile' : phone,
      'password' : password,
      'confirm_password' :confirmpassword
    });

    try {
      final response = await client
          .post(uri, headers: headers(), body: _body)
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == HttpStatus.ok) {
        return reglog.fromJson(jsonDecode(response.body));
      } else {
        return reglog.withError("Gagal Load Data");
      }
    } on TimeoutException catch (_) {
      return reglog.withError("Waktu Habis, Silahkan Coba Kembali");
    }
  }

}