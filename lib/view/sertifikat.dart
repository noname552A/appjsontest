import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:taniku/viewmodel/dbdatamod.dart';
import 'package:taniku/viewmodel/tabviewmod.dart';


class sertifikatscreen extends StatefulWidget {
  final TabViewModel parentViewModel;
  const sertifikatscreen({Key? key, required this.parentViewModel}) : super(key: key);

  @override
  State<sertifikatscreen> createState() => _sertifikatscreenState();
}

class _sertifikatscreenState extends State<sertifikatscreen> {
  var nomor_sertifikat = new TextEditingController();

  var selecteddropdownsertifikat;

  List<String> dropdownList = ["Senin","Selasa","Rabu","Kamis","Jumat","Sabtu","Minggu"];

  var sertifikat = new TextEditingController();
  var namasertifikat = new TextEditingController();

  var textController = new TextEditingController();
  late String date;
  late double height;
  late double width;
  late String setTime;
  late String setDate;
  late String dateTime;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);
  TextEditingController _dateController = TextEditingController();
  TextEditingController _dateController2 = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        date = DateFormat("yyyy-MM-dd").format(selectedDate);
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
  }

  @override
  void initState() {
    _dateController.text = DateFormat.yMd().format(DateTime.now());
    _dateController2.text = DateFormat.yMd().format(DateTime.now());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    dateTime = DateFormat.yMd().format(DateTime.now());
    return ChangeNotifierProvider<dbdatamod>(
        create: (context) => dbdatamod(context),
        child: Builder(
          builder: (context)
          {
            return Consumer<dbdatamod>(
                builder: (context, viewModel, child) {
                  return Scaffold(
                      extendBodyBehindAppBar: false,
                      backgroundColor: Colors.blue,
                      body: SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Listview Horizontal
                              const SizedBox(height: 16,),
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
                                                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
                                              contentPadding: EdgeInsets.only(),
                                              content: Container(
                                                padding: EdgeInsets.all(8),
                                                  width: 500.0,
                                                  child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              const Text(
                                                                "Tambah Sertifikat Kepemilikan",
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
                                                            crossAxisAlignment: CrossAxisAlignment
                                                                .start,
                                                            children: <Widget>[
                                                              SizedBox(
                                                                height: 1,
                                                              ),
                                                              Text("Sertifikat"),
                                                              DropdownButton(
                                                                isExpanded: true,
                                                                hint: Text("Silakhan pilih sertifikat"),
                                                                value: selecteddropdownsertifikat,
                                                                onChanged: (newValue) {
                                                                  setState(() {
                                                                    print(newValue.toString());
                                                                    selecteddropdownsertifikat = newValue;
                                                                  });
                                                                },
                                                                items: viewModel.listUser2.map((
                                                                    listUser2) {
                                                                  return DropdownMenuItem(
                                                                    onTap: () {
                                                                      sertifikat.text = listUser2.sertifikasiName.toString();
                                                                      print(listUser2.sertifikasiName.toString());
                                                                    },
                                                                    value: listUser2.sertifikasiName.toString(),
                                                                    child: Text(listUser2.sertifikasiName.toString()),
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
                                                              Text("No Sertifikat"),

                                                              TextFormField(
                                                                  controller: nomor_sertifikat,
                                                                  style: TextStyle(
                                                                    fontSize: 15,
                                                                  ),
                                                                  textAlign: TextAlign
                                                                      .start,
                                                                  obscureText: false,
                                                                  decoration: InputDecoration(
                                                                    hintText: "No Sertifikat",
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
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: <Widget>[
                                                              Column(
                                                                children: <Widget>[
                                                                  Text(
                                                                    'Choose Start Date',
                                                                    style: TextStyle(
                                                                      fontStyle: FontStyle.italic,
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    onTap: () {
                                                                      _selectDate(context);
                                                                    },
                                                                    child: Container(
                                                                      width: width * 0.3,
                                                                      height: height * 0.1,
                                                                      margin: EdgeInsets.all(8),
                                                                      alignment: Alignment.center,
                                                                      decoration: BoxDecoration(color: Colors.white),
                                                                      child: TextFormField(
                                                                        style: TextStyle(fontSize: 16),
                                                                        textAlign: TextAlign.center,
                                                                        enabled: false,
                                                                        keyboardType: TextInputType.text,
                                                                        controller: _dateController,
                                                                        //onSaved: (String date) {
                                                                        //setDate = date;
                                                                        //},
                                                                        decoration: InputDecoration(
                                                                            border: OutlineInputBorder(
                                                                              borderRadius: BorderRadius
                                                                                  .circular(
                                                                                10,
                                                                              ),
                                                                            ),
                                                                            contentPadding: EdgeInsets.only(top: 0.0)),
                                                                      ),
                                                                    ),
                                                                  ),

                                                                ],
                                                              ),
                                                              Column(
                                                                children: <Widget>[
                                                                  Text(
                                                                    'Choose End Date',
                                                                    style: TextStyle(
                                                                      fontStyle: FontStyle.italic,
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    onTap: () {
                                                                      _selectDate(context);
                                                                    },
                                                                    child: Container(
                                                                      margin: EdgeInsets.all(12),
                                                                      width: width * 0.3,
                                                                      height: height * 0.1,
                                                                      alignment: Alignment.center,
                                                                      decoration: BoxDecoration(color: Colors.white),
                                                                      child: TextFormField(
                                                                        style: TextStyle(fontSize: 16),
                                                                        textAlign: TextAlign.center,
                                                                        // onSaved: (String time) {
                                                                        //   setTime = time;
                                                                        //   },
                                                                        enabled: false,
                                                                        keyboardType: TextInputType.text,
                                                                        controller: _dateController2,
                                                                        decoration: InputDecoration(
                                                                            border: OutlineInputBorder(
                                                                              borderRadius: BorderRadius
                                                                                  .circular(
                                                                                10,
                                                                              ),
                                                                            ),
                                                                            contentPadding: EdgeInsets.all(5)
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
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
                                                                        'Foto Sertifikat',
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
                                                                                padding: EdgeInsets.all(8),
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
                                                                      viewModel.addsertifikat(selecteddropdownsertifikat.toString(), nomor_sertifikat.text.toString(),_dateController.toString(),_dateController2.toString(), "foto", context);
                                                                      Navigator.pop(context);
                                                                      selecteddropdownsertifikat.clear();
                                                                      nomor_sertifikat.clear();
                                                                      _dateController.clear();
                                                                      _dateController2.clear();
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
                                                                    onTap: () {
                                                                      Navigator.pop(context);
                                                                      selecteddropdownsertifikat.clear();
                                                                      nomor_sertifikat.clear();
                                                                      _dateController.clear();
                                                                      _dateController2.clear();
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
                                          'Edit Sertifikat Kepemilikan',
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
                                itemCount: viewModel.listsertifikat.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                      onTap: () {
                                        print("data : ${viewModel
                                            .listsertifikat[index].sertifikasiId
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
                                                          Image.network(
                                                              viewModel
                                                                  .listsertifikat[index]
                                                                  .foto
                                                                  .toString(),
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
                                                          )
                                                        ]
                                                    ),

                                                    SizedBox(
                                                      height: 5, width: 20,),
                                                    Column(
                                                      children: [
                                                        Text("Sertifikat"),
                                                        const SizedBox(
                                                          height: 8,),
                                                        Text(viewModel
                                                            .listsertifikat[index]
                                                            .sertifikasiName
                                                            .toString(),
                                                            style: const TextStyle(
                                                                fontSize: 16,
                                                                fontWeight: FontWeight
                                                                    .bold)),
                                                        Text(viewModel
                                                            .listsertifikat[index]
                                                            .sertifikasiNomor.toString(),
                                                            style: const TextStyle(
                                                                fontSize: 16,
                                                                fontWeight: FontWeight
                                                                    .bold)),
                                                      ],
                                                    ),

                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      children: [
                                                        IconButton(icon: Icon(Icons.mode_edit),
                                                          onPressed: () async {
                                                            await viewModel.getsertifikatById(int.parse(
                                                            viewModel.listsertifikat[index].sertifikasiId.toString()), context);
                                                            showDialog(context: context, builder: (context) {
                                                           var nama = viewModel.datasertifikat.sertifikasiName.toString();
                                                           var nomor = viewModel.datasertifikat.sertifikasiNomor.toString();
                                                           var date = viewModel.datasertifikat.sertifikasiTanggalDari.toString();
                                                           var date2 = viewModel.datasertifikat.sertifikasiTanggalSampai.toString();
                                                           nomor_sertifikat.text = nomor;
                                                           _dateController.text = date;
                                                           _dateController2.text = date2;
                                                            return AlertDialog(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                                                                contentPadding: EdgeInsets.only(),
                                                                content: Container(
                                                                  padding: EdgeInsets.all(8),
                                                                    width: 500.0,
                                                                    child: Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                                                            child: Column(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                const Text(
                                                                                  "Edit Sertifikat Kepemilikan",
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
                                                                              crossAxisAlignment: CrossAxisAlignment
                                                                                  .start,
                                                                              children: <Widget>[
                                                                                SizedBox(
                                                                                  height: 1,
                                                                                ),
                                                                                Text("Sertifikat"),
                                                                                DropdownButton(
                                                                                  isExpanded: true,
                                                                                  hint: Text("Silakhan pilih sertifikat"),
                                                                                  value: selecteddropdownsertifikat??nama,
                                                                                  onChanged: (newValue) {
                                                                                    setState(() {
                                                                                      print(newValue.toString());
                                                                                      selecteddropdownsertifikat = newValue;
                                                                                    });
                                                                                  },
                                                                                  items: viewModel.listUser2.map((
                                                                                      listUser2) {
                                                                                    return DropdownMenuItem(
                                                                                      onTap: () {
                                                                                        sertifikat.text = listUser2.sertifikasiName.toString();
                                                                                        print(listUser2.sertifikasiName.toString());
                                                                                      },
                                                                                      value: listUser2.sertifikasiName.toString(),
                                                                                      child: Text(listUser2.sertifikasiName.toString()),
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
                                                                                Text("No Sertifikat"),

                                                                                TextFormField(
                                                                                    controller: nomor_sertifikat,
                                                                                    style: TextStyle(
                                                                                      fontSize: 15,
                                                                                    ),
                                                                                    textAlign: TextAlign
                                                                                        .start,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      hintText: "No Sertifikat",
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
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: <Widget>[
                                                                                Column(
                                                                                  children: <Widget>[
                                                                                    Text(
                                                                                      'Choose Start Date',
                                                                                      style: TextStyle(
                                                                                        fontStyle: FontStyle.italic,
                                                                                      ),
                                                                                    ),
                                                                                    InkWell(
                                                                                      onTap: () {
                                                                                        _selectDate(context);
                                                                                      },
                                                                                      child: Container(
                                                                                        width: width * 0.3,
                                                                                        height: height * 0.1,
                                                                                        margin: EdgeInsets.all(8),
                                                                                        alignment: Alignment.center,
                                                                                        decoration: BoxDecoration(color: Colors.white),
                                                                                        child: TextFormField(
                                                                                          style: TextStyle(fontSize: 16),
                                                                                          textAlign: TextAlign.center,
                                                                                          enabled: false,
                                                                                          keyboardType: TextInputType.text,
                                                                                          controller: _dateController,
                                                                                          //onSaved: (String date) {
                                                                                          //setDate = date;
                                                                                          //},
                                                                                          decoration: InputDecoration(
                                                                                              border: OutlineInputBorder(
                                                                                                borderRadius: BorderRadius
                                                                                                    .circular(
                                                                                                  10,
                                                                                                ),
                                                                                              ),
                                                                                              contentPadding: EdgeInsets.only(top: 0.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ),

                                                                                  ],
                                                                                ),
                                                                                Column(
                                                                                  children: <Widget>[
                                                                                    Text(
                                                                                      'Choose End Date',
                                                                                      style: TextStyle(
                                                                                        fontStyle: FontStyle.italic,
                                                                                      ),
                                                                                    ),
                                                                                    InkWell(
                                                                                      onTap: () {
                                                                                        _selectDate(context);
                                                                                      },
                                                                                      child: Container(
                                                                                        margin: EdgeInsets.all(12),
                                                                                        width: width * 0.3,
                                                                                        height: height * 0.1,
                                                                                        alignment: Alignment.center,
                                                                                        decoration: BoxDecoration(color: Colors.white),
                                                                                        child: TextFormField(
                                                                                          style: TextStyle(fontSize: 16),
                                                                                          textAlign: TextAlign.center,
                                                                                          // onSaved: (String time) {
                                                                                          //   setTime = time;
                                                                                          //   },
                                                                                          enabled: false,
                                                                                          keyboardType: TextInputType.text,
                                                                                          controller: _dateController2,
                                                                                          decoration: InputDecoration(
                                                                                              border: OutlineInputBorder(
                                                                                                borderRadius: BorderRadius
                                                                                                    .circular(
                                                                                                  10,
                                                                                                ),
                                                                                              ),
                                                                                              contentPadding: EdgeInsets.all(5)
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
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
                                                                                          'Foto Sertifikat',
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
                                                                                        viewModel.editsertifikat(int.parse(viewModel.datasertifikat.sertifikasiId.toString()), selecteddropdownsertifikat.toString(), nomor_sertifikat.text.toString(),_dateController.toString(),_dateController2.toString(), "foto", context);
                                                                                        Navigator.pop(context);
                                                                                        selecteddropdownsertifikat.clear();
                                                                                        nomor_sertifikat.clear();
                                                                                        _dateController.clear();
                                                                                        _dateController2.clear();
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
                                                                                      onTap: () {
                                                                                        Navigator.pop(context);
                                                                                        selecteddropdownsertifikat.clear();
                                                                                        nomor_sertifikat.clear();
                                                                                        _dateController.clear();
                                                                                        _dateController2.clear();
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
                                                            }
                                                           );
                                                            }
                                                           ),

                                                        IconButton(onPressed: ()=> viewModel.deletesertifikat(
                                                            int.parse(viewModel.listsertifikat[index].sertifikasiId.toString()), context)

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
                                            Navigator.pop(context);

                                            widget.parentViewModel.addKebunModel.listSertifikasi = viewModel.listkebunsertifikasi;

                                            widget.parentViewModel.addKebun(context);
                                            print(
                                                jsonEncode(
                                                    widget.parentViewModel.addKebunModel.listSertifikasi)
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
