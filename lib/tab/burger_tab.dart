import 'package:donut_app/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class BurgerTab extends StatelessWidget {
  BurgerTab({super.key});

  final List burgerOnSale = [
    //nombre, precio, color, imagen, proveedor
    [
      'Classic',
      '85',
      Colors.orange,
      "assets/images/classic_burger.png",
      'Burger King',
    ],
    [
      'Cheese',
      '95',
      Colors.amber,
      "assets/images/cheese_burger.png",
      "McDonald's",
    ],
    [
      'Bacon',
      '110',
      Colors.red,
      "assets/images/bacon_burger.png",
      "Carl's Jr.",
    ],
    [
      'Double',
      '130',
      Colors.brown,
      "assets/images/double_burger.png",
      'Burger King',
    ],
    ['Chicken', '90', Colors.yellow, "assets/images/chicken_burger.png", 'KFC'],
    [
      'Veggie',
      '88',
      Colors.green,
      "assets/images/veggie_burger.png",
      'Vegan House',
    ],
    [
      'Spicy',
      '105',
      Colors.deepOrange,
      "assets/images/spicy_burger.png",
      "Carl's Jr.",
    ],
    [
      'BBQ',
      '115',
      Colors.blueGrey,
      "assets/images/bbq_burger.png",
      "McDonald's",
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1 / 1.7,
        crossAxisCount: 2,
      ),
      itemCount: burgerOnSale.length,
      itemBuilder: (context, index) {
        return DonutTile(
          donutFlavor: burgerOnSale[index][0],
          donutPrice: burgerOnSale[index][1],
          donutColor: burgerOnSale[index][2],
          donutImagePath: burgerOnSale[index][3],
          donutProvider: burgerOnSale[index][4],
        );
      },
    );
  }
}
