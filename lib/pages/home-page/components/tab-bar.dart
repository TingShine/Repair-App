import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeTabBar extends StatelessWidget {
  const HomeTabBar(
      {required this.tabs,
      required this.index,
      required this.onTabChange,
      super.key});

  final List<String> tabs;
  final int index;
  final Function(int index) onTabChange;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: tabs
            .asMap()
            .entries
            .map((entry) => GestureDetector(
                  onTap: () {
                    onTabChange(entry.key);
                  },
                  child: Text(
                    entry.value,
                    style: GoogleFonts.kanit(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: entry.key == index
                            ? const Color.fromRGBO(250, 255, 255, 1)
                            : const Color.fromRGBO(166, 204, 253, 1)),
                  ),
                ))
            .toList());
  }
}
