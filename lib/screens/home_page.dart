import 'package:donut_app/utils/my_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TabController _tabController;
  List<Widget> myTabs = [
    //Donuts tab
    const MyTab(iconPath: 'assets/icons/donut.png', iconName: 'Donuts'),
    //Burger tab
    const MyTab(iconPath: 'assets/icons/burger.png', iconName: 'Burgers'),
    //Smoothies tab
    const MyTab(iconPath: 'assets/icons/smoothie.png', iconName: 'Smoothies'),
    //Pancakes tab
    const MyTab(iconPath: 'assets/icons/pancakes.png', iconName: 'Pancakes'),
    //Pizza tab
    const MyTab(iconPath: 'assets/icons/pizza.png', iconName: 'Pizza'),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          //icono de la izquierda
          leading: Icon(Icons.menu, color: Colors.grey),
          //icono de la derecha
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 24.0),
              child: Icon(Icons.person, color: Colors.grey),
            ),
          ],
        ),
        body: Column(
          // 1. texto principal
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Row(
                children: [
                  Text('I want to', style: TextStyle(fontSize: 24)),
                  Text(
                    'EAT',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            // 2. pestañas (TabBar)
            TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              tabs: myTabs,
            ),
            // 3. contenido de las pestañas
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  DonutTab(),
                  BurgerTab(),
                  SmoothieTab(),
                  PancakeTab(),
                  PizzaTab(),
                ],
              ),
            ),
            // 4. carrito (cart)
          ],
        ),
      ),
    );
  }
}
