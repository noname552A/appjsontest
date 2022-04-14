import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:qr/qr.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:taniku/viewmodel/allmod.dart';

class allscreen extends StatefulWidget {
  const allscreen({Key? key}) : super(key: key);

  @override
  State<allscreen> createState() => _allscreenState();
}

class _allscreenState extends State<allscreen> {
  late String date;
  late double height;
  late double width;
  late String setTime;
  late String setDate;
  late String _hour, _minute, _time;
  late String dateTime;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

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

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ':' + _minute + ':' + '00';
        _timeController.text = _time;
        // _timeController.text = formatDate(
        //     DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
        //     [hh, ':', nn, " ", am]).toString();
      });
  }



  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    dateTime = DateFormat.yMd().format(DateTime.now());
    return ChangeNotifierProvider<allmod>(
        create: (context) => allmod(context),
        child: Builder(
            builder: (context) {
              return Consumer<allmod>(
                  builder: (context, viewModel, child) {
                    return Scaffold(
                        extendBodyBehindAppBar: false,
                        backgroundColor: Colors.blue,
                        appBar: AppBar(
                          backgroundColor: Color(0x44000000),
                          elevation: 0,
                          title: Text("Daftar Reservasi Pengiriman PKS"),
                          // leading: IconButton(
                          //   onPressed: (){
                          //     Navigator.pop(context, MaterialPageRoute(builder: (context) => navdrawmain()));
                          //   },
                          //   icon: Icon(Icons.account_circle_sharp),
                          // ),
                        ),
                        body: Container(
                          child: SingleChildScrollView(
                              child: Container(
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        //Listview Horizontal
                                        const SizedBox(height: 16,),
                                        const Text("Data", style: TextStyle(fontWeight: FontWeight.bold),),
                                        const SizedBox(height: 16,),
                                        ListView.builder(
                                              physics: ClampingScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: viewModel.listall.length,
                                              itemBuilder: (context, index) {
                                                var status = int.parse(viewModel.listall[index].status.toString());
                                                return InkWell(
                                                  onTap: () {
                                                    print("data : ${viewModel.listall[index]}"
                                                    );
                                                  },
                                                  child: Container(
                                                      width: 150,
                                                      alignment: Alignment.center,
                                                      child: Card(
                                                        elevation: 15,
                                                        child: Container(
                                                          width: double.infinity,
                                                          margin: const EdgeInsets.all(8),
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Container(
                                                                    padding: EdgeInsets.all(12),
                                                                    child: const Icon(
                                                                      Icons.maps_home_work_rounded,
                                                                      size: 50,
                                                                    ),
                                                                    // Image.asset("assets/flutter.png")
                                                                  )
                                                                ],
                                                        ),

                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                              Text(viewModel.listall[index].tanggalPengiriman.toString(), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                                              Text(viewModel.listall[index].statusName.toString(), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                                      ]
                                                      ),

                                                              const SizedBox(height: 16,),

                                                              Column(
                                                                children:[
                                                                  Text(viewModel.listall[index].noReservasi.toString(), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                                                ]
                                                              ),
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: [
                                                                  Expanded(
                                                                    child: Column(
                                                                        children: [
                                                                          InkWell(
                                                                            onTap: () {
                                                                              print("Indocyber");
                                                                            },

                                                                            child: Text(
                                                                              viewModel.listall[index].namaPabrik.toString(),
                                                                              style: TextStyle(
                                                                                fontSize: 16,
                                                                              ),
                                                                            ),
                                                                          )
                                                                        ]
                                                                    ),
                                                                  ),
                                                                  const SizedBox(height: 16),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(viewModel.listall[index].tonasi.toString()+" kg", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Visibility(
                                                                      visible: status == 1 ? true : false,
                                                                      replacement: SizedBox(
                                                                        width: 100,
                                                                      ),
                                                                      child: IconButton( onPressed:(){
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
                                                                                            "QR",
                                                                                            style: TextStyle(color: Colors.white, fontSize: 18),
                                                                                            textAlign: TextAlign.center,
                                                                                          ),
                                                                                          IconButton(
                                                                                              onPressed: () => Navigator.pop(context),
                                                                                              icon: const Icon(
                                                                                                Icons.close,
                                                                                                size: 36,
                                                                                                color: Colors.white,
                                                                                              ))
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    const SizedBox(
                                                                                      height: 5.0,
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsets.all(30),
                                                                                      child: Center(
                                                                                          child: Column(
                                                                                            children: [
                                                                                              QrImage(
                                                                                                data: viewModel.listall[index].noReservasi.toString(),
                                                                                                size: 200.0,
                                                                                              ),
                                                                                              Text(
                                                                                                viewModel.listall[index].noReservasi.toString(),
                                                                                              ),
                                                                                              Container(
                                                                                                height: 50,
                                                                                                decoration: const BoxDecoration(
                                                                                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                                                                                    color: Colors.orange),
                                                                                                child: Center(
                                                                                                    child: InkWell(
                                                                                                      child: Text(
                                                                                                        "Return",
                                                                                                        style: TextStyle(
                                                                                                            fontSize: 20,
                                                                                                            color: Colors.white,
                                                                                                            fontWeight: FontWeight.bold),
                                                                                                      ),
                                                                                                      onTap: () => Navigator.pop(context),
                                                                                                    )),
                                                                                              ),
                                                                                            ],
                                                                                          )),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              )),
                                                                        );
                                                                      },
                                                                        icon: Icon(
                                                                        Icons.calendar_view_week,
                                                                        size: 50,
                                                                        color: Colors.blueAccent[700],
                                                                      ))),

                                                                  Visibility(
                                                                      visible: status == 1 ? true : false,
                                                                      replacement: SizedBox(
                                                                        width: 100,
                                                                      ),
                                                                      child: ElevatedButton(
                                                                          onPressed: () {showDialog(context: context, builder: (context) =>
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
                                                                                            "Edit Pengiriman",
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
                                                                                          Text(
                                                                                            'Choose Date',
                                                                                            style: TextStyle(
                                                                                              fontStyle: FontStyle.italic,
                                                                                            ),
                                                                                          ),
                                                                                          InkWell(
                                                                                            onTap: () {
                                                                                              _selectDate(context);
                                                                                            },
                                                                                            child: Container(
                                                                                              width: width * 0.4,
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
                                                                                            'Choose Time',
                                                                                            style: TextStyle(
                                                                                              fontStyle: FontStyle.italic,
                                                                                            ),
                                                                                          ),
                                                                                          InkWell(
                                                                                            onTap: () {
                                                                                              _selectTime(context);
                                                                                              },
                                                                                            child: Container(
                                                                                              margin: EdgeInsets.all(12),
                                                                                              width: width * 0.4,
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
                                                                                          controller: _timeController,
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



                                                                                     Row(
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Column(
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            InkWell(
                                                                                              onTap: () {
                                                                                                String tanggal = date.toString() + " " + _timeController.text.toString();
                                                                                                viewModel.getedit(viewModel.listall[index].noReservasi.toString(), tanggal, context);
                                                                                                print(
                                                                                                    "Date => " +
                                                                                                        date
                                                                                                            .toString());
                                                                                                print(
                                                                                                    "Time => " +
                                                                                                        _timeController.text
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
                                                                                        ),

                                                                                    Expanded(
                                                                                      child: Column(
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
                                                                                    ),
                                                                                  ],
                                                                                ),

                                                                              ]
                                                                            ))
                                                                          ),
                                                                          );
                                                                          },
                                                                          style: ElevatedButton.styleFrom(
                                                                            primary: Colors.red[700],
                                                                            shape:
                                                                            new RoundedRectangleBorder(
                                                                              borderRadius:
                                                                              new BorderRadius.circular(
                                                                                  30.0),
                                                                            ),
                                                                          ),
                                                                          child: Text('Jadwal Ulang'))),

                                                                  Visibility(
                                                                      visible: status == 2 ? true : false,
                                                                      replacement: SizedBox(
                                                                        width: 100,
                                                                      ),
                                                                      child: ElevatedButton(
                                                                          onPressed: () {},
                                                                          style: ElevatedButton.styleFrom(
                                                                            primary: Colors.blueAccent[700],
                                                                            shape:
                                                                            new RoundedRectangleBorder(
                                                                              borderRadius:
                                                                              new BorderRadius.circular(
                                                                                  30.0),
                                                                            ),
                                                                          ),
                                                                          child: Text('Faktur'))),
                                                                ],
                                                              ),


                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                  ),
                                                );
                                              },
                                            )

                                      ]
                                  )
                              )
                          ),
                        )

                    );
                  }
              );
            }
        )
    );
  }
}
