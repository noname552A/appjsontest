import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/cupertino.dart';
import 'package:taniku/model/dokumen3.dart';
import 'package:taniku/model/sertifikat2.dart';

class database{
  late Database db;

  Future open() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'taniku.db');
    //join is from path package
    print(path);

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
                  
                  CREATE TABLE IF NOT EXISTS dokumen(
                      dokumenId integer not null primary key autoincrement,
                      dokumenName varchar (255) not null,
                      dokumenNoBlanko varchar (255),
                      foto varchar (255)
                      );
                      
                      //create more table 
        
        ''');

          await db.execute('''
                      
                      
                  CREATE TABLE IF NOT EXISTS sertifikat(
                      sertifikasiId integer not null primary key autoincrement,
                      sertifikasiName varchar (255) not null,
                      sertifikasiNomor varchar (255),
                      sertifikasiTanggalDari varchar (255),
                      sertifikasiTanggalSampai varchar (255),
                      foto varchar (255)
                      );
          
          
          ''');
          print("Table Created");

        }
    );


  }

// note: get list user
  Future<List<Datadokumen>> getlistdokumen(BuildContext context) async {
    final List<Map<String, dynamic>> data = await db.rawQuery('SELECT * FROM dokumen');
    print(data);
    if (data.isNotEmpty) {
      return List.generate(data.length, (i) {
        return Datadokumen(
          dokumenId: data[i]['dokumenId'],
          dokumenName: data[i]['dokumenName'],
          dokumenNoBlanko: data[i]['dokumenNoBlanko'],
          foto: data[i]['foto'],
        );
      });
    }
    return [];
  }

  adddokumen(String dokumenName, String dokumenNoBlanko, String foto, BuildContext context) async {
    await db.rawInsert("INSERT INTO dokumen (dokumenName, dokumenNoBlanko, foto) VALUES (?, ?, ?);",
        [dokumenName, dokumenNoBlanko, foto ]);
  }

  Future<Datadokumen?> getdokumenById(int dokumenId, BuildContext context) async {
    List<Map> maps = await db.query('dokumen',
        where: 'dokumenId = ?',
        whereArgs: [dokumenId]);
    if (maps.isNotEmpty) {
      return Datadokumen(
        dokumenId: maps[0]['dokumenId'],
        dokumenName: maps[0]['dokumenName'],
        dokumenNoBlanko: maps[0]['dokumenNoBlanko'],
        foto: maps[0]['foto'],
      );
    }
    return null;
  }

  editdokumen(int dokumenId, String dokumenName, String dokumenNoBlanko, String foto, BuildContext context) async {
    await db.rawInsert("UPDATE dokumen SET dokumenName  = ?, dokumenNoBlanko = ?, foto = ? , WHERE dokumenId = ?",
        [dokumenName, dokumenNoBlanko, foto , dokumenId]);
  }

  deletedokumen(int dokumenId, BuildContext context) async {
    await db.rawDelete("DELETE FROM dokumen WHERE dokumenId = ?", [dokumenId]);
  }


  Future<List<Data2>> getlistsertifikat(BuildContext context) async {
    final List<Map<String, dynamic>> data = await db.rawQuery('SELECT * FROM sertifikat');
    print(data);
    if (data.isNotEmpty) {
      return List.generate(data.length, (i) {
        return Data2(
          sertifikasiId: data[i]['sertifikasiId'],
          sertifikasiName: data[i]['sertifikasiName'],
          sertifikasiNomor: data[i]["sertifikasiNomor"],
          sertifikasiTanggalDari: data[i]["sertifikasiTanggalDari"],
          sertifikasiTanggalSampai: data[i]["sertifikasiTanggalSampai"]
          );
      });
    }
    return [];
  }

  addsertifikat(String sertifikasiName, String sertifikasiNomor, String sertifikasiTanggalDari, String sertifikasiTanggalSampai, BuildContext context) async {
    await db.rawInsert("INSERT INTO sertifikat (sertifikasiName, sertifikasiNomor, sertifikasiTanggalDari, sertifikasiTanggalSampai ) VALUES (?);",
        [sertifikasiName,sertifikasiNomor ,sertifikasiTanggalDari, sertifikasiTanggalSampai]);
  }

  Future<Data2?> getsertifikatById(int sertifikasiId, BuildContext context) async {
    List<Map> maps = await db.query('sertifikat',
        where: 'sertifikasiId = ?',
        whereArgs: [sertifikasiId]);
    if (maps.isNotEmpty) {
      return Data2(
        sertifikasiId: maps[0]['sertifikasiId'],
        sertifikasiName: maps[0]['sertifikasiName'],
        sertifikasiNomor: maps[0]['sertifikasiNomor'],
        sertifikasiTanggalDari: maps[0]['sertifikasiTanggalDari'],
        sertifikasiTanggalSampai: maps[0]['sertifikasiTanggalSampai'],
      );
    }
    return null;
  }

  editsertifikat(int sertifikasiId, String sertifikasiName, String sertifikasiNomor, String sertifikasiTanggalDari, String sertifikasiTanggalSampai, BuildContext context) async {
    await db.rawInsert("UPDATE sertifikat SET sertifikasiName  = ?, sertifikasiNomor = ?, sertifikasiTanggalDari = ?, sertifikasiTanggalSampai = ?,  WHERE sertifikasiId = ?",
        [sertifikasiName, sertifikasiNomor, sertifikasiTanggalDari, sertifikasiTanggalSampai, sertifikasiId]);
  }

  deletesertifikat(int sertifikasiId, BuildContext context) async {
    await db.rawDelete("DELETE FROM sertifikat WHERE sertifikasiId = ?", [sertifikasiId]);
  }


}