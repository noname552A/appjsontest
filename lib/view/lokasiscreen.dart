import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:taniku/viewmodel/lokasiview.dart';
import 'package:taniku/model/provinsi.dart';
import 'package:taniku/model/kota.dart';
import 'package:taniku/model/kecamatan.dart';
import 'package:taniku/model/kelurahan.dart';

class lokasiscreen extends StatefulWidget {
  const lokasiscreen({Key? key}) : super(key: key);

  @override
  State<lokasiscreen> createState() => _lokasiscreenState();
}

class _lokasiscreenState extends State<lokasiscreen> {
  var textAlamat = new TextEditingController();
  var textRT = new TextEditingController();
  var textRW = new TextEditingController();
  var kodepos = new TextEditingController();

  var selecteddropdownprovinsi;
  var selecteddropdownkota;
  var selecteddropdowncamat;
  var selecteddropdowndesa;

  var provinsi = new TextEditingController();
  var kota = new TextEditingController();
  var camat = new TextEditingController();
  var desa = new TextEditingController();

  late double width;
  late double height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider<lokasimod>(
        create: (context) => lokasimod(context),
        child: Builder(
            builder: (context) {
              return Consumer<lokasimod>(
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
                                                      child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: <Widget>[
                                                            SizedBox(
                                                              height: 1,
                                                            ),
                                                            Text("Alamat"),

                                                            TextFormField(
                                                                controller: textAlamat,
                                                                style: TextStyle(
                                                                  fontSize: 15,
                                                                ),
                                                                textAlign: TextAlign
                                                                    .start,
                                                                obscureText: false,
                                                                decoration: InputDecoration(
                                                                  hintText: "Description",
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
                                                                    'RT',
                                                                  ),
                                                                ],
                                                              ),

                                                              TextFormField(
                                                                controller: textRT,
                                                                style: TextStyle(fontSize: 15),
                                                                decoration: InputDecoration(
                                                                  hintText: "000",
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
                                                                    'RW',

                                                                  ),
                                                                ],
                                                              ),

                                                              TextFormField(
                                                                controller: textRW,
                                                                style: TextStyle(fontSize: 15),
                                                                decoration: InputDecoration(
                                                                  hintText: "000",
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

                                                    Column(
                                                        crossAxisAlignment: CrossAxisAlignment
                                                            .start,
                                                        children: <Widget>[
                                                          SizedBox(
                                                            height: 1,
                                                          ),
                                                          Text("Provinsi"),
                                                          DropdownButton(
                                                            isExpanded: true,
                                                            hint: Text("Silakhan pilih provinsi"),
                                                            value: selecteddropdownprovinsi,
                                                            onChanged: (newValue) {
                                                              setState(() {
                                                                print(newValue.toString());
                                                                selecteddropdownprovinsi = newValue.toString();
                                                                selecteddropdownkota = null;
                                                                selecteddropdowncamat = null;
                                                                selecteddropdowndesa = null;
                                                                kodepos.clear();
                                                                viewModel.getkota(newValue.toString(), context);
                                                              });
                                                            },
                                                            items: viewModel.listprovinsi.map((Data listprovinsi
                                                                ) {
                                                              return DropdownMenuItem(
                                                                onTap: () {
                                                                  provinsi.text = listprovinsi.provinsiName.toString();
                                                                  print(listprovinsi.provinsiName.toString());
                                                                },
                                                                value: listprovinsi.provinsiId.toString(),
                                                                child: Text(listprovinsi.provinsiName.toString()),
                                                              );
                                                            }
                                                            ).toList(),
                                                          ),
                                                        ]
                                                    ),

                                                    const SizedBox(
                                                      height: 20,
                                                    ),

                                                    Column(
                                                        crossAxisAlignment: CrossAxisAlignment
                                                            .start,
                                                        children: <Widget>[
                                                          SizedBox(
                                                            height: 1,
                                                          ),
                                                          Text("Kota/Kabupaten"),
                                                          DropdownButton(
                                                            isExpanded: true,
                                                            hint: Text("Silakhan pilih Kota/Kabupaten"),
                                                            value: selecteddropdownkota,
                                                            onChanged: (newValue) {
                                                              setState(() {
                                                                print(newValue.toString());
                                                                selecteddropdownkota = newValue.toString();
                                                                selecteddropdowncamat = null;
                                                                selecteddropdowndesa = null;
                                                                kodepos.clear();
                                                                viewModel.getkecamatan(newValue.toString(), context);
                                                              });
                                                            },
                                                            items: viewModel.listkota.map((Data2 listkota
                                                                ) {
                                                              return DropdownMenuItem(
                                                                onTap: () => kota.text = listkota.kabupatenKotaName.toString(),
                                                                value: listkota.kabupatenKotaId.toString(),
                                                                child: Text(listkota.kabupatenKotaName.toString()),
                                                              );
                                                            }
                                                            ).toList(),
                                                          ),
                                                        ]
                                                    ),

                                                    const SizedBox(
                                                      height: 20,
                                                    ),

                                                    Column(
                                                        crossAxisAlignment: CrossAxisAlignment
                                                            .start,
                                                        children: <Widget>[
                                                          SizedBox(
                                                            height: 1,
                                                          ),
                                                          Text("Kecamatan"),
                                                          DropdownButton(
                                                            isExpanded: true,
                                                            hint: Text("Silakhan pilih Kecamataan"),
                                                            value: selecteddropdowncamat,
                                                            onChanged: (newValue) {
                                                              setState(() {
                                                                print(newValue.toString());
                                                                selecteddropdowncamat = newValue.toString();
                                                                selecteddropdowndesa = null;
                                                                kodepos.clear();
                                                                viewModel.getdesa(newValue.toString(), context);
                                                              });
                                                            },
                                                            items: viewModel.listcamat.map((Data3 listcamat
                                                                ) {
                                                              return DropdownMenuItem(
                                                                onTap: () => camat.text = listcamat.kecamatanName.toString(),
                                                                value: listcamat.kecamatanId.toString(),
                                                                child: Text(listcamat.kecamatanName.toString()),
                                                              );
                                                            }
                                                            ).toList(),
                                                          ),
                                                        ]
                                                    ),

                                                    const SizedBox(
                                                      height: 20,
                                                    ),

                                                    Column(
                                                        crossAxisAlignment: CrossAxisAlignment
                                                            .start,
                                                        children: <Widget>[
                                                          SizedBox(
                                                            height: 1,
                                                          ),
                                                          Text("Kelurahan"),
                                                          DropdownButton(
                                                            isExpanded: true,
                                                            hint: Text("Silakhan pilih Kelurahan"),
                                                            value: selecteddropdowndesa,
                                                            onChanged: (newValue) {
                                                              setState(() {
                                                                print(newValue.toString());
                                                                selecteddropdowndesa = newValue.toString();
                                                              });
                                                            },
                                                            items: viewModel.listdesa.map((Data4 listdesa
                                                                ) {
                                                              return DropdownMenuItem(
                                                                onTap: () {
                                                                  kodepos.text = listdesa.kodePos.toString();
                                                                  desa.text = listdesa.kelurahanDesaName.toString();

                                                                },
                                                                value: listdesa.kelurahanDesaId.toString(),
                                                                child: Text(listdesa.kelurahanDesaName.toString()),
                                                              );
                                                            }
                                                            ).toList(),
                                                          ),
                                                        ]
                                                    ),

                                                    const SizedBox(
                                                      height: 20,
                                                    ),

                                                    Column(
                                                        crossAxisAlignment: CrossAxisAlignment
                                                            .start,
                                                        children: <Widget>[
                                                          SizedBox(
                                                            height: 1,
                                                          ),
                                                          Text("Kode Pos"),
                                                          TextFormField(
                                                            readOnly: true,
                                                            controller: kodepos,
                                                          ),
                                                        ]
                                                    ),

                                                    const SizedBox(
                                                      height: 20,
                                                    ),

                                                    Row(
                                                      children: [
                                                        Column(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  print(
                                                                      "Alamat => " +
                                                                          textAlamat.text
                                                                              .toString());

                                                                  print(
                                                                      "RT => " +
                                                                          textRT.text
                                                                              .toString());

                                                                  print(
                                                                      "RW => " +
                                                                          textRW.text
                                                                              .toString());

                                                                  print(
                                                                      "Provinsi => " +
                                                                          provinsi.text
                                                                              .toString());

                                                                  print(
                                                                      "Kota => " +
                                                                          kota.text
                                                                              .toString());

                                                                  print(
                                                                      "Kecamatan => " +
                                                                          camat.text
                                                                              .toString());

                                                                  print(
                                                                      "Kelurahan => " +
                                                                          desa.text
                                                                              .toString());

                                                                  print(
                                                                      "Kode Pos => " +
                                                                          kodepos.text
                                                                              .toString());

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
