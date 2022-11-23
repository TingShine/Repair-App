import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({required this.index, required this.onTabChange, super.key});

  final int index;
  final Function onTabChange;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      currentIndex: widget.index,
      onTap: (i) => widget.onTabChange(i),
      items: [
        /// Home
        SalomonBottomBarItem(
          icon: const Icon(Icons.home),
          title: const Text("Home"),
          selectedColor: Color.fromARGB(255, 115, 137, 181),
        ),

        /// Likes
        SalomonBottomBarItem(
          icon: const Icon(Icons.favorite_border),
          title: const Text("Likes"),
          selectedColor: Colors.pink,
        ),
      ],
    );
  }
}
