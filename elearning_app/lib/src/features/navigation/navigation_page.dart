import 'package:flutter/material.dart';
import 'package:elearning_app/src/features/courses/courses_page.dart';
import 'package:elearning_app/src/features/homepage/views/homepage.dart';
import 'package:elearning_app/src/features/schedules/schedule_page.dart';
import 'package:elearning_app/src/features/settings/settings_page.dart';
import 'package:elearning_app/src/features/tutor/search_tutor/views/tutor_search_page.dart';
import 'package:elearning_app/src/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  List<Widget> pages = [
    const HomePage(),
    const TutorSearchPage(),
    const SchedulePage(),
    const CoursesPage(),
  ];
  List<String> pagesTitles = [
    'Home',
    'Tutors',
    'Schedule',
    'Courses',
  ];
  int _chosenPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          pagesTitles[_chosenPageIndex],
          style: Theme.of(context).textTheme.headline2,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Scaffold(
                              appBar: AppBar(
                                  elevation: 0,
                                  backgroundColor: Colors.white,
                                  title: Text(
                                    "Setting",
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  )),
                              body: const SettingsPage())));
                },
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: const BoxDecoration(
                        border: Border.fromBorderSide(
                            BorderSide(color: Colors.black, width: 1)),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Row(children: [
                      Text(authProvider.currentUser.name ?? '',
                          style: TextStyle(
                              fontSize: 14,
                              // fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      Container(
                        width: 40,
                        height: 40,
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          authProvider.currentUser.avatar ?? '',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.person_rounded),
                        ),
                      ),
                    ]))),
          )
        ],
      ),
      body: pages[_chosenPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 14,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            _chosenPageIndex = value;
          });
        },
        elevation: 20,
        currentIndex: _chosenPageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Tutors'),
          BottomNavigationBarItem(
              icon: Icon(Icons.schedule_outlined), label: 'Schedule'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Courses'),
        ],
      ),
    );
  }
}
