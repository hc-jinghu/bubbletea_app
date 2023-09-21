import 'package:bubbleteaapp/config/theme.dart';
import 'package:flutter/material.dart';

class ToppingsTile extends StatefulWidget {
  final String title;
  final bool isSelected;
  final VoidCallback? onPressed;
  const ToppingsTile({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  State<ToppingsTile> createState() => _ToppingsTileState();
}

class _ToppingsTileState extends State<ToppingsTile> {
  late final MaterialStatesController statesController;

  @override
  void initState() {
    super.initState();
    statesController = MaterialStatesController(
        <MaterialState>{if (widget.isSelected) MaterialState.selected});
  }

  @override
  void didUpdateWidget(ToppingsTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSelected != oldWidget.isSelected) {
      statesController.update(MaterialState.selected, widget.isSelected);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
          minWidth: 80, maxWidth: 150, minHeight: 30, maxHeight: 60),
      child: Container(
        decoration: BoxDecoration(
          color: widget.isSelected ? selectedColor : unselectedColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextButton(
            statesController: statesController,
            onPressed: widget.onPressed,
            child: Text(
              widget.title,
              style: const TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}
