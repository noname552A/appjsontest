import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:taniku/viewmodel/profilemod.dart';

class profilemenu extends StatefulWidget {
  const profilemenu({Key? key}) : super(key: key);

  @override
  State<profilemenu> createState() => _profilemenuState();
}

class _profilemenuState extends State<profilemenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Color(0x44000000),
        elevation: 0,
        title: Text("Profile"),
      ),

      body: SingleChildScrollView(
          child: Container(
              margin: const EdgeInsets.all(0),
            child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/ghost.png", width: 80, height: 80,),
                    const SizedBox(height: 36,),
                    const Text(listprofile,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),),
                    const SizedBox(height: 16,),
                    const Text("silakhan Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),),
                    const SizedBox(height: 16,),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        hintText: "contoh : indocyber@gmail.com",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.amber, width: 3.0),
                        ),
                      ),
                    ),
                    const SizedBox( height: 16,),
                    TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        labelText: "password",
                        hintText: "contoh : 123456",
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.amber, width: 3.0)
                        ),
                      ),
                    ),
                  ],
     ]
    )
      ),
      )
    );
  }
}
