import 'package:provider/provider.dart';
import 'package:taniku/loginscreen/LoginUI.dart';
import 'package:taniku/loginscreen/LoginUI3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taniku/viewmodel/regview.dart';

class singup extends StatefulWidget {
  const singup({Key? key}) : super(key: key);

  @override
  State<singup> createState() => _singupState();
}

class _singupState extends State<singup> {
  final _formkey = GlobalKey<FormState>();
  var textController = new TextEditingController();
  var text2Controller = new TextEditingController();
  var text3Controller = new TextEditingController();
  var text4Controller = new TextEditingController();
  bool checkedValue = false;
  String _selectedGender ="male";
  List<String> dropdownList = ["Senin","Selasa","Rabu","Kamis","Jumat","Sabtu","Minggu"];
  var selectedDropDown;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<regmod>(
      create: (context) => regmod(context),
      child: Builder(
        builder: (context) {
          return Consumer<regmod>(
            builder: (context, viewModel, child) {
              return Scaffold(
                  resizeToAvoidBottomInset: true,
                  extendBodyBehindAppBar: false,
                  backgroundColor: Colors.white,
                  body: Form(
                      key: _formkey,
                      child: SingleChildScrollView(
                        // child: Container(
                        //   margin: EdgeInsets.all(0),
                        //   decoration: BoxDecoration(
                        //       image: DecorationImage(
                        //           image: AssetImage("assets/background.png"), fit: BoxFit.cover
                        //       )
                        //   ),

                          child: Stack(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: SingleChildScrollView(
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .stretch,
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: <Widget>[
                                          SizedBox(height: 40),
                                          Image.asset(
                                            "assets/logo3.png", width: 80,
                                            height: 80,),

                                          SizedBox(
                                            height: 20,
                                          ),

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
                                                  TextFormField(
                                                      controller: textController,
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                      ),
                                                      textAlign: TextAlign
                                                          .start,
                                                      obscureText: false,
                                                      decoration: InputDecoration(
                                                        hintText: "Name",
                                                        suffixIcon: Icon(
                                                          Icons.person,
                                                          color: Colors.black,
                                                        ),
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
                                                          return "Nama tidak boleh kosong";
                                                        }
                                                        return null;
                                                      }
                                                  ),
                                                ]
                                            ),
                                          ),

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
                                                  TextFormField(
                                                      controller: text2Controller,
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                      ),
                                                      textAlign: TextAlign
                                                          .start,
                                                      obscureText: false,
                                                      decoration: InputDecoration(
                                                        hintText: "phone",
                                                        suffixIcon: Icon(
                                                          Icons.email,
                                                          color: Colors.black,
                                                        ),
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
                                                          return "phone tidak boleh kosong";
                                                        }
                                                        return null;
                                                      }
                                                  ),
                                                ]
                                            ),
                                          ),

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
                                                  TextFormField(
                                                      controller: text3Controller,
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                      ),
                                                      textAlign: TextAlign
                                                          .start,
                                                      obscureText: false,
                                                      decoration: InputDecoration(
                                                        hintText: "Password",
                                                        suffixIcon: Icon(
                                                          Icons.visibility,
                                                          color: Colors.black,
                                                        ),
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
                                                          return "password tidak boleh kosong";
                                                        }
                                                        return null;
                                                      }
                                                  ),
                                                ]
                                            ),
                                          ),

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
                                                  TextFormField(
                                                      controller: text4Controller,
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                      ),
                                                      textAlign: TextAlign
                                                          .start,
                                                      obscureText: false,
                                                      decoration: InputDecoration(
                                                        hintText: "Confirm_Password",
                                                        suffixIcon: Icon(
                                                          Icons.visibility,
                                                          color: Colors.black,
                                                        ),
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
                                                          return "password tidak boleh kosong";
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

                                          Text("Jenis Kelamin "),

                                          ListTile(
                                            leading: Radio<String>(
                                              value: "male",
                                              groupValue: _selectedGender,
                                              onChanged: (value) {
                                                setState(() {
                                                  _selectedGender = value!;
                                                });
                                              },
                                            ),
                                            title: const Text("Male"),
                                          ),

                                          ListTile(
                                            leading: Radio<String>(
                                              value: "female",
                                              groupValue: _selectedGender,
                                              onChanged: (value) {
                                                setState(() {
                                                  _selectedGender = value!;
                                                });
                                              },
                                            ),
                                            title: const Text("Female"),
                                          ),

                                          const SizedBox(
                                            height: 20,
                                          ),

                                          Text("Hari Favorite anda"),

                                          DropdownButton(
                                            isExpanded: true,
                                            hint: Text("Silakhan pilih hari"),
                                            value: selectedDropDown,
                                            onChanged: (newValue) {
                                              setState(() {
                                                print(newValue.toString());
                                                selectedDropDown = newValue;
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

                                          const SizedBox(
                                            height: 20,
                                          ),

                                          CheckboxListTile(
                                            title: Text("Setuju"),
                                            value: checkedValue,
                                            onChanged: (newValue) {
                                              setState(() {
                                                checkedValue = newValue!;
                                              });
                                            },
                                            controlAffinity: ListTileControlAffinity
                                                .leading,
                                          ),

                                          const SizedBox(
                                            height: 20,
                                          ),

                                          Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .center,
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    setState:
                                                    {
                                                      String type_user = "PTN";
                                                      String name = textController.text.toString();
                                                      String phone = text2Controller.text.toString();
                                                      String password = text3Controller.text.toString();
                                                      String confirmpassword = text4Controller.text.toString();
                                                      if (_formkey.currentState!
                                                          .validate()) {
                                                        viewModel.register(type_user, name, phone, password, confirmpassword, context);
                                                        print("name value => " +
                                                            textController
                                                                .text);
                                                        print(
                                                            "email value => " +
                                                                text2Controller
                                                                    .text);
                                                        print(
                                                            "password value => " +
                                                                text3Controller
                                                                    .text);
                                                        print(
                                                            "confirm_password value => " +
                                                                text4Controller
                                                                    .text);
                                                        print(
                                                            "checkbox value => " +
                                                                checkedValue
                                                                    .toString());
                                                        print(
                                                            "radio value => " +
                                                                _selectedGender
                                                                    .toString());
                                                        print(
                                                            "dropdown value +> " +
                                                                selectedDropDown
                                                                    .toString());
                                                      }
                                                      else {
                                                        print("Lengkapi data");
                                                        showDialog(
                                                            context: context,
                                                            builder: (_) =>
                                                                AlertDialog(
                                                                  title: Text(
                                                                      'Informasi'),
                                                                  content: Text(
                                                                      'Silahkan Lengkapi Data Anda'),
                                                                  actions: [
                                                                    TextButton(
                                                                      child: Text(
                                                                          "OK"),
                                                                      onPressed: () {
                                                                        Navigator
                                                                            .pop(
                                                                            context);
                                                                      },
                                                                    ),
                                                                  ],
                                                                )
                                                        );
                                                      };
                                                      print(
                                                          "nama => ${textController
                                                              .text}");
                                                      print(
                                                          "email => ${text2Controller
                                                              .text}");
                                                      print(
                                                          "password => ${text3Controller
                                                              .text}");
                                                      print(
                                                          "persetujuan => ${checkedValue}");
                                                      print(
                                                          "gender => ${_selectedGender}");
                                                      print(
                                                          "hari => ${selectedDropDown}");
                                                    };
                                                  },

                                                  child: Container(
                                                    width: MediaQuery
                                                        .of(context)
                                                        .size
                                                        .width,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      vertical: 10,
                                                    ),
                                                    alignment: Alignment.center,
                                                    decoration: const BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .all(
                                                        Radius.circular(5),
                                                      ),
                                                      color: Colors.blue,
                                                    ),
                                                    child: const Text(
                                                      'Sign Up',
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ]
                                          ),

                                          const SizedBox(height: 20,),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceAround,
                                            children: [
                                              Text(
                                                  'or'
                                              )
                                            ],
                                          ),

                                          const SizedBox(height: 8,),

                                          Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .center,
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    print("Sign Up Facebook");
                                                  },
                                                  child: Container(
                                                    width: MediaQuery
                                                        .of(context)
                                                        .size
                                                        .width,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      vertical: 0,
                                                    ),
                                                    alignment: Alignment.center,
                                                    decoration: const BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .all(
                                                        Radius.circular(10),
                                                      ),
                                                      color: Colors.blueAccent,
                                                    ),
                                                    child:
                                                    Row(
                                                        children: [
                                                          Image.asset(
                                                              "assets/facebook.png",
                                                              width: 35,
                                                              height: 35,
                                                              alignment: Alignment
                                                                  .centerLeft),
                                                          const Text(
                                                            'Sign Up with Facebook',
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              color: Colors
                                                                  .white,
                                                            ),
                                                          ),
                                                        ]
                                                    ),
                                                  ),
                                                ),
                                              ]
                                          ),

                                          const SizedBox(height: 10,),

                                          Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .center,
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    print("Sign Up Google");
                                                  },
                                                  child: Container(
                                                    width: MediaQuery
                                                        .of(context)
                                                        .size
                                                        .width,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      vertical: 0,
                                                    ),
                                                    alignment: Alignment.center,
                                                    decoration: const BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .all(
                                                        Radius.circular(10),
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                    child:
                                                    Row(
                                                        children: [
                                                          Image.asset(
                                                              "assets/google.png",
                                                              width: 35,
                                                              height: 35,
                                                              alignment: Alignment
                                                                  .centerLeft),
                                                          const Text(
                                                            'Sign Up with Google',
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              color: Colors
                                                                  .black,
                                                            ),
                                                          ),
                                                        ]
                                                    ),
                                                  ),
                                                ),
                                              ]
                                          ),

                                          const SizedBox(height: 10,),

                                          Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: [
                                                Text(
                                                    'By Signing up you accept the '
                                                ),
                                                Text('Terms Of Service ',
                                                  style: TextStyle(
                                                      color: Colors.blue
                                                          .shade900),),
                                              ]
                                          ),

                                          Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: [
                                                Text('and '),
                                                Text('Privacy Policy ',
                                                  style: TextStyle(
                                                      color: Colors.blue
                                                          .shade900),),
                                              ]
                                          ),

                                          const SizedBox(height: 15,),

                                          Row(
                                              children: [
                                                Text('Already Have Account? '),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (
                                                            context) => const signin(),
                                                      ),
                                                    );
                                                  },
                                                  child: const Text(
                                                    'Sign In',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ),
                                              ]
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          )
                                        ]
                                    ),

                                  ),

                                ),
                              ]
                          )
                      )
                  )
                //)
              );
            }
              );
            }
    )
    );
  }
}
