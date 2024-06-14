import 'package:flutter/material.dart';
import 'package:flutter_animations/models/datas.dart';

class AnimatedPositionDemo extends StatefulWidget{
  @override
  _PosState createState() => _PosState();
}

class _PosState extends State<AnimatedPositionDemo> {

  bool isConnected = false;
  Duration duration = const Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    double max = size.width * 0.8;
    double centerTop = max / 2 - 20;
    double centerBottom = max / 2 - 20;

    return Center(
      child: Container(
        height: max,
        width: max,
        child: Card(
          elevation: 8,
          child: InkWell(
            onTap: () {
              setState(() {
                isConnected = !isConnected;
              });
            },
            child: Stack(
              children: [
                AnimatedPositioned(
                  left: 10,
                  right: 10,
                  bottom: centerTop,
                  top: centerBottom,
                  duration: duration,
                  child: const TextField(
                    decoration: InputDecoration(
                        hintText: "Entrez mail"
                    ),
                  ),
                ),
                AnimatedPositioned(
                  left: 10,
                  right: 10,
                  bottom: (isConnected) ? centerBottom : 10,
                  top: (isConnected) ? centerTop : max - 40,
                  duration: duration,
                  child: const TextField(
                    decoration: InputDecoration(
                        hintText: "Entrez mot de passe"
                    ),
                  ),
                ),
                AnimatedPositioned(
                  top: (isConnected) ? 0 : 10,
                  bottom: (isConnected) ? 0 : max - 100,
                  left: (isConnected) ? 0 : 10,
                  right: (isConnected) ? 0 : max - 100,
                  duration: duration,
                  child: AnimatedContainer(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(isConnected ? 0 : 50)
                    ),
                    duration: duration,
                    child: Image.asset(
                      Datas().flutter,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}