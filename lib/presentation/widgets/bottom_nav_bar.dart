import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:badges/badges.dart' as badger;

// ignore: must_be_immutable
class BottomNavBar extends StatefulWidget {
  final void Function(int)? onTabChange;
  int badge = 0;

  BottomNavBar({
    super.key,
    required this.onTabChange,
    required this.badge,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      child: GNav(
        onTabChange: (value) => widget.onTabChange!(value),
        mainAxisAlignment: MainAxisAlignment.center,
        tabBackgroundColor: const Color.fromARGB(255, 238, 238, 238),
        tabActiveBorder: Border.all(color: Colors.brown, width: 2),
        tabBorderRadius: 15,
        tabs: [
          const GButton(
            icon: Icons.home_outlined,
            text: "Shop",
          ),
          GButton(
            icon: Icons.shopping_bag_outlined,
            text: "Cart",
            leading: widget.badge == 0
                ? null
                : badger.Badge(
                    position: badger.BadgePosition.topEnd(top: -12, end: -12),
                    badgeContent: Text(
                      widget.badge.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    child: const Icon(Icons.shopping_bag_outlined),
                  ),
          ),
        ],
      ),
    );
  }
}
