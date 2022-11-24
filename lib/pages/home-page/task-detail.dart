import 'package:avatar_stack/avatar_stack.dart';
import 'package:avatar_stack/positions.dart';
import 'package:flutter/material.dart';
import 'package:fsuper/fsuper.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repair_app/pages/home-page/components/timeline-steps.dart';
import 'package:timelines/timelines.dart';

class TaskDetail extends StatefulWidget {
  const TaskDetail({super.key});

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  int _processIndex = 0;
  List<String> _processes = ['等待接单', '维修中', '维修结束'];

  void jumpNextStep() {
    setState(() {
      _processIndex++;
    });
  }

  closeButton() {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: const Icon(
        Icons.close,
        size: 25,
      ),
    );
  }

  customTitle(String text,
      {double paddingTop = 20, double paddingBottom = 20}) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop, bottom: paddingBottom),
      child: FSuper(
        child1: Text(
          text,
          style: GoogleFonts.sourceSansPro(
              color: const Color.fromARGB(255, 244, 236, 236),
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
        width: 130,
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        backgroundColor: Colors.blue[300],
        corner: const FCorner(
            leftTopCorner: 20, leftBottomCorner: 20, rightTopCorner: 20),
        cornerStyle: FCornerStyle.round,
      ),
    );
  }

  customDescription(String text, Color color) {
    return FSuper(
      maxWidth: MediaQuery.of(context).size.width * .8,
      textAlign: TextAlign.left,
      text: text,
      padding: const EdgeInsets.only(left: 12, right: 12, top: 15, bottom: 15),
      backgroundColor: color,
      corner: FCorner.all(6),
      child1: Transform.rotate(
        angle: 3.14 / 4,
        child: FSuper(
          width: 10,
          height: 10,
          backgroundColor: color,
          corner: FCorner.all(1.5),
        ),
      ),
      child1Alignment: Alignment.bottomLeft,
      child1Margin: const EdgeInsets.only(left: -4, bottom: 20),
      shadowColor: color,
      shadowBlur: 5,
    );
  }

  String getAvatarUrl(int n) {
    // final url = 'https://i.pravatar.cc/150?img=$n';
    final url = 'https://robohash.org/$n?bgset=bg1';
    return url;
  }

  final settings = RestrictedPositions(
    maxCoverage: 0.3,
    minCoverage: 0.1,
    laying: StackLaying.first,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(243, 243, 243, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            closeButton(),
            const SizedBox(
              height: 30,
            ),
            Text(
              '电脑蓝屏',
              textAlign: TextAlign.left,
              style:
                  GoogleFonts.cabin(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            customTitle(
              '联系方式',
            ),
            customDescription('text', Colors.white),
            customTitle('详细描述'),
            customDescription("C盘满了，但我只有一个盘，之前删了点东西但内存没变多，删了虚拟机也没什么作用",
                const Color(0xffa5ed7e)),
            customTitle('时间轴', paddingBottom: 0),
            Container(
              height: 100,
              width: 500,
              child: ProcessTimelinePage(
                processIndex: _processIndex,
                processes: _processes,
              ),
            ),
            customTitle('接单队员'),
            AvatarStack(
              height: 50,
              settings: settings,
              avatars: [
                for (var n = 0; n < 3; n++) NetworkImage(getAvatarUrl(n))
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          jumpNextStep();
        },
        child: Text('接单'),
      ),
    );
  }
}
