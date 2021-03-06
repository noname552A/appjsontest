import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:taniku/model/addkebun.dart';
import 'package:taniku/model/sertifikat2.dart';
import 'package:taniku/model/dokumen2.dart';
import 'package:taniku/model/dokumen3.dart';
import 'package:taniku/model/sertifikat3.dart';
import 'package:taniku/service/local/database.dart';
import 'package:taniku/service/api/dokumen2api.dart';
import 'package:taniku/service/api/sertifikat2api.dart';

class dbdatamod extends ChangeNotifier{
  final dblocal = database();
  final dokumenmod = dokumenapi2();
  final sertifikatmod = sertifikat2api();
  List<Data> listUser = [];
  List<Datadokumen> listdokumen = [];
  List<ListDokumen> listkebundokumen = [];
  List<Data2> listUser2 = [];
  List<Datasertifikat> listsertifikat = [];
  List<ListSertifikasi> listkebunsertifikasi = [];
  Data dataUser = Data();
  Datadokumen datadokumen = Datadokumen();
  ListDokumen kebundokumen = ListDokumen();
  Data2 dataUser2 = Data2();
  Datasertifikat datasertifikat = Datasertifikat();
  ListSertifikasi kebunsertifkasi = ListSertifikasi();

  dbdatamod(BuildContext context) {
    getdokumen(context);
    getsertifikat(context);
    getListdokument(context);
    getListsertifikat(context);
    getkebunListDokumen(context);
    getkebunListSertifikat(context);
  }

  //token
  void getdokumen(BuildContext context) async {
    final response = await dokumenmod.getdokumen(context);
    if (response.error == null) {
      if (response.isSuccess == true) {
        listUser = response.data!;
        print(jsonEncode(listUser));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }

  void getsertifikat(BuildContext context) async {
    final response = await sertifikatmod.getsertifikat(context);
    if (response.error == null) {
      if (response.isSuccess == true) {
        listUser2 = response.data!;
        print(jsonEncode(listUser2));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }

  //dokumen
getkebunListDokumen(BuildContext context) async {
  await dblocal.open();
  final response = await dblocal.getkebundokumen(context);
  if (response.isNotEmpty) {
    listkebundokumen.clear();
    listkebundokumen = response;
  } else {
    print("Tidak Ada Data");
  }
  notifyListeners();
}


  void adddokumen(String dokumenName, String dokumenNoBlanko, String foto, BuildContext context) async {
    await dblocal.open();
    await dblocal.adddokumen(dokumenName, dokumenNoBlanko, foto, context);
    getListdokument(context);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Berhasil Tambah Data")));
    notifyListeners();
  }

  EditViewModel(int dokumenId, BuildContext context) {
    getdokumenById(dokumenId, context);
  }

  getdokumenById(int dokumenId, BuildContext context) async {
    await dblocal.open();
    final response = await dblocal.getdokumenById(dokumenId, context);
    if (response != null) {
      datadokumen = response;
    } else {
      print("Tidak Ada Data");
    }
    notifyListeners();
  }

  void editdokument(int dokumenId, String dokumenName, String dokumenNoBlanko, String foto,
      BuildContext context) async {
    await dblocal.open();
    await dblocal.editdokumen(dokumenId, dokumenName, dokumenNoBlanko, foto, context);
    getListdokument(context);
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Berhasil Edit Data")));
    notifyListeners();
  }

  dokumentViewModel(BuildContext context){
    getListdokument(context);
  }

  void getListdokument(BuildContext context) async {
    await dblocal.open();
    final response = await dblocal.getlistdokumen(context);
    if (response.isNotEmpty) {
      listdokumen.clear();
      listdokumen = response;
    } else {
      print("Tidak Ada Data");
    }
    notifyListeners();
  }

  void deletedokument(int dokumentId, BuildContext context) async {
    await dblocal.open();
    await dblocal.deletedokumen(dokumentId, context);
    getListdokument(context);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Berhasil Edit Data")));
    notifyListeners();
  }


  //sertifikat
  getkebunListSertifikat(BuildContext context) async {
    await dblocal.open();
    final response = await dblocal.getkebunsertifikat(context);
    if (response.isNotEmpty) {
      listkebunsertifikasi.clear();
      listkebunsertifikasi = response;
    } else {
      print("Tidak Ada Data");
    }
    notifyListeners();
  }

  sertifikatViewModel(BuildContext context){
    getListsertifikat(context);
  }

  void addsertifikat(String sertifikasiName, String sertifikasiNomor, String sertifikasiTanggalDari, String sertifikasiTanggalSampai, String foto, BuildContext context) async {
    await dblocal.open();
    await dblocal.addsertifikat(sertifikasiName, sertifikasiNomor, sertifikasiTanggalDari, sertifikasiTanggalSampai, foto, context);
    getListsertifikat(context);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Berhasil Tambah Data")));
    notifyListeners();
  }

  EditViewModel2(int sertifikasiId, BuildContext context) {
    getsertifikatById(sertifikasiId, context);
  }

  getsertifikatById(int sertifikasiId, BuildContext context) async {
    await dblocal.open();
    final response = await dblocal.getsertifikatById(sertifikasiId, context);
    if (response != null) {
      datasertifikat = response;
    } else {
      print("Tidak Ada Data");
    }
    notifyListeners();
  }

  void editsertifikat(int sertifikasiId, String sertifikasiName, String sertifikasiNomor, String sertifikasiTanggalDari, String sertifikasiTanggalSampai,foto ,
      BuildContext context) async {
    await dblocal.open();
    await dblocal.editsertifikat(sertifikasiId, sertifikasiName, sertifikasiNomor, sertifikasiTanggalDari, sertifikasiTanggalSampai,foto , context);
    getListsertifikat(context);
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Berhasil Edit Data")));
    notifyListeners();
  }

  void getListsertifikat(BuildContext context) async {
    await dblocal.open();
    final response = await dblocal.getlistsertifikat(context);
    if (response.isNotEmpty) {
      listsertifikat.clear();
      listsertifikat = response;
    } else {
      print("Tidak Ada Data");
    }
    notifyListeners();
  }

  void deletesertifikat(int sertifikasiId, BuildContext context) async {
    await dblocal.open();
    await dblocal.deletesertifikat(sertifikasiId, context);
    getListsertifikat(context);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Berhasil Edit Data")));
    notifyListeners();
  }

}