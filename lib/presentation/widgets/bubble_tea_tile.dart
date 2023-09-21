import 'package:bubbleteaapp/data/model/drink.dart';
import 'package:bubbleteaapp/presentation/pages/drink_page.dart';
import 'package:flutter/material.dart';

class DrinkTile extends StatelessWidget {
  final Drink drink;
  final Widget icon;
  final void Function()? onPressed;
  const DrinkTile({
    super.key,
    required this.drink,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.brown[100], borderRadius: BorderRadius.circular(15)),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DrinkDetailPage(drink: drink),
            ),
          );
        },
        child: ListTile(
          title: Text(drink.name),
          subtitle: Text(drink.price),
          leading: Image.asset(drink.imagePath),
          trailing: IconButton(
            icon: icon,
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
