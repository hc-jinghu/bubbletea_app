import 'package:bubbleteaapp/config/theme.dart';
import 'package:flutter/material.dart';

class CustomRadioButtonGroup<T> extends StatelessWidget {
  final T value;
  final T selectedValue;
  final String title;
  final ValueChanged<T?> onPressed;
  const CustomRadioButtonGroup({
    super.key,
    required this.value,
    required this.selectedValue,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return _customRadioButton;
  }

  Widget get _customRadioButton {
    final isSelected = value == selectedValue;
    return Container(
      height: 55,
      width: 65,
      decoration: BoxDecoration(
        color: isSelected ? selectedColor : unselectedColor,
        shape: BoxShape.circle,
      ),
      child: TextButton(
        onPressed: () => onPressed(value),
        child: Text(
          title,
          style: TextStyle(color: Colors.grey[100]),
        ),
      ),
    );
  }
}
