import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taniku/model/add.dart';
import 'package:taniku/view/allscreen.dart';
import 'package:taniku/view/botnav.dart';
import 'package:taniku/view/pabrikscreen.dart';
import 'package:taniku/viewmodel/addmod.dart';

class addscreen extends StatefulWidget {
  final id;
  final nama;
  const addscreen({Key? key, required this.id, required this.nama}) : super(key: key);


  @override
  State<addscreen> createState() => _addscreenState();
}

class _addscreenState extends State<addscreen> {
  var textController = new TextEditingController();
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
  void initState() {
    _dateController.text = DateFormat.yMd().format(DateTime.now());

    _timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    dateTime = DateFormat.yMd().format(DateTime.now());
    return ChangeNotifierProvider<addmod>(
        create: (context) => addmod(context),
        child: Builder(
        builder: (context)
        {
          return Consumer<addmod>(
              builder: (context, viewModel, child) {
                return Scaffold(
                    appBar: AppBar(
                      backgroundColor: Color(0x44000000),
                      elevation: 0,
                      title: Text("Daftar PKS"),
                      // leading: IconButton(
                      //   onPressed: (){
                      //     Navigator.pop(context, MaterialPageRoute(builder: (context) => navdrawmain()));
                      //   },
                      //   icon: Icon(Icons.account_circle_sharp),
                      // ),
                    ),
                  resizeToAvoidBottomInset: true,
                  extendBodyBehindAppBar: false,
                  backgroundColor: Colors.white,
                   body: Form(
                       child: SingleChildScrollView(
                           child: Stack(
                               children: <Widget>[
                                 Container(
                                   padding: EdgeInsets.all(8),
                                   child: SingleChildScrollView(
                                     child: Column(
                                       children: [
                                           Container(
                                             margin: EdgeInsets.symmetric(
                                               vertical: 5,
                                             ),
                                              child: Column(
                                                 crossAxisAlignment: CrossAxisAlignment
                                                     .start,
                                                 children: <Widget>[
                                                   SizedBox(
                                                     height: 1,
                                                   ),
                                                   Text("Nama PKS"),
                                                   TextFormField(
                                                     readOnly: true,
                                                     initialValue: widget.nama.toString(),
                                                   ),
                                                 ]
                                             ),
                                     ),

                                                Row(
                                                   crossAxisAlignment: CrossAxisAlignment.center,
                                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                   children: <Widget>[
                                                     Column(
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
                                                   ]
                                               ),

                                         Column(
                                             crossAxisAlignment: CrossAxisAlignment
                                                 .start,
                                             children: <Widget>[
                                               SizedBox(
                                                 height: 1,
                                               ),
                                               Text("Tonasi"),
                                               TextFormField(
                                                   controller: textController,
                                                   style: TextStyle(
                                                     fontSize: 15,
                                                   ),
                                                   textAlign: TextAlign
                                                       .start,
                                                   obscureText: false,
                                                   decoration: InputDecoration(
                                                     hintText: "Tonasi",
                                                     border: OutlineInputBorder(
                                                       borderRadius: BorderRadius
                                                           .circular(
                                                         10,
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
                                             Column(
                                                 crossAxisAlignment: CrossAxisAlignment.center,
                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                 children: [
                                                   InkWell(
                                                     onTap: () {
                                                       String tgl = date.toString() + " " + _timeController.text.toString();
                                                       viewModel.getadd(tgl,textController.text.toString() ,widget.id.toString() );
                                                       print("ID => " +
                                                           widget.id
                                                               .toString());
                                                       print(
                                                           "Date => " +
                                                               date
                                                                   .toString());
                                                       print(
                                                           "Time => " +
                                                               _timeController.text
                                                                   .toString());
                                                       print(
                                                           "Tonasi => " +
                                                               textController.text
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
                                               height: 20,
                                             ),
                                             Column(
                                                 crossAxisAlignment: CrossAxisAlignment.center,
                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                 children: [
                                                   InkWell(
                                                     onTap: () {
                                                       Navigator.push(
                                                         context,
                                                         MaterialPageRoute(
                                                           builder: (context) => const botnav(),
                                                         ),
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
