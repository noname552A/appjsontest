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
              Image.network(widget.image.toString(), width: 80,height: 80, ),
              Text(widget.title.toString()),
              Text(widget.tanggal.toString()),
            ],
          ),
        ));
  }
}
