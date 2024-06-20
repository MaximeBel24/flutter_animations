import 'dart:ui';

import 'package:flutter/material.dart';

import '../models/datas.dart';
import '../models/material_desgin.dart';
import '../models/transition_type.dart';

class AnimationControllerDemo extends StatefulWidget {
  final TransitionType type;

  AnimationControllerDemo(this.type);

  @override
  _DemoState createState() => _DemoState();

}

class _DemoState extends State<AnimationControllerDemo> with SingleTickerProviderStateMixin{

  final Image _image = Image.asset(Datas().flutter);
  late Animation<Decoration> _animationDecoration;
  late AnimationController _animationController;
  late DecorationTween _decorationTween;
  late CurvedAnimation _curvedAnimation;
  Duration duration = const Duration(seconds: 1);
  bool isAnim = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        duration: duration,
        vsync: this
    );
    _curvedAnimation = CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear
    );
    setupDecoration();
  }

  setupDecoration() {
    BoxDecoration begin = BoxDecoration(color: Colors.lightBlue, borderRadius: BorderRadius.circular(15));
    BoxDecoration end = BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(500));
    _decorationTween = DecorationTween(begin: begin, end: end);
    _animationDecoration = _decorationTween.animate(_curvedAnimation);
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double max = size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: max,
          width: max,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              transition()
            ],
          ),
        ),
        TextButton(
            onPressed: () {
              performTransition();
            },
            child: const Text("Faire la transition")
        )
      ],
    );
  }

  Widget transition() {
    switch(widget.type) {
      case TransitionType.decoratedBox: return decoratedBox();
      case TransitionType.fade: return fade();
      default: return EmptyWidget();
    }
  }

  DecoratedBoxTransition decoratedBox() {
    return DecoratedBoxTransition(
        decoration: _animationDecoration,
        child: _image
    );
  }

  FadeTransition fade() {
    return FadeTransition(
        opacity: CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOut
            ),
        // Tween<double>(
        //     begin: 1,
        //     end: 0.33 )
        //     .animate(
        //     CurvedAnimation(
        //     parent: _animationController,
        //     curve: Curves.easeOut
        //     )
        // ),
      child: _image,
    );
  }

  performTransition() {
    if (isAnim) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
    isAnim = !isAnim;
  }
}