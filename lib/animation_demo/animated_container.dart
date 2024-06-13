import 'package:flutter/material.dart';

class AnimatedContainerDemo extends StatefulWidget{

  @override
  _AnimatedContainerState createState() => _AnimatedContainerState();

}

class _AnimatedContainerState extends State<AnimatedContainerDemo> {

  final Duration _duration = const Duration(seconds: 2);
  double min = 0;
  double max = 300;
  double heightValue = 150;
  double widthValue = 150;
  Color _color = Colors.blue;
  bool shadow = true;
  bool radius = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(padding: EdgeInsets.all(15)),
        AnimatedContainer(
          height: heightValue,
            width: widthValue,
            decoration: BoxDecoration(
                color: _color,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: (shadow) ? const Offset(3, 0) : const Offset(0, 0),
                  spreadRadius: (shadow) ? 2.5 : 0,
                  blurRadius: (shadow) ? 3 : 0
                ),
              ],
              borderRadius: (radius) ? BorderRadius.circular(30) : BorderRadius.circular(0)
            ),
            duration: _duration,
          curve: Curves.linear,
        ),
        const Padding(padding: EdgeInsets.all(15)),
        Expanded(
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    colorButton("Bleu", Colors.blue),
                    colorButton("Rouge", Colors.red),
                    colorButton("Vert", Colors.green)
                  ],
                ),
                const Padding(padding: EdgeInsets.all(15)),
                Padding(
                    padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hauteur: ${heightValue.round()}"),
                          Slider(
                              activeColor: Colors.blue,
                              thumbColor: Colors.blue,
                              min: min,
                              max: max,
                              value: heightValue,
                              onChanged: ((newValue) => setState(() => heightValue = newValue))
                          ),
                          Text("Largeur: ${widthValue.round()}"),
                          Slider(
                              activeColor: Colors.blue,
                              thumbColor: Colors.blue,
                              min: min,
                              max: max,
                              value: widthValue,
                              onChanged: ((newValue) => setState(() => widthValue = newValue))
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Shadow : $shadow"),
                          Switch(
                              activeColor: Colors.blue,
                              inactiveThumbColor: Colors.blue,
                              inactiveTrackColor: Colors.white,
                              value: shadow,
                              onChanged: ((newValue) => setState(() => shadow = newValue))
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Radius : $radius"),
                          Switch(
                              activeColor: Colors.blue,
                              inactiveThumbColor: Colors.blue,
                              inactiveTrackColor: Colors.white,
                              value: radius,
                              onChanged: ((newValue) => setState(() => radius = newValue))
                          )
                        ],
                      )
                    ],
                  ),
                ),

              ],
            )
        )
      ],
    );
  }

  FloatingActionButton colorButton(String name, Color color) {
    return FloatingActionButton(
        onPressed: (() => setState(() => _color = color )),
      backgroundColor: color,
      heroTag: name,
    );
  }

}