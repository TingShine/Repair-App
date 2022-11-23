import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repair_app/pages/home-page/task-detail.dart';
import 'package:repair_app/utils/enum/status.dart';

class IconStatus {
  const IconStatus({
    required this.color,
    required this.bgColor,
    required this.icon,
  });

  final Color color;
  final Color bgColor;
  final IconData icon;
}

class TaskItem extends StatelessWidget {
  TaskItem(
      {required this.status, this.name, this.phone, this.address, super.key});

  final StatusEnum status;
  String? name;
  String? phone;
  String? address;

  IconStatus getIconStatus() {
    IconStatus iconColor = const IconStatus(
        icon: Icons.watch_later_outlined,
        color: Color.fromRGBO(224, 245, 222, 1),
        bgColor: Color.fromRGBO(124, 207, 98, 1));

    switch (status) {
      case StatusEnum.done:
        iconColor = const IconStatus(
            icon: Icons.done_outline,
            color: Color.fromRGBO(224, 245, 222, 1),
            bgColor: Color.fromRGBO(124, 207, 98, 1));
        break;

      case StatusEnum.doing:
        iconColor = const IconStatus(
            icon: Icons.watch_later_outlined,
            color: Color.fromRGBO(236, 177, 56, 1),
            bgColor: Color.fromRGBO(252, 245, 197, 1));

        break;

      case StatusEnum.todo:
        iconColor = const IconStatus(
            icon: Icons.build,
            color: Color.fromRGBO(236, 177, 56, 1),
            bgColor: Color.fromRGBO(252, 245, 197, 1));

        break;
    }

    return iconColor;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 左边图标
                Container(
                    decoration: BoxDecoration(
                        color: getIconStatus().bgColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                        getIconStatus().icon,
                        color: getIconStatus().color,
                        size: 20,
                      ),
                    )),

                const SizedBox(width: 10),

                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '电脑开机蓝屏',
                      maxLines: 1,
                      style: GoogleFonts.firaSans(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      '${name ?? '未知'} / ${phone ?? '未知'} / ${address ?? '未知'}',
                      style: GoogleFonts.firaSans(
                          fontSize: 11,
                          color: const Color.fromRGBO(157, 157, 157, 1)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                )),

                const SizedBox(width: 10),

                OpenContainer(
                    closedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    openShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    transitionDuration: const Duration(milliseconds: 600),
                    closedBuilder: (BuildContext context, VoidCallback action) {
                      return GestureDetector(
                        child: Container(
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(233, 241, 248, 1),
                                borderRadius: BorderRadius.circular(12)),
                            child: const Padding(
                              padding: EdgeInsets.all(6),
                              child: Icon(
                                Icons.more_vert,
                                color: Color.fromRGBO(133, 155, 200, 1),
                                size: 18,
                              ),
                            )),
                      );
                    },
                    openBuilder: (BuildContext context, VoidCallback action) {
                      return TaskDetail();
                    }),
                // 右边图标
              ],
            ),
          ),
        ));
  }
}
