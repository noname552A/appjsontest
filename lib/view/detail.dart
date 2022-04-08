import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final String title;
  final String tanggal;
  final String image;
  const Detail({Key? key, required this.title, required this.tanggal, required this.image})
      : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(widget.image.toString(), width: 500,height: 500, ),
              Text(widget.title.toString(), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(widget.tanggal.toString(), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
        ));
  }
}
