import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedTextStyleDemo extends StatefulWidget {
  @override
  _TextState createState() => _TextState();
}

class _TextState extends State<AnimatedTextStyleDemo> {

  bool isFirst = true;

  @override
  Widget build(BuildContext context) {
    return Center (
      child: InkWell(
        onTap: () {
          setState(() {
            isFirst = !isFirst;
          });
        },
        child: AnimatedDefaultTextStyle(
          style: (isFirst) ? firstStyle() : secondStyle(),
          duration: const Duration(seconds: 2),
          child: const Text("Tap to change"),
        ),
      ),
    );
  }

  TextStyle firstStyle() {
    return const TextStyle(
      color: Colors.orange,
      fontSize: 40,
      fontWeight: FontWeight.w100,
      // fontStyle: FontStyle.italic
    );
  }

  TextStyle secondStyle() {
    return const TextStyle(
        color: Colors.teal,
        fontSize: 20,
        fontWeight: FontWeight.w900,
        // fontStyle: FontStyle.normal
    );
  }
}