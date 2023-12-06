// ignore_for_file: must_be_immutable

import 'package:elearning_app/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:elearning_app/screens/menu_list/widgets/menu_tile.dart';
import 'package:elearning_app/screens/menu_list/widgets/tutor_tile.dart';
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
        TutorTile(),
        MenuTile(
            title: "Lịch học định kì", icon: const Icon(Icons.calendar_month)),
        MenuTile(title: "Gia sư", icon: const Icon(Icons.calendar_month)),
        MenuTile(title: "Lịch học", icon: const Icon(Icons.calendar_view_week)),
        MenuTile(title: "Lịch sử", icon: const Icon(Icons.history)),
        MenuTile(title: "Khóa học", icon: const Icon(Icons.school)),
        MenuTile(title: "Khóa học của tôi", icon: const Icon(Icons.book)),
        MenuTile(
            title: "Đăng ký làm gia sư",
            icon: const Icon(Icons.calendar_month)),
        MenuTile(title: "Đăng xuất", icon: const Icon(Icons.logout_outlined)),
      ],
    );
  }
}
