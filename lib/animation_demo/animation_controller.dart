import 'package:flutter/material.dart';

import '../models/material_desgin.dart';
import '../models/transition_type.dart';

class AnimationControllerDemo extends StatefulWidget {
  final TransitionType type;

  AnimationControllerDemo(this.type);

  @override
  _DemoState createState() => _DemoState();

}

class _DemoState extends State<AnimationControllerDemo> with SingleTickerProviderStateMixin{

  late AnimationController _animationController;
  Duration duration = const Duration(seconds: 1);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        duration: duration,
        vsync: this
    );
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double max = size.width * 0.8;
    return Column(
      children: [
        Container(
          height: max,
          width: max,
          child: Center(
            child: transition(),
          ),
        ),
        TextButton(
            onPressed: () {
              
            },
            child: const Text("Faire la transition")
        )
      ],
    );
  }

  Widget transition() {
    switch(widget.type) {
      default: return EmptyWidget();
    }
  }
}