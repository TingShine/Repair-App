import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  customButton(IconData icon, VoidCallback onPress) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: const BoxDecoration(
            color: Color.fromRGBO(233, 241, 248, 1),
            borderRadius: BorderRadius.all(Radius.circular(12.0))),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(
            icon,
            color: const Color.fromRGBO(133, 155, 200, 1),
          ),
        ),
      ),
    );
  }

  void _onPressMenu() {
    print('点击');
  }

  void _onPressNotification() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 45, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          customButton(Icons.menu, _onPressMenu),
          customButton(Icons.notifications, _onPressNotification)
        ],
      ),
    );
  }
}
