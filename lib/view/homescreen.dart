import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taniku/viewmodel/homemod.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:taniku/view/navdraw.dart';
import 'package:taniku/view/detail.dart';

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

                                  //Listview Horizontal
                                  const SizedBox(height: 16,),
                                  const Text("Data Horizontal", style: TextStyle(fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 16,),
                                  SizedBox(
                                      width: double.infinity,
                                      height: 180,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: viewModel.listhome.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => Detail(
                                                image: viewModel.listhome[index].newsImage.toString(),
                                              tanggal: viewModel.listhome[index].newsDate.toString(),
                                                title: viewModel.listhome[index].newsTitle.toString(),
                                              )));
                                              print("data : ${viewModel.listhome[index].newsTitle}"

                                              );
                                            },
                                            child: Container(
                                                width: 150,
                                                alignment: Alignment.center,
                                                child: Card(
                                                  child: Container(
                                                    width: double.infinity,
                                                    margin: const EdgeInsets.all(8),
                                                    child: Column(
                                                      children: [
                                                        Image.network(viewModel.listhome[index].newsImage.toString(), width: 70, height: 70,),
                                                        const SizedBox(height: 16,),
                                                        Text(viewModel.listhome[index].newsTitle.toString(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                                        const SizedBox(height: 8,),
                                                        Text(viewModel.listhome[index].newsDate.toString()),
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
