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
    return ChangeNotifierProvider<profilemod>(
        create: (context) => profilemod(context),
        child: Builder(
        builder: (context) {
          return Consumer<profilemod>(
              builder: (context, viewModel, child) {
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
                                Text(viewModel.listprofile.nama.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                  ),),
                                const SizedBox(height: 16,),
                                Text(viewModel.listprofile.mobile.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                  ),),
                                const SizedBox(height: 16,),
                              ],
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
