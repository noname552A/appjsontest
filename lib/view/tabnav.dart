import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:taniku/view/dokumen.dart';
import 'package:taniku/view/kebun.dart';
import 'package:taniku/view/lokasiscreen.dart';
import 'package:taniku/view/sertifikat.dart';
import 'package:taniku/viewmodel/dbdatamod.dart';
import 'package:taniku/viewmodel/tabviewmod.dart';
import 'package:provider/provider.dart';

class tabnav extends StatefulWidget {
  const tabnav({Key? key}) : super(key: key);

  @override
  State<tabnav> createState() => _tabnavState();
}

class _tabnavState extends State<tabnav> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TabViewModel>(
        create: (context) => TabViewModel(),
        child: Builder(
            builder: (context) {
              return Consumer<TabViewModel>(
                  builder: (context, viewModel, child) {
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
                          body:  TabBarView(
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              lokasiscreen(parentViewModel: viewModel),
                              kebunscreen(parentViewModel: viewModel),
                              dokumenscreen(parentViewModel: viewModel),
                              sertifikatscreen(parentViewModel: viewModel),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  );
            }
            )
    );
  }
}
