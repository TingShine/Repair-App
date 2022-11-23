import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        Expanded(
            child: TextField(
                enabled: true,
                style: const TextStyle(fontSize: 15),
                decoration: InputDecoration(
                  hintText: 'Search what you want',
                  hintStyle: GoogleFonts.sourceSansPro(
                      fontSize: 16,
                      color: const Color.fromRGBO(166, 181, 196, 1),
                      fontWeight: FontWeight.bold),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: const Color.fromRGBO(233, 241, 248, 1),
                ))),
        const SizedBox(
          width: 15,
        ),
        Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(124, 207, 96, 1),
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            boxShadow: [
              //阴影效果
              BoxShadow(
                offset: Offset(3, 4), //阴影在X轴和Y轴上的偏移
                color: Colors.grey, //阴影颜色
                blurRadius: 3.0, //阴影程度
                spreadRadius: 1, //阴影扩散的程度 取值可以正数,也可以是负数
              ),
            ],
          ),
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        )
      ]),
    );
  }
}
