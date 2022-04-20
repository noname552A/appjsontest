import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taniku/model/kecamatan.dart';
import 'package:taniku/model/kelurahan.dart';
import 'package:taniku/model/provinsi.dart';
import 'package:taniku/service/local/sharepref.dart';
import 'package:taniku/model/kota.dart';


class lokasiapi {
  var client = http.Client();
  var baseUrl = "http://34.126.79.39:81/";

  Future<provinsi> getprovinsi(BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/wilayah/provinsi").replace();
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
          .post(uri, headers: headersToken(tokenLocal))
          .timeout(const Duration(seconds: 30));
      print(response.body);
      if (response.statusCode == HttpStatus.ok) {
        return provinsi.fromJson(jsonDecode(response.body));
      } else {
        return provinsi.withError("Gagal Load Data");
      }
    } on TimeoutException catch (_) {
      return provinsi.withError("Waktu Habis, Silahkan Coba Kembali");
    }
  }

  Future<kota> getkota(String id, BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/wilayah/kabupatenKota").replace();
    final tokenLocal = await sharepref().getStringSharedPref("token");

    Map<String, String> headersToken(String token) {
      return {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
    }
    var _body = jsonEncode({
      'provinsi_id': id,
    });
    print(tokenLocal);
    print(_body);

    try {
      final response = await client
          .post(uri, headers: headersToken(tokenLocal), body: _body)
          .timeout(const Duration(seconds: 30));
      print(response.body);
      if (response.statusCode == HttpStatus.ok) {
        return kota.fromJson(jsonDecode(response.body));
      } else {
        return kota.withError("Gagal Load Data");
      }
    } on TimeoutException catch (_) {
      return kota.withError("Waktu Habis, Silahkan Coba Kembali");
    }
  }

  Future<kecamatan> getkecamatan(String id, BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/wilayah/kecamatan").replace();
    final tokenLocal = await sharepref().getStringSharedPref("token");

    Map<String, String> headersToken(String token) {
      return {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
    }
    var _body = jsonEncode({
      'kabupaten_kota_id': id,
    });
    print(tokenLocal);
    print(_body);

    try {
      final response = await client
          .post(uri, headers: headersToken(tokenLocal), body: _body)
          .timeout(const Duration(seconds: 30));
      print(response.body);
      if (response.statusCode == HttpStatus.ok) {
        return kecamatan.fromJson(jsonDecode(response.body));
      } else {
        return kecamatan.withError("Gagal Load Data");
      }
    } on TimeoutException catch (_) {
      return kecamatan.withError("Waktu Habis, Silahkan Coba Kembali");
    }
  }

  Future<kelurahan> getdesa(String id, BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/wilayah/kelurahanDesa").replace();
    final tokenLocal = await sharepref().getStringSharedPref("token");

    Map<String, String> headersToken(String token) {
      return {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
    }
    var _body = jsonEncode({
      'kecamatan_id': id,
    });
    print(tokenLocal);
    print(_body);

    try {
      final response = await client
          .post(uri, headers: headersToken(tokenLocal), body: _body)
          .timeout(const Duration(seconds: 30));
      print(response.body);
      if (response.statusCode == HttpStatus.ok) {
        return kelurahan.fromJson(jsonDecode(response.body));
      } else {
        return kelurahan.withError("Gagal Load Data");
      }
    } on TimeoutException catch (_) {
      return kelurahan.withError("Waktu Habis, Silahkan Coba Kembali");
    }
  }

}
