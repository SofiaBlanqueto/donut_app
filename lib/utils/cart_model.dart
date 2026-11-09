import 'package:flutter/material.dart';

/// Muestra 67.0 como "67" y 67.5 como "67.50"
String formatPrice(double value) {
  return value == value.roundToDouble()
      ? value.toStringAsFixed(0)
      : value.toStringAsFixed(2);
}

class CartItem {
  final String name;
  final String category;
  final double price;
  final String imagePath;
  final dynamic color;
  int quantity;

  CartItem({
    required this.name,
    required this.category,
    required this.price,
    required this.imagePath,
    required this.color,
    this.quantity = 1,
  });

  double get subtotal => price * quantity;
}

/// Carrito global. Avisa a la pantalla cuando algo cambia (ChangeNotifier).
class CartModel extends ChangeNotifier {
  CartModel._();
  static final CartModel instance = CartModel._();

  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  int get totalItems => _items.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice => _items.fold(0.0, (sum, item) => sum + item.subtotal);

  void add({
    required String name,
    required String category,
    required double price,
    required String imagePath,
    required dynamic color,
  }) {
    final index = _items.indexWhere((item) => item.imagePath == imagePath);
    if (index >= 0) {
      _items[index].quantity++;
    } else {
      _items.add(
        CartItem(
          name: name,
          category: category,
          price: price,
          imagePath: imagePath,
          color: color,
        ),
      );
    }
    notifyListeners();
  }

  void increment(CartItem item) {
    item.quantity++;
    notifyListeners();
  }

  void decrement(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      _items.remove(item);
    }
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
