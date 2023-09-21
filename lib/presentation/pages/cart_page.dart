import 'package:bubbleteaapp/data/model/drink.dart';
import 'package:bubbleteaapp/data/model/drink_shop.dart';
import 'package:bubbleteaapp/presentation/widgets/bubble_tea_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    // remove drink from cart
    void removeFromCart(Drink drink) {
      Provider.of<DrinkShop>(context, listen: false).removeDrinkFromCart(drink);
    }

    return Consumer<DrinkShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const Text(
                "Review Your Order: ",
                style: TextStyle(fontSize: 20),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                height: 500,
                child: value.userCart.isNotEmpty
                    ? ListView.builder(
                        itemCount: value.userCart.length,
                        itemBuilder: (context, index) {
                          Drink eachDrink = value.userCart[index];
                          return DrinkTile(
                            drink: eachDrink,
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              removeFromCart(eachDrink);
                            },
                          );
                        },
                      )
                    : const Center(
                        child: Text("Cart Is Empty"),
                      ),
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.brown[500],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: MaterialButton(
                  height: 25,
                  onPressed: () {},
                  child: const Text(
                    "Checkout",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
