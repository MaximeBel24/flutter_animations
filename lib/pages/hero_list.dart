import 'package:flutter/material.dart';
import 'package:flutter_animations/animation_demo/hero_widget.dart';
import 'package:flutter_animations/models/datas.dart';
import 'package:flutter_animations/models/greek_city.dart';
import 'package:flutter_animations/models/material_desgin.dart';

class HeroList extends StatelessWidget{

  List<GreekCity> _cities = Datas().cities;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: ListView.builder(
          itemBuilder: (context, i) {
            GreekCity city = _cities[i];
            return InkWell(
              child: Container(
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 75,
                          width: 125,
                          child: HeroWidget(url: city.image),
                        ),
                        Text(city.name)
                      ],
                    ),
                  )
              ),
              onTap: () {
                
              },
            );
          },
          itemCount: _cities.length
      ),
    );
  }
}