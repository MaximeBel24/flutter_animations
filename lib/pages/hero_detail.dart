import 'package:flutter/material.dart';
import 'package:flutter_animations/animation_demo/hero_widget.dart';
import 'package:flutter_animations/models/greek_city.dart';

class HeroDetail extends StatelessWidget {
  HeroWidget hero;
  GreekCity city;

  HeroDetail({required this.hero, required this.city});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        hero,
        Text(city.description)
      ],
    );
  }
}