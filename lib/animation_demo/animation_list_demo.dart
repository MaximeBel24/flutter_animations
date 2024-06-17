import 'dart:math';

import 'package:flutter/material.dart';

class AnimationListDemo extends StatefulWidget {

  @override
  ListState createState() => ListState();
}

class ListState extends State<AnimationListDemo>{

  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();
  List<String> items = ["Banane", "Poire", "Pêche", "Abricot"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
            hintText: "Ajoutez un fruit"
          ),
          onSubmitted: (fruit) {
            _addItem(fruit);
          },
        ),
        Expanded(
            child: AnimatedList(
              key: _key,
              itemBuilder: (BuildContext context, int index, Animation<double> animation) {
                return slideTile(items[index], index, animation);
              },
              initialItemCount: items.length,
            )
        )
      ],
    );
  }

  Widget slideTile(String name, int index, Animation animation){

    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    final tween = Tween(begin: begin, end: end);
    final offsetAnimation = animation.drive(tween);

    return SlideTransition(
      position: offsetAnimation,
      child: ListTile(
        title: Text(name),
        leading: Text(index.toString()),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            _removeItem(index);
          },
        ),
      ),
    );
  }

  _addItem(String name) {
    // int index = items.length;
    int index = Random().nextInt(items.length - 1);
    items.insert(index, name);
    _key.currentState?.insertItem(index);
  }

  _removeItem(int index) {
    String name = items[index];
    items.removeAt(index);
    _key.currentState?.removeItem(index, (context, animation) {
      return slideTile(name, index, animation);
    });
  }
}