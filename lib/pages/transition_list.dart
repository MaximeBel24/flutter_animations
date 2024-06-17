import 'package:flutter/material.dart';
import 'package:flutter_animations/models/material_desgin.dart';
import 'package:flutter_animations/widgets/tile.dart';

import '../models/section.dart';

class TransitionList extends StatelessWidget{

  final List<Section> _sections = [
    Section(name: "DecoratedBox", icon: Icons.compare_arrows, destination: EmptyWidget()),
    Section(name: "Fade", icon: Icons.compare_arrows, destination: EmptyWidget()),
    Section(name: "Positionned", icon: Icons.compare_arrows, destination: EmptyWidget()),
    Section(name: "Rotation", icon: Icons.compare_arrows, destination: EmptyWidget()),
    Section(name: "Scale", icon: Icons.compare_arrows, destination: EmptyWidget()),
    Section(name: "Size", icon: Icons.compare_arrows, destination: EmptyWidget()),
    Section(name: "Slide", icon: Icons.compare_arrows, destination: EmptyWidget()),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: ((context, i) => Tile(_sections[i])),
        separatorBuilder: ((context, i) => MyDivider()),
        itemCount: _sections.length
    );
  }
}