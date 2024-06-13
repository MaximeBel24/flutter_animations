import 'package:flutter/cupertino.dart';
import 'package:flutter_animations/models/datas.dart';

class FadeInDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeInImage(
        placeholder: AssetImage(Datas().flutter),
        image: const NetworkImage("https://images.pexels.com/photos/2078475/pexels-photo-2078475.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
        fadeInCurve: Curves.easeIn,
        fadeOutCurve: Curves.easeOut,
        fadeInDuration: const Duration(seconds: 1),
        fadeOutDuration: const Duration(seconds: 1),
      ),
    );
  }
}