import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:taniku/view/detailed.dart';
import 'package:taniku/view/lokasiscreen.dart';
import 'package:taniku/view/tabnav.dart';
import 'package:taniku/viewmodel/profilemod.dart';

class profilemenu extends StatefulWidget {
  const profilemenu({Key? key}) : super(key: key);

  @override
  State<profilemenu> createState() => _profilemenuState();
}

class _profilemenuState extends State<profilemenu> {
  final List<String> menu = [
    'More', 'Edit', 'Delete'
  ];


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
                          margin: const EdgeInsets.all(12),
                        alignment: Alignment.topLeft,
                        child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset("assets/ghost.png", width: 80, height: 80, alignment: Alignment.center,),
                                    const SizedBox(width: 80,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(viewModel.listprofile.nama.toString(), textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20
                                          ),),
                                    const SizedBox(height: 8,),
                                        Text(viewModel.listprofile.mobile.toString(), textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20
                                          ),),
                                      ],
                                    ),
                                    SizedBox(width: 40,),

                                    InkWell(
                                      onTap: () {
                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => addscreen(
                                        //   id: viewModel.listpabrik[index].id,
                                        //   nama: viewModel.listpabrik[index].namaPabrik,
                                        //
                                        // )));
                                        print(">");
                                      },
                                      child: Container(
                                        width: 60,
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
                                          '>',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 32,),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                print("Kebun Saya");
                                              },
                                              child: const Text(
                                                'Kebun Saya',
                                                style: TextStyle(
                                                  fontSize: 21,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            )
                                          ]
                                      ),
                                    ),
                                    const SizedBox(height: 16 , width: 40,),
                                    Expanded(
                                      child: Column(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => tabnav(
                                                //   id: viewModel.listpabrik[index].id,
                                                //   nama: viewModel.listpabrik[index].namaPabrik,
                                                //
                                                )));
                                                print("+ Tambah Kebun");
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
                                                  '+ Tambah Kebun',
                                                  style: TextStyle(
                                                    fontSize: 18,
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

                                Column(
                                  children: [
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics: ClampingScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      itemCount: viewModel.listvertical.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => detailedscreen(
                                              kebunId: viewModel.listvertical[index].id,
                                              //   image: viewModel.listvertical[index].foto.toString(),
                                              // tanggal: viewModel.listvertical[index].jumlahPohon.toString(),
                                              //   title: viewModel.listvertical[index].tahunTanamId.toString(),
                                              // )));

                                              //print("data : ${viewModel.listvertical[index].longitude}"


                                            )));
                                          },
                                          child: Container(
                                              padding: EdgeInsets.all(10),
                                              width: 150,
                                              alignment: Alignment.center,
                                              child: Card(
                                                elevation: 16,
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                                child: Container(
                                                  width: double.infinity,
                                                  margin: const EdgeInsets.all(8),
                                                  alignment: Alignment.centerLeft,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [

                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text("Luas Kebun" + " " + viewModel.listvertical[index].luasKebun.toString() + " Hektar" ,style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                                           PopupMenuButton(
                                                            icon: Icon(Icons.more_horiz),
                                                            onSelected: (value){
                                                              setState(() {
                                                                if (value == 'more')
                                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => detailedscreen(
                                                                    kebunId: viewModel.listvertical[index].id,
                                                                    //   image: viewModel.listvertical[index].foto.toString(),
                                                                    // tanggal: viewModel.listvertical[index].jumlahPohon.toString(),
                                                                    //   title: viewModel.listvertical[index].tahunTanamId.toString(),
                                                                    // )));

                                                                    //print("data : ${viewModel.listvertical[index].longitude}"
                                                                  )));

                                                              });
                                                            },
                                                            itemBuilder: (context) {
                                                              return [
                                                                PopupMenuItem(
                                                                  value: 'more',
                                                                  child: Text('More'),
                                                                ),
                                                                PopupMenuItem(
                                                                  value: 'edit',
                                                                  child: Text('Edit'),
                                                                ),
                                                                PopupMenuItem(
                                                                  value: 'delete',
                                                                  child: Text('Delete'),
                                                                )
                                                              ];
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(height: 12,),
                                                      Text("Potensi Produk"+ " " + viewModel.listvertical[index].potensiProduksi.toString()+ " Kg/Bulan", style: const TextStyle(fontSize: 16)),
                                                      const SizedBox(height: 8,),
                                                      Text("Kondisi Lahan"+ " " + viewModel.listvertical[index].statusLahanId.toString(),style: const TextStyle(fontSize: 16)),
                                                      const SizedBox(height: 8,),
                                                    ],
                                                  ),
                                                ),
                                              )
                                          ),
                                        );
                                      },
                                    ),
                                  ],




                                )
                              ],
                ),
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
