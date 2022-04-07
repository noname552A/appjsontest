import 'package:taniku/loginscreen/LoginUI2.dart';
import 'package:taniku/loginscreen/LoginUI.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:taniku/viewmodel/loginview.dart';
import 'package:provider/provider.dart';


class signin extends StatefulWidget {
  const signin({Key? key}) : super(key: key);

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  final _formkey = GlobalKey<FormState>();
  var textController = new TextEditingController();
  var text2Controller = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<loginmod>(
      create: (context) => loginmod(context),
      child: Builder(
        builder: (context) {
          return Consumer<loginmod>(
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
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //         image: AssetImage("assets/background3.png"), fit: BoxFit.cover
              //    )
              //  ),

                          child: Stack(
                              children: <Widget>[
                                Container(
                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                    child: SingleChildScrollView(
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .stretch,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              SizedBox(height: 40),
                                              Image.asset("assets/logo3.png", width: 80,
                                                height: 80,),
                                              SizedBox(
                                                height: 40,
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                  vertical: 10,
                                                ),
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment
                                                        .start,
                                                    children: <Widget>[
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      TextFormField(
                                                          controller: textController,
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                          ),
                                                          textAlign: TextAlign.start,
                                                          obscureText: false,
                                                          decoration: InputDecoration(
                                                            hintText: "email",
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
                                                              return "ID/Email tidak boleh kosong";
                                                            }
                                                            return null;
                                                          }
                                                          ),
                                                    ]
                                                ),
                                              ),

                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                  vertical: 10,
                                                ),
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment
                                                        .start,
                                                    children: <Widget>[
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      TextFormField(
                                                          controller: text2Controller,
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                          ),
                                                          textAlign: TextAlign.start,
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
                                                          String username = textController.text.toString();
                                                          String password = text2Controller.text.toString();
                                                          if (_formkey.currentState!
                                                              .validate()) {
                                                            viewModel.login(username, password, context);
                                                            print("email value => " +
                                                                textController.text);
                                                            print("password value => " +
                                                                text2Controller.text);
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
                                                                            Navigator.pop(
                                                                                context);
                                                                            },
                                                                        ),
                                                                      ],
                                                                    )
                                                            );
                                                          };
                                                          print("email => ${textController
                                                              .text}");
                                                          print(
                                                              "password => ${text2Controller
                                                                  .text}");
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
                                                          borderRadius: BorderRadius.all(
                                                            Radius.circular(5),
                                                          ),
                                                          color: Colors.blue,
                                                        ),
                                                        child: const Text(
                                                          'Sign In',
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ]
                                              ),

                                              Row(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .center,
                                                  children: [
                                                    SizedBox(height: 30,),
                                                    InkWell(
                                                      onTap: () {
                                                        print("Forgot Password Menu");
                                                        },
                                                      child: const Text(
                                                        'Forgot Password?',
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.blue,
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
                                                        print("Sign in Facebook");
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
                                                          borderRadius: BorderRadius.all(
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
                                                                'Sign in with Facebook',
                                                                style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors.white,
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
                                                        print("Sign in Google");
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
                                                          borderRadius: BorderRadius.all(
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
                                                                'Sign in with Google',
                                                                style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors.black,
                                                                ),
                                                              ),
                                                            ]
                                                        ),
                                                      ),
                                                    ),
                                                  ]
                                              ),

                                              const SizedBox(height: 20,),

                                              Row(
                                                  children: [
                                                    Text("Don't Have an Account? "),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (
                                                                context) => const singup(),
                                                          ),
                                                        );
                                                        },
                                                      child: const Text(
                                                        'Sign Up',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                    ),
                                                  ]
                                              ),


                                              const SizedBox(height: 35,),


                                            ]
                                        )
                                    )
                                )


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
