import 'package:donut_app/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class PizzaTab extends StatelessWidget {
  PizzaTab({super.key});

  final List pizzaOnSale = [
    //nombre, precio, color, imagen, proveedor
    [
      'Pepperoni',
      '140',
      Colors.red,
      "assets/images/pepperoni_pizza.png",
      "Domino's",
    ],
    [
      'Margherita',
      '120',
      Colors.green,
      "assets/images/margherita_pizza.png",
      'Little Caesars',
    ],
    [
      'Hawaiian',
      '135',
      Colors.yellow,
      "assets/images/hawaiian_pizza.png",
      "Domino's",
    ],
    [
      'Veggie',
      '125',
      Colors.lightGreen,
      "assets/images/veggie_pizza.png",
      'Pizza Hut',
    ],
    [
      'Mushroom',
      '130',
      Colors.brown,
      "assets/images/mushroom_pizza.png",
      'Pizza Hut',
    ],
    [
      'Cheese',
      '110',
      Colors.amber,
      "assets/images/cheese_pizza.png",
      'Little Caesars',
    ],
    [
      'Supreme',
      '160',
      Colors.deepOrange,
      "assets/images/supreme_pizza.png",
      "Domino's",
    ],
    ['BBQ', '150', Colors.blueGrey, "assets/images/bbq_pizza.png", 'Pizza Hut'],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1 / 1.7,
        crossAxisCount: 2,
      ),
      itemCount: pizzaOnSale.length,
      itemBuilder: (context, index) {
        return DonutTile(
          donutFlavor: pizzaOnSale[index][0],
          donutPrice: pizzaOnSale[index][1],
          donutColor: pizzaOnSale[index][2],
          donutImagePath: pizzaOnSale[index][3],
          donutProvider: pizzaOnSale[index][4],
        );
      },
    );
  }
}
