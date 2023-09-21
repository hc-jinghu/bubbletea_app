import 'package:bubbleteaapp/data/model/drink.dart';
import 'package:flutter/material.dart';

// drink image path
String _path(String name) {
  return "lib/core/resources/images/$name.png";
}

class DrinkShop extends ChangeNotifier {
  // drink list for sale
  List<Drink> _shop = [
    Drink(
      name: "World Milk Tea",
      price: "9.99",
      imagePath: _path("bubble-tea"),
      iceLevel: 3,
      sugarLevel: 2,
      toppings: ["Pearls", "Grass Jelly"],
    ),
    Drink(
      name: "Classic Milk Tea",
      price: "8.99",
      imagePath: _path("milk-tea"),
      iceLevel: 4,
      sugarLevel: 3,
      toppings: [],
    ),
    Drink(
      name: "Classic Red Tea",
      price: "7.99",
      imagePath: _path("milk-tea (1)"),
      iceLevel: 0,
      sugarLevel: 0,
      toppings: ["Green Tea Jelly"],
    ),
  ];

  // add drink to shop
  void addDrinkToShop(Drink drink) {
    _shop.add(drink);
    notifyListeners();
  }

  // remove drink from shop
  void removeDrinkFromShop(Drink drink) {
    _shop.remove(drink);
    notifyListeners();
  }

  // user cart
  List<Drink> _cart = [];

  // get drink list
  List<Drink> get drinkShop => _shop;

  // get user cart
  List<Drink> get userCart => _cart;

  // add item to cart
  void addDrinkToCart(Drink drink, String quantity) {
    _cart.add(drink);
    notifyListeners();
  }

  // remove item from cart
  void removeDrinkFromCart(Drink drink) {
    _cart.remove(drink);
    notifyListeners();
  }

  // add toppings to drink
  void addToppings(Drink drink, String toppings) {
    drink.toppings.add(toppings);
    notifyListeners();
  }

  // remove toppings from drink
  void removeToppings(Drink drink, String toppings) {
    drink.toppings.remove(toppings);
    notifyListeners();
  }
}
