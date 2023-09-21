import 'package:bubbleteaapp/data/model/drink.dart';
import 'package:bubbleteaapp/data/model/drink_shop.dart';
import 'package:bubbleteaapp/presentation/widgets/bubble_tea_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DrinkShop>(
      builder: (context, value, child) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppBar(
            title: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Text(
                  "Welcome! ",
                  style: TextStyle(fontSize: 23),
                ),
                SizedBox(height: 5),
                Text(
                  "Order on the way, enjoy right away.",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
              ],
            ),
            backgroundColor: Colors.brown[400],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  primary: false,
                  itemCount: value.drinkShop.length,
                  itemBuilder: (context, index) {
                    // get individual drink
                    Drink eachDrink = value.drinkShop[index];

                    // return the tile for this drink
                    return DrinkTile(
                      drink: eachDrink,
                      icon: const SizedBox(height: 3, width: 3),
                      onPressed: () {},
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
