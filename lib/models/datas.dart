import 'package:flutter/material.dart';
import 'package:flutter_animations/models/material_desgin.dart';

class Datas {

  String flutter = "images/flutter_logo.png";

  pusher(BuildContext context, String title, Widget destination) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return MyScaffold(title: title, destination: destination);
    }));
  }
}