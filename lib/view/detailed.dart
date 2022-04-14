import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taniku/viewmodel/detailedview.dart';
import 'package:taniku/viewmodel/homemod.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:taniku/view/navdraw.dart';
import 'package:taniku/view/detail.dart';

class detailedscreen extends StatefulWidget {
  final kebunId;
  const detailedscreen({Key? key, required this.kebunId}) : super(key: key);

  @override
  State<detailedscreen> createState() => _detailedscreenState();
}

class _detailedscreenState extends State<detailedscreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<detailedmod>(
        create: (context) => detailedmod(context, widget.kebunId.toString()),
        child: Builder(
            builder: (context) {
              return Consumer<detailedmod>(
                  builder: (context, viewModel, child) {
                    return Scaffold(

                        extendBodyBehindAppBar: false,
                        backgroundColor: Colors.blue,
                        appBar: AppBar(
                          backgroundColor: Color(0x44000000),
                          elevation: 0,
                          title: Text("Detailed View"),
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
                                      //Listview Horizontal
                                      const SizedBox(height: 16,),
                                      const Text("Data Vertical", style: TextStyle(fontWeight: FontWeight.bold),),
                                      const SizedBox(height: 16,),
                                      ListView.builder(
                                            physics: ClampingScrollPhysics(),
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: viewModel.listone.length,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {


                                                  print("data : ${viewModel.listone[index].longitude}"

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
                                                            Text("Alamat"),
                                                            Text(
                                                                viewModel.listone[index].alamat.toString() + ", " +
                                                                    viewModel.listone[index].kecamatanName.toString() + ", " +
                                                                    viewModel.listone[index].kelurahanName.toString(),
                                                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

                                                            Text(
                                                                    viewModel.listone[index].kabupatenKotaName.toString() + ", " +
                                                                    viewModel.listone[index].provinsiName.toString() + ", " +
                                                                    viewModel.listone[index].kodePos.toString()
                                                                , style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                                            Row(
                                                              children: [
                                                                Expanded(
                                                                  child: Column(
                                                                    children: [
                                                                      Text("Luas Kebun"),
                                                                      Text(viewModel.listone[index].luasKebun.toString() + " HA",style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold) ),
                                                                      const SizedBox(height: 16,),
                                                                      Text("Tipe Lahan"),
                                                                      Text(viewModel.listone[index].statusLahanName.toString(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                                                      const SizedBox(height: 8,),
                                                                      Text("Jumlah Pohon"),
                                                                      Text(viewModel.listone[index].jumlahPohon.toString(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                                                      const SizedBox(height: 8,),]
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Column(
                                                                    children: [
                                                                  Text("Jenis bibit"),
                                                                  Text(viewModel.listone[index].jenisBibitName.toString(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                                                  const SizedBox(height: 8,),
                                                                  Text("tahun tanam"),
                                                                  Text(viewModel.listone[index].tahunTanamId.toString(),style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                                                  const SizedBox(height: 8,),
                                                                  Text("Produksi Per Bulan"),
                                                                  Text(viewModel.listone[index].potensiProduksi.toString() + "ton/bulan", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                                                  const SizedBox(height: 8,),
                                                                  Image.network(viewModel.listone[index].foto.toString(),errorBuilder: (context, error, stackTrace) {
                                                                    return Container(
                                                                        child: const Icon(Icons.error_outline, size: 24)
                                                                    );
                                                                  }),
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
                                          ),

                                      //Dokumen
                                      const SizedBox(height: 16,),
                                        ListView.builder(
                                            physics: ClampingScrollPhysics(),
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: viewModel.listdokumen.length,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {

                                                  print("data : ${viewModel.listdokumen[index].dokumenId.toString()}"

                                                  );
                                                },
                                                child: Container(
                                                    width: 150,
                                                    alignment: Alignment.center,
                                                    child: Card(
                                                      child: Container(
                                                        width: double.infinity,
                                                        margin: const EdgeInsets.all(8),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Column(
                                                            children: [
                                                              Image.network(viewModel.listdokumen[index].foto.toString(),
                                                                width: 60,
                                                              height: 60,
                                                                  errorBuilder: (context, error, stackTrace) {
                                                                return Container(
                                                                    child: const Icon(Icons.error_outline, size: 24)
                                                                );
                                                              }
                                                              )
                                                      ]
                                                    ),

                                                          SizedBox(height: 5, width: 20,),
                                                            Column(
                                                              children: [
                                                            Text("Dokumen"),
                                                            const SizedBox(height: 8,),
                                                            Text(viewModel.listdokumen[index].dokumenName.toString() , style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                                            Text(viewModel.listdokumen[index].nomor.toString(),style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                                          ],
                                                        ),
                                                        ]
                                                      ),
                                                    )
                                                ),
                                                )
                                              );
                                            },
                                          ),

                                      //sertifikat
                                      const SizedBox(height: 16,),
                                        ListView.builder(
                                            physics: ClampingScrollPhysics(),
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: viewModel.listsertifikat.length,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                  onTap: () {

                                                    print("data : ${viewModel.listsertifikat[index]}"

                                                    );
                                                  },
                                                  child: Container(
                                                    width: 150,
                                                    alignment: Alignment.center,
                                                    child: Card(
                                                        child: Container(
                                                          width: double.infinity,
                                                          margin: const EdgeInsets.all(8),
                                                          child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: [
                                                                Column(
                                                                    children: [
                                                                      Image.network(viewModel.listsertifikat[index].sertifikasiImage.toString(),
                                                                          width: 60,
                                                                          height: 60,
                                                                          errorBuilder: (context, error, stackTrace) {
                                                                            return Container(
                                                                                child: const Icon(Icons.error_outline, size: 24)
                                                                            );
                                                                          }
                                                                      )
                                                                    ]
                                                                ),

                                                                SizedBox(height: 5, width: 20,),
                                                                Column(
                                                                  children: [
                                                                    Text("Sertifikat"),
                                                                    const SizedBox(height: 8,),
                                                                    Text(viewModel.listsertifikat[index].sertifikasiName.toString() , style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                                                    Text(viewModel.listsertifikat[index].sertifikasiNo.toString(),style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                                                  ],
                                                                ),
                                                              ]
                                                          ),
                                                        )
                                                    ),
                                                  )
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
