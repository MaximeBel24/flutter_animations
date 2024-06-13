import 'package:flutter/material.dart';
import 'package:flutter_animations/models/datas.dart';

class HomePage extends StatelessWidget {
  
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
      body: Center(child: Text("Salut"),),
    );
  }
}