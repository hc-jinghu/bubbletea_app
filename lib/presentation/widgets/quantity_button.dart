import 'package:flutter/material.dart';

class QuantityButton extends StatelessWidget {
  final Widget sign;
  final void Function()? onPressed;
  const QuantityButton(
      {super.key, required this.sign, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.brown[500],
        borderRadius: BorderRadius.circular(15),
      ),
      child: MaterialButton(
        padding: const EdgeInsets.only(right: 0.3),
        onPressed: onPressed,
        child: sign,
      ),
    );
  }
}
