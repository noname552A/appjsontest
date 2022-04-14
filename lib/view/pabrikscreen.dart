import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taniku/view/addscreen.dart';
import 'package:taniku/viewmodel/pabrikmod.dart';

class pabrikscreen extends StatefulWidget {
  const pabrikscreen({Key? key}) : super(key: key);

  @override
  State<pabrikscreen> createState() => _pabrikscreenState();
}

class _pabrikscreenState extends State<pabrikscreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<pabrikmod>(
        create: (context) => pabrikmod(context),
        child: Builder(
        builder: (context)
        {
      return Consumer<pabrikmod>(
          builder: (context, viewModel, child) {
            return Scaffold(
              extendBodyBehindAppBar: false,
              backgroundColor: Colors.blue,
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
                body: SingleChildScrollView(
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
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          print("data : ${viewModel.listpabrik[index].longitude}"
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
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.all(16),
                                                      child: Icon(
                                                        Icons.maps_home_work_rounded,
                                                        size: 50,
                                                      ),
                                                    ),
                                                    Text("Kuota " + viewModel.listpabrik[index].kuota.toString() +"kg", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                                    Text("Rp " + viewModel.listpabrik[index].harga.toString() +",00", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                                    Text("Kuota terisi " +viewModel.listpabrik[index].koutaTerisi.toString()+ "/" +viewModel.listpabrik[index].kuota.toString(),
                                                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

                                                    const SizedBox(height: 16,),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Column(
                                                              children: [
                                                                InkWell(
                                                                    onTap: () {
                                                                      print("Indocyber");
                                                                    },
                                                                  child: const Text(
                                                                    'Indocyber',
                                                                    style: TextStyle(
                                                                      fontSize: 16,
                                                                      color: Colors.black,
                                                                    ),
                                                                  ),
                                                                )
                                                                ]
                                                          ),
                                                        ),
                                                        const SizedBox(height: 16),
                                                        Expanded(
                                                          child: Column(
                                                              children: [
                                                                InkWell(
                                                                  onTap: () {
                                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => addscreen(
                                                                        id: viewModel.listpabrik[index].id,
                                                                        nama: viewModel.listpabrik[index].namaPabrik,

                                                                    )));
                                                                    print("kirim TBS");
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
                                                                      'Kirim TBS',
                                                                      style: TextStyle(
                                                                        fontSize: 16,
                                                                        color: Colors.white,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                const SizedBox(height: 8,),
                                                              ]
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                        ),
                                      );
                                      },
                                      itemCount: viewModel.listpabrik.length
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
