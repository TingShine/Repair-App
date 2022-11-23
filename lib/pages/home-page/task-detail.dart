import 'package:avatar_stack/avatar_stack.dart';
import 'package:avatar_stack/positions.dart';
import 'package:flutter/material.dart';
import 'package:fsuper/fsuper.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repair_app/pages/home-page/components/timeline-steps.dart';
import 'package:timelines/timelines.dart';

const kTileHeight = 50.0;

class TaskDetail extends StatefulWidget {
  const TaskDetail({super.key});

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
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
              child: ProcessTimelinePage(),
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
          Get.back();
        },
      ),
    );
  }
}

class _Timeline1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = _TimelineStatus.values;
    return Flexible(
      child: Timeline.tileBuilder(
        theme: TimelineThemeData(
          nodePosition: 0,
          connectorTheme: const ConnectorThemeData(
            thickness: 3.0,
            color: Color(0xffd3d3d3),
          ),
          indicatorTheme: const IndicatorThemeData(
            size: 15.0,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        builder: TimelineTileBuilder.connected(
          contentsBuilder: (_, __) => _EmptyContents(),
          connectorBuilder: (_, index, __) {
            if (index == 0) {
              return const SolidLineConnector(color: Color(0xff6ad192));
            } else {
              return const SolidLineConnector();
            }
          },
          indicatorBuilder: (_, index) {
            switch (data[index]) {
              case _TimelineStatus.done:
                return const DotIndicator(
                  color: Color(0xff6ad192),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 10.0,
                  ),
                );
              case _TimelineStatus.sync:
                return const DotIndicator(
                  color: Color(0xff193fcc),
                  child: Icon(
                    Icons.sync,
                    size: 10.0,
                    color: Colors.white,
                  ),
                );
              case _TimelineStatus.inProgress:
                return const OutlinedDotIndicator(
                  color: Color(0xffa7842a),
                  borderWidth: 2.0,
                  backgroundColor: Color(0xffebcb62),
                );
              case _TimelineStatus.todo:
              default:
                return const OutlinedDotIndicator(
                  color: Color(0xffbabdc0),
                  backgroundColor: Color(0xffe6e7e9),
                );
            }
          },
          itemExtentBuilder: (_, __) => kTileHeight,
          itemCount: data.length,
        ),
      ),
    );
  }
}

class _EmptyContents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0),
      height: 10.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        color: const Color(0xffe6e7e9),
      ),
    );
  }
}

enum _TimelineStatus {
  done,
  sync,
  inProgress,
  todo,
}

extension on _TimelineStatus {
  bool get isInProgress => this == _TimelineStatus.inProgress;
}
