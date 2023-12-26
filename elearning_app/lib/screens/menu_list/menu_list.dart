// ignore_for_file: must_be_immutable

import 'package:elearning_app/routers/routers.dart';
import 'package:elearning_app/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:elearning_app/screens/menu_list/widgets/menu_tile.dart';
import 'package:elearning_app/screens/menu_list/widgets/user_tile.dart';
import 'package:elearning_app/widgets/group_fixed_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MenuList extends StatefulWidget {
  MenuList({super.key});

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  TextEditingController courseC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        body: Stack(children: [
          Positioned(bottom: 20, right: 20, child: GroupFixedButton()),
          ListView(
            children: [
              UserTile(),
              MenuTile(
                  title: AppLocalizations.of(context)!.recurring_schedule,
                  icon: const Icon(Icons.calendar_month),
                  route: AppRouter.myschedule),
              MenuTile(
                  title: AppLocalizations.of(context)!.tutor,
                  icon: const Icon(Icons.calendar_month),
                  route: AppRouter.findingTutor),
              MenuTile(
                  title: AppLocalizations.of(context)!.schedule,
                  icon: const Icon(Icons.calendar_month),
                  route: AppRouter.myschedule),
              MenuTile(
                  title: "Lịch sử",
                  icon: const Icon(Icons.history),
                  route: AppRouter.myHistory),
              MenuTile(
                title: AppLocalizations.of(context)!.course,
                icon: const Icon(Icons.school),
                route: AppRouter.courses,
              ),
              MenuTile(
                  title: AppLocalizations.of(context)!.my_courses,
                  icon: const Icon(Icons.book),
                  route: AppRouter.myCourses),
              MenuTile(
                  title: AppLocalizations.of(context)!.tutor_register,
                  icon: const Icon(Icons.calendar_month),
                  route: AppRouter.becomeTutor),
              MenuTile(
                  title: "Đăng xuất",
                  icon: const Icon(Icons.logout_outlined),
                  route: AppRouter.logIn),
            ],
          )
        ]));
  }
}
