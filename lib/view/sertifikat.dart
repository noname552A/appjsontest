import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taniku/viewmodel/dokumenmod.dart';


class dokumenscreen extends StatefulWidget {
  const dokumenscreen({Key? key}) : super(key: key);

  @override
  State<dokumenscreen> createState() => _dokumenscreenState();
}

class _dokumenscreenState extends State<dokumenscreen> {
  var textAlamat = new TextEditingController();
  var textRT = new TextEditingController();
  var textRW = new TextEditingController();
  var kodepos = new TextEditingController();

  var selecteddropdownprovinsi;
  var selecteddropdownkota;
  var selecteddropdowncamat;
  var selecteddropdowndesa;


  List<String> dropdownList = ["Senin","Selasa","Rabu","Kamis","Jumat","Sabtu","Minggu"];

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
    return ChangeNotifierProvider<dokumenmod>(
        create: (context) => dokumenmod(context),
        child: Builder(
          builder: (context)
          {
            return Consumer<dokumenmod>(
                builder: (context, viewModel, child) {
                  return Scaffold(
                      extendBodyBehindAppBar: false,
                      backgroundColor: Colors.blue,
                      body: SingleChildScrollView(
                        child: Container(
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
                                                                "Tambah Dokumen Kepemilikan",
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
                                                              Text("Dokumen"),
                                                              DropdownButton(
                                                                isExpanded: true,
                                                                hint: Text("Silakhan pilih Dokumen"),
                                                                value: selecteddropdownprovinsi,
                                                                onChanged: (newValue) {
                                                                  setState(() {
                                                                    print(newValue.toString());
                                                                    selecteddropdownprovinsi = newValue;
                                                                  });
                                                                },
                                                                items: dropdownList.map((
                                                                    String value) {
                                                                  return DropdownMenuItem(
                                                                    value: value,
                                                                    child: Text(value),
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
                                                                  controller: textAlamat,
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
                                            .listdokumen[index].dokumenId
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
                                                                  .listdokumen[index]
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
                                                            .nomor.toString(),
                                                            style: const TextStyle(
                                                                fontSize: 16,
                                                                fontWeight: FontWeight
                                                                    .bold)),
                                                      ],
                                                    ),
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
                                          onTap: () {},
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
