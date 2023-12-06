// ignore_for_file: must_be_immutable

import 'package:elearning_app/routers/routers.dart';
import 'package:elearning_app/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:elearning_app/screens/menu_list/widgets/menu_tile.dart';
import 'package:elearning_app/screens/menu_list/widgets/user_tile.dart';
import 'package:elearning_app/widgets/group_fixed_button.dart';

class MenuList extends StatelessWidget {
  MenuList({super.key});

  TextEditingController courseC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: MyAppBar(),
        body: Stack(children: [
          // TutorTile(),
          MenuListBody(),
          Positioned(bottom: 20, right: 20, child: GroupFixedButton())
        ]));
  }
}

class MenuListBody extends StatelessWidget {
  const MenuListBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Set fited icon
    return ListView(
      children: [
        UserTile(),
        MenuTile(
            title: "Lịch học định kì",
            icon: const Icon(Icons.calendar_month),
            route: AppRouter.myCalendar),
        MenuTile(
            title: "Gia sư",
            icon: const Icon(Icons.calendar_month),
            route: AppRouter.findingTutor),
        MenuTile(
            title: "Lịch học",
            icon: const Icon(Icons.calendar_view_week),
            route: AppRouter.myCalendar),
        MenuTile(
            title: "Lịch sử",
            icon: const Icon(Icons.history),
            route: AppRouter.myHistory),
        MenuTile(
          title: "Khóa học",
          icon: const Icon(Icons.school),
          route: AppRouter.courses,
        ),
        MenuTile(
            title: "Khóa học của tôi",
            icon: const Icon(Icons.book),
            route: AppRouter.myCourses),
        MenuTile(
            title: "Đăng ký làm gia sư",
            icon: const Icon(Icons.calendar_month),
            route: AppRouter.becomeTutor),
        MenuTile(
            title: "Đăng xuất",
            icon: const Icon(Icons.logout_outlined),
            route: AppRouter.logIn),
      ],
    );
  }
}
