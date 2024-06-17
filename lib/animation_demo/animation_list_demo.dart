import 'package:flutter/material.dart';

class AnimationListDemo extends StatefulWidget {

  @override
  ListState createState() => ListState();
}

class ListState extends State<AnimationListDemo>{

  List<String> items = ["Banane", "Poire", "Pêche", "Abricot"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: "Ajoutez un fruit"
          ),
          onSubmitted: (fruit) {

          },
        ),
        Expanded(
            child: AnimatedList(
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
          icon: Icon(Icons.delete),
          onPressed: () {
            
          },
        ),
      ),
    );
  }
}