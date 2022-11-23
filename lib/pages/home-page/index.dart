import 'package:flutter/material.dart';
import 'package:repair_app/components/bottom-bar/index.dart';
import 'package:repair_app/pages/home-page/home.dart';
import 'package:repair_app/pages/home-page/second.dart';

class PrimaryPage extends StatefulWidget {
  const PrimaryPage({super.key});

  @override
  State<PrimaryPage> createState() => _PrimaryPageState();
}

class _PrimaryPageState extends State<PrimaryPage> {
  int _currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: _currentIndex);
  }

  void onPageChange(int index) {
    setState(() {
      _currentIndex = index;
      _controller.jumpToPage(_currentIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(
        index: _currentIndex,
        onTabChange: onPageChange,
      ),
      body: PageView(
        controller: _controller,
        onPageChanged: onPageChange,
        children: [HomePage(), SecondPage()],
      ),
    );
  }
}
