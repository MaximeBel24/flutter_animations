import 'package:flutter/material.dart';
import 'package:flutter_animations/animation_demo/animated_container.dart';
import 'package:flutter_animations/models/datas.dart';
import 'package:flutter_animations/models/material_desgin.dart';
import 'package:flutter_animations/pages/hero_list.dart';
import 'package:flutter_animations/pages/other_animated_list.dart';
import 'package:flutter_animations/widgets/tile.dart';

import '../models/section.dart';

class HomePage extends StatelessWidget {

  final List<Section> _sections = [
    Section(name: "Animated Container", icon: Icons.score, destination: AnimatedContainerDemo()),
    Section(name: "Les autres animated", icon: Icons.local_movies, destination: OtherAnimatedList()),
    Section(name: "Hero", icon: Icons.flash_on, destination: HeroList()),
  ];
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50)
          ),
          margin: const EdgeInsets.all(5),
          child: Image.asset(Datas().flutter),
        ),
        title: const Text(
            "Les animations avec Flutter",
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      body: ListView.separated(
          itemBuilder: ((context, index) => Tile(_sections[index])),
          separatorBuilder: ((context, index) => MyDivider()),
          itemCount: _sections.length
      ),
    );
  }


}