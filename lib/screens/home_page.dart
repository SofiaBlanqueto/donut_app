import 'package:donut_app/screens/cart_page.dart';
import 'package:donut_app/screens/login_page.dart';
import 'package:donut_app/utils/auth_service.dart';
import 'package:donut_app/utils/cart_model.dart';
import 'package:donut_app/utils/my_tab.dart';
import 'package:flutter/material.dart';
import 'package:donut_app/tab/burger_tab.dart';
import 'package:donut_app/tab/donut_tab.dart';
import 'package:donut_app/tab/pancake_tad.dart';
import 'package:donut_app/tab/pizza_tab.dart';
import 'package:donut_app/tab/smoothie_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cart = CartModel.instance;

  List<Widget> myTabs = [
    //Donuts tab
    const MyTab(iconPath: 'assets/icons/donut.png', iconName: 'Donuts'),
    //Burger tab
    const MyTab(iconPath: 'assets/icons/burger.png', iconName: 'Burgers'),
    //Smoothies tab
    const MyTab(iconPath: 'assets/icons/smoothie.png', iconName: 'Smoothies'),
    //Pizza tab
    const MyTab(iconPath: 'assets/icons/pizza.png', iconName: 'Pizza'),
    //Pancakes tab
    const MyTab(iconPath: 'assets/icons/pancakes.png', iconName: 'Pancakes'),
  ];

  void _openCart() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CartPage()),
    );
  }

  Future<void> _confirmLogout() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Log out'),
        content: Text(
          'Signed in as ${AuthService.currentUser ?? ''}.\nDo you want to log out?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Log out'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      AuthService.logout();
      cart.clear();
      if (!mounted) return;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          //icono de la izquierda
          leading: Icon(Icons.menu, color: Colors.grey),
          //iconos de la derecha
          actions: [
            // Carrito con contador
            ListenableBuilder(
              listenable: cart,
              builder: (context, _) => IconButton(
                onPressed: _openCart,
                icon: Badge(
                  isLabelVisible: cart.totalItems > 0,
                  label: Text('${cart.totalItems}'),
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            // Usuario (cerrar sesión)
            IconButton(
              onPressed: _confirmLogout,
              icon: const Icon(Icons.person, color: Colors.grey),
            ),
            const SizedBox(width: 16),
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
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            // 2. pestañas (TabBar)
            TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              tabs: myTabs,
            ),
            // 3. contenido de las pestañas
            Expanded(
              child: TabBarView(
                children: [
                  DonutTab(),
                  BurgerTab(),
                  SmoothieTab(),
                  PizzaTab(),
                  PancakeTab(),
                ],
              ),
            ),
            // 4. carrito (cart)
            ListenableBuilder(
              listenable: cart,
              builder: (context, _) => Container(
                color: Colors.white,
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${cart.totalItems} ${cart.totalItems == 1 ? 'item' : 'items'} | \$${formatPrice(cart.totalPrice)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'Delivery charges not included',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _openCart,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink[400],
                      ),
                      child: Text(
                        'View Cart',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
