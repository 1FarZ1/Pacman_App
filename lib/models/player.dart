import 'package:flutter/material.dart';

class Player extends StatelessWidget {
  final String url;
  Player(this.url);
  @override
  Widget build(BuildContext context) {
    return Image.asset(url);
  }
}

