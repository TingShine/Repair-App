import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repair_app/components/search-bar/index.dart';
import 'package:repair_app/components/top-bar/index.dart';
import 'package:repair_app/pages/home-page/components/task-list.dart';
import 'package:repair_app/pages/home-page/task-detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopBar(),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Repair your PC',
              textAlign: TextAlign.left,
              style:
                  GoogleFonts.cabin(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const SearchBar(),
          const SizedBox(
            height: 30,
          ),
          const Expanded(child: TaskList())
        ],
      ),
    );
  }
}
