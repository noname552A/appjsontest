import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:taniku/viewmodel/allmod.dart';

class allscreen extends StatefulWidget {
  const allscreen({Key? key}) : super(key: key);

  @override
  State<allscreen> createState() => _allscreenState();
}

class _allscreenState extends State<allscreen> {
  @override
  Widget build(BuildContext context) {
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
                        body: SingleChildScrollView(
                            child: Container(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      //Listview Horizontal
                                      const SizedBox(height: 16,),
                                      const Text("Data", style: TextStyle(fontWeight: FontWeight.bold),),
                                      const SizedBox(height: 16,),
                                      SizedBox(
                                          child: ListView.builder(
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
                                                                                            color: Colors.green,
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
                                                                                ),
                                                                      )
                                                                      );
                                                                    },
                                                                      icon: Icon(
                                                                      Icons.calendar_view_week,
                                                                      size: 50,
                                                                      color: Colors.orange[700],
                                                                    ))),

                                                                Visibility(
                                                                    visible: status == 1 ? true : false,
                                                                    replacement: SizedBox(
                                                                      width: 100,
                                                                    ),
                                                                    child: ElevatedButton(
                                                                        onPressed: () {},
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
                                      ),

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
