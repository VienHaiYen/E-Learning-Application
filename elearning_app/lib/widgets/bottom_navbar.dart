import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar(
      {Key? key, required this.selectedIndex, required this.onClicked})
      : super(key: key);

  final int selectedIndex;
  final ValueChanged<int> onClicked;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(48), topLeft: Radius.circular(48)),
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 16)
          ]),
      child: Material(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        elevation: 0,
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.pink,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.co_present_outlined),
                backgroundColor: Colors.black26,
                label: 'Tutor'),
            BottomNavigationBarItem(
                icon: Icon(Icons.book_outlined),
                backgroundColor: Colors.black26,
                label: 'Courses'),
            BottomNavigationBarItem(
                icon: Icon(Icons.schedule_outlined),
                backgroundColor: Colors.black26,
                label: 'Calendar'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                backgroundColor: Colors.black26,
                label: 'Profile'),
          ],
          currentIndex: selectedIndex,
          onTap: onClicked,
        ),
      ),
    );
  }
}
