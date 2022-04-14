import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taniku/viewmodel/homemod.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:taniku/view/navdraw.dart';
import 'package:taniku/view/detail.dart';
import 'package:taniku/view/detailed.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    var ukuran = MediaQuery.of(context).size;
    return ChangeNotifierProvider<homemod>(
        create: (context) => homemod(context),
        child: Builder(
        builder: (context) {
          return Consumer<homemod>(
              builder: (context, viewModel, child) {

                return Scaffold(


                  extendBodyBehindAppBar: false,
                  backgroundColor: Colors.blue,
                  appBar: AppBar(
                    backgroundColor: Color(0x44000000),
                    elevation: 0,
                    title: Text("List View"),
                    // leading: IconButton(
                    //   onPressed: (){
                    //     Navigator.pop(context, MaterialPageRoute(builder: (context) => navdrawmain()));
                    //   },
                    //   icon: Icon(Icons.account_circle_sharp),
                    // ),
                  ),
                    drawer: navdraw(),
                    body: SingleChildScrollView(
                        child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Caroulser slider vertical
                                  Container(
                                      margin: const EdgeInsets.only(top: 16),
                                      height: 220,
                                      child: CarouselSlider.builder(
                                        itemCount: viewModel.listhome.length,
                                        itemBuilder: (context, index, _) {
                                          return Container(
                                              width: ukuran.width,
                                              decoration: BoxDecoration(boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 10,
                                                    offset: const Offset(3, 3),
                                                    color: Colors.grey.shade400)
                                              ]),
                                              child: GestureDetector(
                                                child: Column(
                                                  children: <Widget>[
                                                    Expanded(
                                                      flex: 4,
                                                      child: Container(
                                                        width: ukuran.width,
                                                        height: ukuran.height,
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                            borderRadius: const BorderRadius.only(
                                                                topLeft: Radius.circular(5),
                                                                topRight: Radius.circular(5)),
                                                            image: DecorationImage(
                                                              image : NetworkImage(viewModel.listhome[index].newsImage.toString()),
                                                              fit: BoxFit.fill,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                onTap: () async {
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Detail(
                                                    image: viewModel.listhome[index].newsImage.toString(),
                                                    tanggal: viewModel.listhome[index].newsDate.toString(),
                                                    title: viewModel.listhome[index].newsTitle.toString(),
                                                  )));
                                                },
                                              )
                                          );
                                        },
                                        options: CarouselOptions(
                                          onPageChanged: (index, reason) async {
                                          },
                                          height: 180,
                                          enableInfiniteScroll: true,
                                          enlargeCenterPage: true,
                                          autoPlay: true,
                                          autoPlayInterval: const Duration(seconds: 5),
                                          autoPlayAnimationDuration: const Duration(milliseconds: 800),
                                          autoPlayCurve: Curves.fastOutSlowIn,
                                          pauseAutoPlayOnTouch: true,
                                          aspectRatio: 2.0,
                                        ),
                                      )
                                  ),

                                  const SizedBox(height: 16,),
                                  const Text("Data Vertical", style: TextStyle(fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 16,),

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
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          width: double.maxFinite,

                                                          decoration: BoxDecoration(color: Colors.lightBlue),
                                                          child:
                                                          const Text("Lahan Kebun Petani",style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                                        ),
                                                        Text("Luas Kebun"),
                                                        Text(viewModel.listvertical[index].luasKebun.toString(),style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold) ),
                                                        const SizedBox(height: 8,),
                                                        Text("Jumlah Pohon"),
                                                        Text(viewModel.listvertical[index].jumlahPohon.toString(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                                        const SizedBox(height: 8,),
                                                        Text("tahun tanam"),
                                                        Text(viewModel.listvertical[index].tahunTanamId.toString(),style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                                        const SizedBox(height: 8,),
                                                        Text("Alamat"),
                                                        Text(viewModel.listvertical[index].alamat.toString(),style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                                        Text(viewModel.listvertical[index].kecamatanName.toString(),style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                                        Text(viewModel.listvertical[index].kelurahanName.toString(),style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                                        Text(viewModel.listvertical[index].kabupatenKotaName.toString(),style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                                        Text(viewModel.listvertical[index].provinsiName.toString(),style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                                        Text(viewModel.listvertical[index].kodePos.toString(),style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

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
                  )
                );

              }
              );
        }
        )
    );
  }

  }
