import 'package:bubbleteaapp/data/model/drink_shop.dart';
import 'package:bubbleteaapp/presentation/pages/cart_page.dart';
import 'package:bubbleteaapp/presentation/pages/login_page.dart';
import 'package:bubbleteaapp/presentation/pages/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DrinkShop(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const LoginPage(),
        routes: {
          '/shoppage': (context) => const ShopPage(),
          '/cartpage': (context) => const CartPage(),
        },
      ),
    );
  }
}
