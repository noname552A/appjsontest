import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:taniku/view/dokumen.dart';
import 'package:taniku/view/kebun.dart';
import 'package:taniku/view/lokasiscreen.dart';

class tabnav extends StatefulWidget {
  const tabnav({Key? key}) : super(key: key);

  @override
  State<tabnav> createState() => _tabnavState();
}

class _tabnavState extends State<tabnav> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0x44000000),
            elevation: 0,
            bottom: const TabBar(
              tabs: [
                Tab(
                    text: ("Alamat"),
                ),
                Tab(
                    text: ("Kebun"),
                ),
                Tab(
                    text: ("Dokumen"),
                ),
                Tab(
                  text: ("Sertifikasi"),
                ),
              ],
            ),
            title: const Text('Tambah Kebun'),
          ),
          body: const TabBarView(
            children: [
              const lokasiscreen(),
              const kebunscreen(),
              const dokumenscreen(),
              Text("lorem ipsum3"),
            ],
          ),
        ),
      ),
    );
  }
}
