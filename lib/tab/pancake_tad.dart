import 'package:donut_app/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class PancakeTab extends StatelessWidget {
  PancakeTab({super.key});

  final List pancakeOnSale = [
    //nombre, precio, color, imagen, proveedor
    [
      'Classic',
      '70',
      Colors.orange,
      "assets/images/classic_pancakes.png",
      'IHOP',
    ],
    [
      'Strawberry',
      '85',
      Colors.red,
      "assets/images/strawberry_pancakes.png",
      "Denny's",
    ],
    [
      'Blueberry',
      '85',
      Colors.indigo,
      "assets/images/blueberry_pancakes.png",
      'IHOP',
    ],
    [
      'Banana',
      '80',
      Colors.yellow,
      "assets/images/banana_pancakes.png",
      "Denny's",
    ],
    [
      'Chocolate',
      '90',
      Colors.brown,
      "assets/images/chocolate_pancakes.png",
      'IHOP',
    ],
    [
      'Whipped',
      '95',
      Colors.pink,
      "assets/images/whipped_pancakes.png",
      "Denny's",
    ],
    ['Honey', '75', Colors.amber, "assets/images/honey_pancakes.png", 'IHOP'],
    [
      'Mixed Berry',
      '100',
      Colors.purple,
      "assets/images/mixed_pancakes.png",
      "Denny's",
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1 / 1.7,
        crossAxisCount: 2,
      ),
      itemCount: pancakeOnSale.length,
      itemBuilder: (context, index) {
        return DonutTile(
          donutFlavor: pancakeOnSale[index][0],
          donutPrice: pancakeOnSale[index][1],
          donutColor: pancakeOnSale[index][2],
          donutImagePath: pancakeOnSale[index][3],
          donutProvider: pancakeOnSale[index][4],
        );
      },
    );
  }
}
