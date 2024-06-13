import 'package:flutter/material.dart';
import 'package:flutter_animations/models/datas.dart';

class AnimatedOpacityDemo extends StatefulWidget {
  @override
  _OpacityState createState() => _OpacityState();
}

class _OpacityState extends State<AnimatedOpacityDemo> {

  bool isOpacity = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children()
    );
  }

  List<Widget> children() {
    List<Widget> c = [];
    c.add(const Text("Opacity"));
    c.add(AnimatedOpacity(
        opacity: (isOpacity) ? 0 : 1,
        duration: const Duration(milliseconds: 1000),
      child: Image.asset(Datas().flutter),
    ));
    c.add(TextButton(
            onPressed: () {
              setState(() {
                isOpacity = !isOpacity;
              });
            },
            child: Text(
              (isOpacity) ? "Montrer" : "Cacher",
              style: const TextStyle(color: Colors.black87),
            ),
        )
    );
    return c;
  }
}