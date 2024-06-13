import 'package:flutter/material.dart';

class MyDivider extends Divider {

  MyDivider():super(
    color: Colors.blue,
    thickness: 1
  );
}

class MyScaffold extends Scaffold {

  String title;
  Widget destination;

  MyScaffold({
    super.key,
    required this.title,
    required this.destination
  }): super(
    appBar: AppBar(
      iconTheme: const IconThemeData(
        color: Colors.white
      ),
      backgroundColor: Colors.blue,
      title: Text(
          title,
        style: const TextStyle(
          color: Colors.white
        ),
      ),
    ),
    body: destination
  );
}