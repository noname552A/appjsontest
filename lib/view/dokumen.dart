import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taniku/viewmodel/dbdatamod.dart';
import 'package:taniku/viewmodel/tabviewmod.dart';

class dokumenscreen extends StatefulWidget {
  final TabViewModel parentViewModel;
  const dokumenscreen({Key? key, required this.parentViewModel}) : super(key: key);

  @override
  State<dokumenscreen> createState() => _dokumenscreenState();
}

class _dokumenscreenState extends State<dokumenscreen> {
  var nomor_dokumen = new TextEditingController();

  var selecteddropdowndokumen;

  var dokumen = new TextEditingController();

  late double width;
  late double height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider<dbdatamod>(
        create: (context) => dbdatamod(context),
        child: Builder(
            builder: (context)
            {
              return Consumer<dbdatamod>(
                  builder: (context, viewModel, child) {
                    return Scaffold(
                        extendBodyBehindAppBar: false,
                        backgroundColor: Colors.white,
                        body: SingleChildScrollView(
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 16,),
                                SizedBox(width: 20,),
                                const Text("Data", style: TextStyle(
                                    fontWeight: FontWeight.bold),),
                                const SizedBox(height: 16,),

                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {showDialog(context: context, builder: (context) =>
                                            AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(40.0))),
                                                contentPadding: EdgeInsets.only(),
                                                content: Container(
                                                  padding: EdgeInsets.all(6),
                                                    width: 500.0,
                                                    child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: <Widget>[
                                                          Container(
                                                            padding: const EdgeInsets.only(
                                                                left: 20, right: 20, bottom: 10.0, top: 10),
                                                            decoration: const BoxDecoration(
                                                              color: Colors.blue,
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius.circular(20.0),
                                                                  topRight: Radius.circular(20.0)),
                                                            ),
                                                            child: Column(
                                                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              children: [
                                                                const Text(
                                                                  "Tambah Dokumen Kepemilikan",
                                                                  style: TextStyle(color: Colors.white, fontSize: 18),
                                                                  textAlign: TextAlign.center,
                                                                ),
                                                              ],
                                                            ),
                                                          ),

                                                          const SizedBox(
                                                            height: 10,
                                                          ),

                                                          Column(
                                                              crossAxisAlignment: CrossAxisAlignment
                                                                  .start,
                                                              children: <Widget>[
                                                                SizedBox(
                                                                  height: 1,
                                                                ),
                                                                Text("Dokumen"),
                                                                DropdownButton(
                                                                  isExpanded: true,
                                                                  hint: Text("Silakhan pilih Dokumen"),
                                                                  value: selecteddropdowndokumen,
                                                                  onChanged: (newValue) {
                                                                    setState(() {
                                                                      print(newValue.toString());
                                                                      selecteddropdowndokumen = newValue;
                                                                    });
                                                                  },
                                                                  items: viewModel.listUser.map((
                                                                        listUser) {
                                                                    return DropdownMenuItem(
                                                                      onTap: () {
                                                                        dokumen.text = listUser.dokumenName.toString();
                                                                        print(listUser.dokumenName.toString());
                                                                      },
                                                                      value: listUser.dokumenName.toString(),
                                                                      child: Text(listUser.dokumenName.toString()),
                                                                    );
                                                                  }

                                                                  ).toList(),
                                                                ),
                                                              ]
                                                          ),

                                                          const SizedBox(
                                                            height: 10,
                                                          ),


                                                          Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: <Widget>[
                                                              SizedBox(
                                                                height: 1,
                                                              ),
                                                              Text("No Dokumen"),

                                                              TextFormField(
                                                                  controller: nomor_dokumen,
                                                                  style: TextStyle(
                                                                    fontSize: 15,
                                                                  ),
                                                                  textAlign: TextAlign
                                                                      .start,
                                                                  obscureText: false,
                                                                  decoration: InputDecoration(
                                                                    hintText: "No Dokumen",
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
                                                                          'Foto Dokumen',
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
                                                                                  padding: EdgeInsets.all(12),
                                                                                    width: 500.0,
                                                                                    child: Column(
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        children: <Widget>[
                                                                                          Container(
                                                                                            padding: const EdgeInsets.only(
                                                                                                left: 20, right: 20, bottom: 10.0, top: 10),
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
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                            children: [
                                                              Column(
                                                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    InkWell(
                                                                      onTap: () {
                                                                        viewModel.adddokumen(selecteddropdowndokumen.toString(), nomor_dokumen.text.toString(), "foto", context);
                                                                      dokumen.clear();
                                                                      nomor_dokumen.clear();
                                                                      selecteddropdowndokumen.clear();
                                                                        Navigator.pop(context);
                                                                        },
                                                                      child: Container(
                                                                        width: width * 0.2,
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
                                                                width: 5,
                                                              ),
                                                              Column(
                                                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    InkWell(
                                                                      onTap: () => Navigator.pop(context),
                                                                      child: Container(
                                                                        width: width * 0.2,
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
                                                    ))
                                            ),
                                        );



                                        },
                                        child: Container(
                                          width: MediaQuery.of(context).size.width,
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 15,
                                          ),
                                          alignment: Alignment.center,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                            color: Colors.lightBlueAccent,
                                          ),
                                          child: const Text(
                                            'Tambah Dokumen Kepemilikan',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]
                                ),



                                const SizedBox(height: 16,),
                                ListView.builder(
                                  physics: ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: viewModel.listdokumen.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                        onTap: () {
                                          print("data : ${viewModel
                                              .listUser[index].dokumenId
                                              .toString()}"

                                          );
                                        },
                                        child: Container(
                                          width: 150,
                                          alignment: Alignment.center,
                                          child: Card(
                                              child: Container(
                                                width: double.infinity,
                                                margin: const EdgeInsets.all(8),
                                                child: Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .start,
                                                    children: [
                                                      Column(
                                                          children: [
                                                            InkWell(
                                                             // onTap: () => viewModel.deletedokument(int.parse(viewModel.listdokumen[index].dokumenId.toString()), context),
                                                              child: Image.asset(
                                                                "asset: assets/flutter.png",
                                                                  // viewModel
                                                                  //     .listUser[index]
                                                                  //     .toString(),
                                                                  width: 60,
                                                                  height: 60,
                                                                  errorBuilder: (
                                                                      context,
                                                                      error,
                                                                      stackTrace) {
                                                                    return Container(
                                                                        child: const Icon(
                                                                            Icons
                                                                                .error_outline,
                                                                            size: 24)
                                                                    );
                                                                  }
                                                              ),
                                                            )
                                                          ]
                                                      ),

                                                      SizedBox(
                                                        height: 5, width: 20,),
                                                      Column(
                                                        children: [
                                                          Text("Dokumen"),
                                                          const SizedBox(
                                                            height: 8,),
                                                          Text(viewModel
                                                              .listdokumen[index]
                                                              .dokumenName
                                                              .toString(),
                                                              style: const TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight
                                                                      .bold)),
                                                          Text(viewModel
                                                              .listdokumen[index]
                                                              .dokumenNoBlanko.toString(),
                                                              style: const TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight
                                                                      .bold)),
                                                        ],
                                                      ),

                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          IconButton(icon: Icon(
                                                            Icons.mode_edit
                                                          ) ,onPressed: () async {
                                                            await viewModel.getdokumenById(int.parse(
                                                          viewModel.listdokumen[index].dokumenId.toString()), context);
                                                          showDialog(context: context, builder: (context) {
                                                           var nama = viewModel.datadokumen.dokumenName.toString();
                                                           var nomor = viewModel.datadokumen.dokumenNoBlanko.toString();
                                                           nomor_dokumen.text = nomor;
                                                            return AlertDialog(
                                                              shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.all(Radius.circular(40.0))),
                                                              contentPadding: EdgeInsets.only(),
                                                              content: Container(
                                                                padding: EdgeInsets.all(8),
                                                              width: 500.0,
                                                                child: Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                  children: <Widget>[
                                                                  Container(
                                                                    padding: const EdgeInsets.only(
                                                                    left: 10, right: 30, bottom: 10.0, top: 10),
                                                                    decoration: const BoxDecoration(
                                                                     color: Colors.blue,
                                                                      borderRadius: BorderRadius.only(
                                                                       topLeft: Radius.circular(40.0),
                                                                       topRight: Radius.circular(40.0)),
                                                                        ),
                                                                     child: Column(
                                                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                       crossAxisAlignment: CrossAxisAlignment.center,
                                                                        children: [
                                                                          const Text(
                                                                          "Edit Dokumen Kepemilikan",
                                                                           style: TextStyle(color: Colors.white, fontSize: 18),
                                                                             textAlign: TextAlign.center,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),

                                                                   const SizedBox(
                                                                   height: 20,
                                                                   ),

                                                                  Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: <Widget>[
                                                                    SizedBox(
                                                                      height: 1,
                                                                    ),
                                                                      Text("Dokumen"),
                                                                      DropdownButton(
                                                                        isExpanded: true,
                                                                        hint: Text("Silakhan pilih Dokumen"),
                                                                        value: selecteddropdowndokumen??nama,
                                                                        onChanged: (newValue) {
                                                                          setState(() {
                                                                          print(newValue.toString());
                                                                          selecteddropdowndokumen = newValue;
                                                                          });
                                                                        },
                                                                          items: viewModel.listUser.map((
                                                                          listUser) {
                                                                            return DropdownMenuItem(
                                                                            onTap: () {
                                                                              dokumen.text = listUser.dokumenName.toString();
                                                                              print(listUser.dokumenName.toString());
                                                                            },
                                                                              value: listUser.dokumenName.toString(),
                                                                              child: Text(listUser.dokumenName.toString()),
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
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: <Widget>[
                                                                    SizedBox(
                                                                      height: 1,
                                                                    ),
                                                                    Text("No Dokumen"),

                                                                    TextFormField(
                                                                    controller: nomor_dokumen,
                                                                    style: TextStyle(
                                                                    fontSize: 15,
                                                                    ),
                                                                      textAlign: TextAlign.start,
                                                                       obscureText: false,
                                                                        decoration: InputDecoration(
                                                                        hintText: "No Dokumen",
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
                                                                            'Foto Dokumen',
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
                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                      children: [
                                                                        InkWell(
                                                                          onTap: () {
                                                                          viewModel.editdokument(int.parse(viewModel.datadokumen.dokumenId.toString()),selecteddropdowndokumen.toString(),
                                                                              nomor_dokumen.text.toString(), "foto", context);
                                                                          dokumen.clear();
                                                                          nomor_dokumen.clear();
                                                                          selecteddropdowndokumen.clear();
                                                                          Navigator.pop(context);
                                                                          },
                                                                          child: Container(
                                                                          width: width * 0.2,
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
                                                                    width: 10,
                                                                  ),
                                                                    Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        InkWell(
                                                                        onTap: () {Navigator.pop(context);
                                                                          dokumen.clear();
                                                                          nomor_dokumen.clear();
                                                                          selecteddropdowndokumen.clear();

                                                                        },
                                                                          child: Container(
                                                                          width: width * 0.2,
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
                                                          ))
                                                        );
                                                    },
                                                          );
                                                          },
                                                              ),

                                                          IconButton(onPressed: ()=> viewModel.deletedokument(int.parse(viewModel.listdokumen[index].dokumenId.toString()), context)

                                                              , icon: Icon(Icons.delete) )
                                                        ],
                                                      )

                                                    ]
                                                ),
                                              )
                                          ),
                                        )
                                    );
                                  },
                                ),


                                const SizedBox(height: 16,),
                                const SizedBox(height: 90,),

                                Row(
                                  children: [
                                    Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              widget.parentViewModel.addKebunModel.listDokumen = viewModel.listkebundokumen;

                                              print(
                                                jsonEncode(
                                                    widget.parentViewModel.addKebunModel.listDokumen)
                                              );
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
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
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
                              ],
                            ),
                          ),
                        )
                    );
                  }
                  );
              },
        )
    );
  }
}
