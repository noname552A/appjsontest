import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taniku/model/add.dart';
import 'package:taniku/viewmodel/addmod.dart';

class addscreen extends StatefulWidget {
  final id;
  final nama;
  const addscreen({Key? key, required this.id, required this.nama}) : super(key: key);


  @override
  State<addscreen> createState() => _addscreenState();
}

class _addscreenState extends State<addscreen> {
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
        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
        _timeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
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
        create: (context) => addmod(context, widget.id.toString(), widget.nama.toString()),
        child: Builder(
        builder: (context)
        {
          return Consumer<addmod>(
              builder: (context, viewModel, child) {
                return Scaffold(
                  resizeToAvoidBottomInset: true,
                  extendBodyBehindAppBar: false,
                  backgroundColor: Colors.white,
                   body: Form(
                       child: SingleChildScrollView(
                           child: Stack(
                               children: <Widget>[
                                 Container(
                                   padding: EdgeInsets.symmetric(horizontal: 20),
                                   child: SingleChildScrollView(
                                     child: Column(
                                       children: [
                                           Container(
                                             width: width,
                                             height: height,
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

                                                Column(
                                                   crossAxisAlignment: CrossAxisAlignment.center,
                                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                   children: <Widget>[
                                                     Row(
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
                                                               width: width / 1,
                                                               height: height / 1,
                                                               margin: EdgeInsets.all(8 ),
                                                               alignment: Alignment.center,
                                                               decoration: BoxDecoration(color: Colors.black),
                                                               child: TextFormField(
                                                                 style: TextStyle(fontSize: 16),
                                                                 textAlign: TextAlign.center,
                                                                 enabled: false,
                                                                 keyboardType: TextInputType.text,
                                                                 controller: _dateController,
                                                                 onSaved: (String date) {
                                                                   setDate = date;
                                                                   },
                                                                 decoration: InputDecoration(
                                                                     disabledBorder:
                                                                     UnderlineInputBorder(borderSide: BorderSide.none),

                                                                     contentPadding: EdgeInsets.only(top: 0.0)),
                                                               ),
                                                             ),
                                                           ),

                                                       ],
                                                     ),
                                                     Row(
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
                                                             width: width / 1,
                                                             height: height / 1,
                                                             alignment: Alignment.center,
                                                             decoration: BoxDecoration(color: Colors.black),
                                                             child: TextFormField(
                                                               style: TextStyle(fontSize: 16),
                                                               textAlign: TextAlign.center,
                                                               onSaved: (String time) {
                                                                 setTime = time;
                                                                 },
                                                               enabled: false,
                                                               keyboardType: TextInputType.text,
                                                               controller: _timeController,
                                                               decoration: InputDecoration(
                                                                   disabledBorder:
                                                                   UnderlineInputBorder(borderSide: BorderSide.none),
                                                                   contentPadding: EdgeInsets.all(5)
                                                               ),
                                                             ),
                                                           ),
                                                         ),
                                                       ],
                                                     ),
                                                   ]
                                               )




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
