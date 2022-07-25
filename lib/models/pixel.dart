import 'package:flutter/material.dart';

class MyPixel extends StatelessWidget {
  final Color Ocolor;
  final Color Icolor;
  MyPixel(this.Ocolor, this.Icolor);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
            padding: const EdgeInsets.all(1),
            color: this.Ocolor,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(color: this.Icolor),
            )),
      ),
    );
  }
}