import 'package:flutter/material.dart';
import 'package:flutter_animations/animation_demo/hero_widget.dart';
import 'package:flutter_animations/models/datas.dart';
import 'package:flutter_animations/models/greek_city.dart';
import 'package:flutter_animations/models/material_desgin.dart';
import 'package:flutter_animations/pages/hero_detail.dart';

class HeroList extends StatelessWidget{

  List<GreekCity> _cities = Datas().cities;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: ListView.builder(
          itemBuilder: (context, i) {
            GreekCity city = _cities[i];
            HeroWidget hero = HeroWidget(url: city.image);
            return InkWell(
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 75,
                      width: 125,
                      child: hero,
                    ),
                    Text(city.name)
                  ],
                ),
              ),
              onTap: () {
                Datas().pusher(context, city.name, HeroDetail(hero: hero, city: city));
              },
            );
          },
          itemCount: _cities.length
      ),
    );
  }
}