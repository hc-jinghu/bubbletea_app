import 'package:bubbleteaapp/config/theme.dart';
import 'package:bubbleteaapp/core/constant/const.dart';
import 'package:bubbleteaapp/data/model/drink.dart';
import 'package:bubbleteaapp/data/model/drink_shop.dart';
import 'package:bubbleteaapp/presentation/widgets/custom_radio_button.dart';
import 'package:bubbleteaapp/presentation/widgets/quantity_button.dart';
import 'package:bubbleteaapp/presentation/widgets/toppings_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class DrinkDetailPage extends StatefulWidget {
  Drink drink;
  DrinkDetailPage({super.key, required this.drink});

  @override
  State<DrinkDetailPage> createState() => _DrinkDetailPageState();
}

class _DrinkDetailPageState extends State<DrinkDetailPage> {
  // increment counter
  int _counter = 1;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    if (_counter > 1) {
      setState(() {
        _counter--;
      });
    }
  }

  // select toppings
  bool selected(String name) {
    return widget.drink.toppings.contains(name);
  }

  // add toppings
  void addToppings(String name) {
    Provider.of<DrinkShop>(context, listen: false)
        .addToppings(widget.drink, name);
  }

  // remove toppings
  void removeToppings(String name) {
    Provider.of<DrinkShop>(context, listen: false)
        .removeToppings(widget.drink, name);
  }

  // add item to cart
  void addToCart(Drink drink, String quantity) {
    Provider.of<DrinkShop>(context, listen: false)
        .addDrinkToCart(drink, _counter.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DrinkShop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.brown[300],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // image of the drink
              SizedBox(
                height: 140,
                width: 140,
                child: Image.asset(widget.drink.imagePath),
              ),
              // name of the drink
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.drink.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // Ice level
              const Text("Ice Level:", style: TextStyle(fontSize: 18)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomRadioButtonGroup(
                        value: 0,
                        selectedValue: widget.drink.iceLevel,
                        title: icelvl[0],
                        onPressed: (value) => setState(() {
                          widget.drink.iceLevel = value!;
                        }),
                      ),
                      CustomRadioButtonGroup(
                        value: 1,
                        selectedValue: widget.drink.iceLevel,
                        title: icelvl[1],
                        onPressed: (value) => setState(() {
                          widget.drink.iceLevel = value!;
                        }),
                      ),
                      CustomRadioButtonGroup(
                        value: 2,
                        selectedValue: widget.drink.iceLevel,
                        title: icelvl[2],
                        onPressed: (value) => setState(() {
                          widget.drink.iceLevel = value!;
                        }),
                      ),
                      CustomRadioButtonGroup(
                        value: 3,
                        selectedValue: widget.drink.iceLevel,
                        title: icelvl[3],
                        onPressed: (value) => setState(() {
                          widget.drink.iceLevel = value!;
                        }),
                      ),
                    ],
                  ),
                ),
              ),

              // sugar level
              const Text("Sugar Level:", style: TextStyle(fontSize: 18)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomRadioButtonGroup(
                        value: 0,
                        selectedValue: widget.drink.sugarLevel,
                        title: sugarlvl[0],
                        onPressed: (value) => setState(() {
                          widget.drink.sugarLevel = value!;
                        }),
                      ),
                      CustomRadioButtonGroup(
                        value: 1,
                        selectedValue: widget.drink.sugarLevel,
                        title: sugarlvl[1],
                        onPressed: (value) => setState(() {
                          widget.drink.sugarLevel = value!;
                        }),
                      ),
                      CustomRadioButtonGroup(
                        value: 2,
                        selectedValue: widget.drink.sugarLevel,
                        title: sugarlvl[2],
                        onPressed: (value) => setState(() {
                          widget.drink.sugarLevel = value!;
                        }),
                      ),
                      CustomRadioButtonGroup(
                        value: 3,
                        selectedValue: widget.drink.sugarLevel,
                        title: sugarlvl[3],
                        onPressed: (value) => setState(() {
                          widget.drink.sugarLevel = value!;
                        }),
                      ),
                    ],
                  ),
                ),
              ),

              // toppings & add-on
              const Text("Toppings:", style: TextStyle(fontSize: 18)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: SizedBox(
                  height: 120,
                  width: double.infinity,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 5,
                    runSpacing: 5,
                    children: [
                      ToppingsTile(
                        title: toppings[0],
                        isSelected: selected(toppings[0]),
                        onPressed: () {
                          setState(() {
                            if (selected(toppings[0])) {
                              removeToppings(toppings[0]);
                            } else {
                              addToppings(toppings[0]);
                            }
                          });
                        },
                      ),
                      ToppingsTile(
                        title: toppings[1],
                        isSelected: selected(toppings[1]),
                        onPressed: () {
                          setState(() {
                            if (selected(toppings[1])) {
                              removeToppings(toppings[1]);
                            } else {
                              addToppings(toppings[1]);
                            }
                          });
                        },
                      ),
                      ToppingsTile(
                        title: toppings[2],
                        isSelected: selected(toppings[2]),
                        onPressed: () {
                          setState(() {
                            if (selected(toppings[2])) {
                              removeToppings(toppings[2]);
                            } else {
                              addToppings(toppings[2]);
                            }
                          });
                        },
                      ),
                      ToppingsTile(
                        title: toppings[3],
                        isSelected: selected(toppings[3]),
                        onPressed: () {
                          setState(() {
                            if (selected(toppings[3])) {
                              removeToppings(toppings[3]);
                            } else {
                              addToppings(toppings[3]);
                            }
                          });
                        },
                      ),
                      ToppingsTile(
                        title: toppings[4],
                        isSelected: selected(toppings[4]),
                        onPressed: () {
                          setState(() {
                            if (selected(toppings[4])) {
                              removeToppings(toppings[4]);
                            } else {
                              addToppings(toppings[4]);
                            }
                          });
                        },
                      ),
                      ToppingsTile(
                        title: toppings[5],
                        isSelected: selected(toppings[5]),
                        onPressed: () {
                          setState(() {
                            if (selected(toppings[5])) {
                              removeToppings(toppings[5]);
                            } else {
                              addToppings(toppings[5]);
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),

              // quantity
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                height: 80,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    QuantityButton(
                      sign: const Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                      onPressed: () => _decrementCounter(),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: double.infinity,
                      width: 70,
                      child: Text(
                        '$_counter',
                        style:
                            TextStyle(fontSize: 20, color: Colors.brown[500]),
                      ),
                    ),
                    QuantityButton(
                      sign: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () => _incrementCounter(),
                    ),
                  ],
                ),
              ),

              // add to cart
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.brown[500],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: MaterialButton(
                  onPressed: () {
                    addToCart(widget.drink, _counter.toString());
                    Navigator.pop(context, '/shoppage');
                  },
                  child: const Text(
                    "Add To Cart",
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
