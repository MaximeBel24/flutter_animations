import 'package:flutter/material.dart';
import 'package:flutter_animations/models/datas.dart';
import 'package:flutter_animations/models/greek_city.dart';
import 'package:flutter_animations/models/material_desgin.dart';

class HeroList extends StatelessWidget{

  List<GreekCity> _cities = Datas().cities;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: ListView.separated(
          itemBuilder: (context, i) {
            GreekCity city = _cities[i];
            return ListTile(
              leading: Image.asset(
                city.image,
                width: 75,
              ),
              title: Text(city.name),
            );
          },
          separatorBuilder: ((context, i) => MyDivider()),
          itemCount: _cities.length
      ),
    );
  }
}