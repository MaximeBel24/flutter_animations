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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(padding: EdgeInsets.all(15)),
        AnimatedContainer(
          height: heightValue,
            width: widthValue,
            decoration: BoxDecoration(
                color: Colors.blue,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(3, 0),
                  spreadRadius: 2.5,
                  blurRadius: 3
                ),
              ],
              borderRadius: BorderRadius.circular(10)
            ),
            duration: _duration,
          curve: Curves.easeIn,
        ),
        const Padding(padding: EdgeInsets.all(15)),
        Expanded(
            child: ListView(
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
                )
              ],
            )
        )
      ],
    );
  }

}