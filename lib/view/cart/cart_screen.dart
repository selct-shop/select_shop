import 'package:flutter/cupertino.dart';
import 'package:select_shop/view/Shared/under_develop_screen.dart';
import 'package:select_shop/view/product/products_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    // return const UnderDevScreen();
    return const ProductsScreen();
  }
}
