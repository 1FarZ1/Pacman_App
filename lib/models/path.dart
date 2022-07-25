//  created a parent contaner and for the child is a circle and add some padding between them ;
import 'package:flutter/material.dart';

class Path extends StatelessWidget {
  final Color Ocolor;
  final Color Icolor;
  Path(this.Ocolor, this.Icolor);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: this.Icolor,
          ),
        ),
        color: this.Ocolor,
      ),
    );
  }
}
