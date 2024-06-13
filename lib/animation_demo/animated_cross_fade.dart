import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animations/models/datas.dart';

class AnimatedCrossFadeDemo extends StatefulWidget{

  @override
  _CrossState createState() => _CrossState();
}

class _CrossState extends State<AnimatedCrossFadeDemo> {

  bool cross = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
          child: AnimatedCrossFade(
            firstChild: Image.asset(Datas().flutter),
            secondChild: const Text(
              "Retour à l'image",
              style: TextStyle(fontSize: 30),
            ),
            duration: const Duration(seconds: 1),
            crossFadeState: (cross) ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          ),
        onTap: () {
            setState(() {
              cross = !cross;
            });
        },
      ),
    );
  }
}