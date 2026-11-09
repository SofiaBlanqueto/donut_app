import 'package:donut_app/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class SmoothieTab extends StatelessWidget {
  SmoothieTab({super.key});

  final List smoothieOnSale = [
    //nombre, precio, color, imagen, proveedor
    [
      'Strawberry',
      '55',
      Colors.pink,
      "assets/images/strawberry_smoothie.png",
      'Jugos Frescos',
    ],
    [
      'Mango',
      '60',
      Colors.orange,
      "assets/images/mango_smoothie.png",
      'Jugos Frescos',
    ],
    [
      'Banana',
      '50',
      Colors.yellow,
      "assets/images/banana_smoothie.png",
      'Smoothie King',
    ],
    [
      'Blueberry',
      '65',
      Colors.deepPurple,
      "assets/images/blueberry_smoothie.png",
      'Smoothie King',
    ],
    [
      'Kiwi',
      '62',
      Colors.lightGreen,
      "assets/images/kiwi_smoothie.png",
      'Jugos Frescos',
    ],
    [
      'Avocado',
      '70',
      Colors.green,
      "assets/images/avocado_smoothie.png",
      'Vegan House',
    ],
    [
      'Orange',
      '45',
      Colors.amber,
      "assets/images/orange_smoothie.png",
      'Smoothie King',
    ],
    [
      'Chocolate',
      '68',
      Colors.brown,
      "assets/images/chocolate_smoothie.png",
      'Starbucks',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1 / 1.7,
        crossAxisCount: 2,
      ),
      itemCount: smoothieOnSale.length,
      itemBuilder: (context, index) {
        return DonutTile(
          donutFlavor: smoothieOnSale[index][0],
          donutPrice: smoothieOnSale[index][1],
          donutColor: smoothieOnSale[index][2],
          donutImagePath: smoothieOnSale[index][3],
          donutProvider: smoothieOnSale[index][4],
        );
      },
    );
  }
}
