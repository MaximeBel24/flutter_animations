import 'package:flutter/material.dart';
import 'package:flutter_animations/models/datas.dart';
import 'package:flutter_animations/models/material_desgin.dart';

import '../models/section.dart';

class HomePage extends StatelessWidget {

  List<Section> _sections = [
    Section(name: "Animated Container", icon: Icons.score, destination: Container(color: Colors.yellow,))
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
          itemBuilder: ((context, index) => tile(context, _sections[index])),
          separatorBuilder: ((context, index) => MyDivider()),
          itemCount: _sections.length
      ),
    );
  }

  ListTile tile(BuildContext context, Section section) {
    return ListTile(
      leading: Icon(section.icon),
      title: Text(section.name),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: (() => Datas().pusher(context, section.name, section.destination)),
    );
  }
}