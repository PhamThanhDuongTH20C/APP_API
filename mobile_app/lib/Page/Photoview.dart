// ignore_for_file: must_be_immutable, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class Photoview extends StatelessWidget {
  String link;
  Photoview(this.link);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          child: const Icon(
            Icons.arrow_back,
            size: 40,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
          child: PhotoView(
        imageProvider: NetworkImage(link),
      )),
    );
  }
}
