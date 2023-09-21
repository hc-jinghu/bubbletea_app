import 'package:bubbleteaapp/config/theme.dart';
import 'package:bubbleteaapp/data/model/drink_shop.dart';
import 'package:bubbleteaapp/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_page.dart';
import 'shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // navigate bottom bar
  int _selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // pages
  final List<Widget> _pages = [
    ShopPage(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<DrinkShop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: backgroundColor,
        drawer: Drawer(),
        bottomNavigationBar: BottomNavBar(
          onTabChange: (index) => navigateBottomBar(index),
          badge: value.userCart.length,
        ),
        body: _pages[_selectedIndex],
      ),
    );
  }
}
