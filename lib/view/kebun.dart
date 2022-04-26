import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:taniku/viewmodel/kebunmod.dart';
import 'package:taniku/model/bibit.dart';
import 'package:taniku/model/lahan.dart';
import 'package:taniku/viewmodel/tabviewmod.dart';


class kebunscreen extends StatefulWidget {
  final TabViewModel parentViewModel;
  const kebunscreen({Key? key, required this.parentViewModel}) : super(key: key);

  @override
  State<kebunscreen> createState() => kebunscreenState();
}

class kebunscreenState extends State<kebunscreen> {
  var luaskebun = new TextEditingController();
  var jumlahpohon = new TextEditingController();
  var produksi = new TextEditingController();
  var tahuntanam = new TextEditingController();

  var selecteddropdownbibit;
  var selecteddropdownlahan;

  var bibit = new TextEditingController();
  var lahan = new TextEditingController();
  var camat = new TextEditingController();
  var desa = new TextEditingController();

  late double width;
  late double height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider<kebunmod>(
        create: (context) => kebunmod(context),
        child: Builder(
            builder: (context) {
              return Consumer<kebunmod>(
                  builder: (context, viewModel, child) {
                    return Scaffold(
                        body: Form(
                            child: SingleChildScrollView(
                                child: Stack(
                                    children: <Widget>[
                                      Container(
                                          padding: EdgeInsets.all(8),
                                          child: Column(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                    vertical: 5,
                                                  ),
                                                  child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Expanded(
                                                        child: Column(
                                                          children: [
                                                          SizedBox(
                                                          height: 1,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text("Luas Kebun"),
                                                          ],
                                                        ),

                                                        TextFormField(
                                                            controller: luaskebun,
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                            ),
                                                            textAlign: TextAlign
                                                                .start,
                                                            obscureText: false,
                                                            decoration: InputDecoration(
                                                              hintText: "Luas Kebun",
                                                              border: OutlineInputBorder(
                                                                borderRadius: BorderRadius.all(
                                                                    Radius.circular(
                                                                        10
                                                                    )
                                                                ),
                                                              ),
                                                              fillColor: Colors.black,
                                                            ),
                                                            validator: (value) {
                                                              if (value!.isEmpty) {
                                                                return "Value tidak boleh kosong";
                                                              }
                                                              return null;
                                                            }

                                                        ),
                                                          ]
                                                        ),
                                                        ),

                                                         const SizedBox(
                                                          width: 30,
                                                        ),

                                                        Expanded(
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment
                                                                  .start,
                                                              children: <Widget>[
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      'Jenis Bibit',
                                                                    ),
                                                                  ],
                                                                ),
                                                                DropdownButton(
                                                                  isExpanded: true,
                                                                  hint: Text("Silakhan pilih bibit"),
                                                                  value: selecteddropdownbibit,
                                                                  onChanged: (newValue) {
                                                                    setState(() {
                                                                      print(newValue.toString());
                                                                      selecteddropdownbibit = newValue.toString();
                                                                    });
                                                                  },
                                                                  items: viewModel.listbibit.map((Data listbibit
                                                                      ) {
                                                                    return DropdownMenuItem(
                                                                      onTap: () {
                                                                        bibit.text = listbibit.jenisBibitName.toString();
                                                                        print(listbibit.jenisBibitName.toString());
                                                                      },
                                                                      value: listbibit.jenisBibitId.toString(),
                                                                      child: Text(listbibit.jenisBibitName.toString()),
                                                                    );
                                                                  }
                                                                  ).toList(),
                                                                ),
                                                                ],
                                                            )
                                                        )
                                                      ]
                                                  ),
                                                ),

                                                const SizedBox(
                                                  height: 20,
                                                ),

                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                'Tipe Lahan',
                                                              ),
                                                            ],
                                                          ),

                                                          DropdownButton(
                                                            isExpanded: true,
                                                            hint: Text("Silakhan pilih Jenis "
                                                                "lahan"),
                                                            value: selecteddropdownlahan,
                                                            onChanged: (newValue) {
                                                              setState(() {
                                                                print(newValue.toString());
                                                                selecteddropdownlahan = newValue.toString();
                                                              });
                                                            },
                                                            items: viewModel.listlahan.map((Data2 listlahan
                                                                ) {
                                                              return DropdownMenuItem(
                                                                onTap: () {
                                                                  lahan.text = listlahan.statusLahanName.toString();
                                                                  print(listlahan.statusLahanName.toString());
                                                                },
                                                                value: listlahan.statusLahanId.toString(),
                                                                child: Text(listlahan.statusLahanName.toString()),
                                                              );
                                                            }
                                                            ).toList(),
                                                          ),
                                                        ],
                                                      ),
                                                    ),

                                                    const SizedBox(
                                                      width: 30,
                                                    ),

                                                    Expanded(
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                'Tahun Tanam',

                                                              ),
                                                            ],
                                                          ),

                                                          TextFormField(
                                                              controller: tahuntanam,
                                                              style: TextStyle(fontSize: 15),
                                                              decoration: InputDecoration(
                                                                hintText: "1992",
                                                                border: OutlineInputBorder(
                                                                    borderRadius: BorderRadius.all(
                                                                        Radius.circular(10))),
                                                              ),
                                                              validator: (value) {
                                                                if (value!.isEmpty) {
                                                                  return "Value tidak boleh kosong";
                                                                }
                                                                return null;
                                                              }
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                const SizedBox(
                                                  height: 20,
                                                ),

                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                'Jumlah Pohon',
                                                              ),
                                                            ],
                                                          ),

                                                          TextFormField(
                                                              controller: jumlahpohon,
                                                              style: TextStyle(fontSize: 15),
                                                              decoration: InputDecoration(
                                                                hintText: "Jumlah Pohon",
                                                                border: OutlineInputBorder(
                                                                    borderRadius: BorderRadius.all(
                                                                        Radius.circular(10))),
                                                              ),
                                                              validator: (value) {
                                                                if (value!.isEmpty) {
                                                                  return "Value tidak boleh kosong";
                                                                }
                                                                return null;
                                                              }
                                                          ),
                                                        ],
                                                      ),
                                                    ),

                                                    const SizedBox(
                                                      width: 30,
                                                    ),

                                                    Expanded(
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                'Produksi Per Bulan',

                                                              ),
                                                            ],
                                                          ),

                                                          TextFormField(
                                                              controller: produksi,
                                                              style: TextStyle(fontSize: 15),
                                                              decoration: InputDecoration(
                                                                hintText: "Produksi",
                                                                border: OutlineInputBorder(
                                                                    borderRadius: BorderRadius.all(
                                                                        Radius.circular(10))),
                                                              ),
                                                              validator: (value) {
                                                                if (value!.isEmpty) {
                                                                  return "Value tidak boleh kosong";
                                                                }
                                                                return null;
                                                              }
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                const SizedBox(
                                                  height: 20,
                                                ),

                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                'Foto Kebun',
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                              width: 150,
                                                              alignment: Alignment.center,
                                                              child: Card(
                                                                elevation: 15,
                                                                child: Container(
                                                                  width: double.infinity,
                                                                  margin: const EdgeInsets.all(8),
                                                                  child: Column(
                                                                      children: [
                                                                  Container(
                                                                  padding: EdgeInsets.all(16),
                                                                  child: Icon(
                                                                    Icons.maps_home_work_rounded,
                                                                    size: 50,
                                                                  ),
                                                                ),
                                                                ]

                                                            )
                                                          )
                                                              )
                                                              )
                                                        ],
                                                      ),
                                                    ),

                                                    const SizedBox(
                                                      width: 30,
                                                    ),

                                                    Expanded(
                                                      child: Column(
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              showDialog(context: context, builder: (context) =>
                                                                  AlertDialog(
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                                                                    contentPadding: EdgeInsets.only(),
                                                                    content: Container(
                                                                      width: 500.0,
                                                                      child: Column(
                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                          mainAxisSize: MainAxisSize.min,
                                                                          children: <Widget>[
                                                                      Container(
                                                                      padding: const EdgeInsets.only(
                                                                          left: 10, right: 10, bottom: 10.0, top: 10),
                                                                      decoration: const BoxDecoration(
                                                                        color: Colors.blue,
                                                                        borderRadius: BorderRadius.only(
                                                                            topLeft: Radius.circular(20.0),
                                                                            topRight: Radius.circular(20.0)),
                                                                      ),
                                                                      child: Row(
                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                        children: [
                                                                          const Text(
                                                                            "Pilih Aksi",
                                                                            style: TextStyle(color: Colors.white, fontSize: 18),
                                                                            textAlign: TextAlign.center,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Column(
                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                      children: <Widget>[
                                                                        InkWell(
                                                                          onTap: () {

                                                                          },
                                                                          child: const Text(
                                                                            'Unggah dari Gallery',
                                                                            style: TextStyle(
                                                                              fontSize: 16,
                                                                              color: Colors.black,
                                                                            ),
                                                                          ),
                                                                        ),

                                                                      ],
                                                                    ),

                                                                    Column(
                                                                      children: <Widget>[
                                                                        InkWell(
                                                                          onTap: () {

                                                                          },
                                                                          child: const Text(
                                                                            'Unggah dari Foto',
                                                                            style: TextStyle(
                                                                              fontSize: 16,
                                                                              color: Colors.black,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ]
                                                                      )
                                                                    )
                                                                  )
                                                              );
                                                              print("Hello");
                                                            },
                                                            child: Container(
                                                              width: MediaQuery.of(context).size.width,
                                                              padding: const EdgeInsets.symmetric(
                                                                vertical: 12,
                                                              ),
                                                              alignment: Alignment.center,
                                                              decoration: const BoxDecoration(
                                                                borderRadius: BorderRadius.all(
                                                                  Radius.circular(10),
                                                                ),
                                                                color: Colors.orange,
                                                              ),
                                                              child: const Text(
                                                                'Unggah',
                                                                style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors.white,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),


                                                const SizedBox(
                                                  height: 40,
                                                ),

                                                Row(
                                                  children: [
                                                    Column(
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              widget.parentViewModel.addKebunModel.luasKebun = luaskebun.text.toString();
                                                              widget.parentViewModel.addKebunModel.jenisBibitId = bibit.text.toString();
                                                              widget.parentViewModel.addKebunModel.statusLahanId = lahan.text.toString();
                                                              widget.parentViewModel.addKebunModel.tahunTanamId = tahuntanam.text.toString();
                                                              widget.parentViewModel.addKebunModel.potensiProduksi = produksi.text.toString();


                                                              print(

                                                                  "Luas Kebun => " +
                                                                      luaskebun.text
                                                                          .toString()+" HA");

                                                              print(
                                                                  "Jenis Bibit => " +
                                                                      bibit.text
                                                                          .toString());

                                                              print(
                                                                  "Tipe Lahan => " +
                                                                      lahan.text
                                                                          .toString());

                                                              print(
                                                                  "Tahun Tanam => " +
                                                                      tahuntanam.text
                                                                          .toString());

                                                              print(
                                                                  "Produksi/Bulan => " +
                                                                      produksi.text
                                                                          .toString()+" ton/bulan");

                                                              },
                                                            child: Container(
                                                              width: width * 0.4,
                                                              padding: const EdgeInsets.all(
                                                                8,
                                                              ),
                                                              alignment: Alignment.center,
                                                              decoration: const BoxDecoration(
                                                                borderRadius: BorderRadius.all(
                                                                  Radius.circular(15),
                                                                ),
                                                                color: Colors.lightBlueAccent,
                                                              ),
                                                              child: const Text(
                                                                'Send',
                                                                style: TextStyle(
                                                                  fontSize: 20,
                                                                  color: Colors.white,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ]
                                                    ),
                                                    const SizedBox(
                                                      width: 50,
                                                    ),
                                                    Column(
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          InkWell(
                                                            onTap: () => Navigator.pop(context),
                                                            child: Container(
                                                              width: width * 0.4,
                                                              padding: const EdgeInsets.all(
                                                                8,
                                                              ),
                                                              alignment: Alignment.center,
                                                              decoration: const BoxDecoration(
                                                                borderRadius: BorderRadius.all(
                                                                  Radius.circular(15),
                                                                ),
                                                                color: Colors.black,
                                                              ),
                                                              child: const Text(
                                                                'Cancel',
                                                                style: TextStyle(
                                                                  fontSize: 20,
                                                                  color: Colors.lightBlue,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ]
                                                    ),
                                                  ],
                                                ),



                                              ]
                                          )
                                      )
                                    ]
                                )
                            )
                        )



                    );
                  }
              );
            }
        )
    );
  }
}
