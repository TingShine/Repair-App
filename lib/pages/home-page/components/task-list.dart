import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repair_app/pages/home-page/components/task-item.dart';
import 'package:repair_app/pages/home-page/components/tab-bar.dart';
import 'package:repair_app/utils/enum/status.dart';

import '../task-detail.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<String> tabs = ['Todo', 'Doing', 'All'];
  int _currentIndex = 0;
  ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  onTabChange(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
                color: Color.fromRGBO(75, 132, 250, 1),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30))),
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
              child: Column(
                children: [
                  HomeTabBar(
                      tabs: tabs,
                      index: _currentIndex,
                      onTabChange: onTabChange),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: ListView(
                            children: [
                              TaskItem(
                                status: StatusEnum.todo,
                                name: '李*龙',
                                phone: '155****9432',
                                address: '13栋404',
                              ),
                              TaskItem(
                                status: StatusEnum.doing,
                                name: '林*玉',
                                phone: '155***8922',
                                address: '3栋404',
                              ),
                              TaskItem(
                                status: StatusEnum.done,
                                name: '王*磊',
                                phone: '155****9092',
                                address: '12栋404',
                              ),
                            ],
                          )))
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _OpenContainerWrapper extends StatelessWidget {
  const _OpenContainerWrapper({
    required this.closedBuilder,
    required this.transitionType,
    // required this.onClosed,
  });

  final CloseContainerBuilder closedBuilder;
  final ContainerTransitionType transitionType;
  // final ClosedCallback<bool?> onClosed;

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionType: transitionType,
      openBuilder: (BuildContext context, VoidCallback _) {
        return const TaskDetail();
      },
      // onClosed: onClosed,
      tappable: false,
      closedBuilder: closedBuilder,
    );
  }
}
