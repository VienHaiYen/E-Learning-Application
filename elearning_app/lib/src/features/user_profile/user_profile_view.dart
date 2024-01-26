import 'package:elearning_app/src/widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:elearning_app/src/constants/country_list.dart';
import 'package:elearning_app/src/constants/user_level.dart';
import 'package:elearning_app/src/models/user/learn_topic.dart';
import 'package:elearning_app/src/models/user/test_preparation.dart';
import 'package:elearning_app/src/models/user/user.dart';
import 'package:elearning_app/src/providers/auth_provider.dart';
import 'package:elearning_app/src/services/user_service.dart';
import 'package:elearning_app/src/widgets/select_date.dart';
import 'package:provider/provider.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({Key? key}) : super(key: key);

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  User? user;

  final _nameController = TextEditingController();
  final _studyScheduleController = TextEditingController();
  String emailAddress = '';
  String phoneNumber = '';
  String birthday = '';
  String country = '';
  String level = '';
  List<LearnTopic> chosenTopics = [];
  List<TestPreparation> chosenTestPreparations = [];

  bool _isInitiated = false;
  bool _isLoading = true;

  void _initiateUserProfile(AuthProvider authProvider) async {
    final String token = authProvider.token?.access?.token as String;
    final result = await UserService.getUserInfo(token);

    _nameController.text = result?.name ?? 'name';
    emailAddress = result?.email ?? 'email';
    phoneNumber = result?.phone ?? 'phone number';
    birthday = result?.birthday ?? 'yyyy-MM-dd';
    country = result?.country ?? 'US';
    level = result?.level ?? 'BEGINNER';
    _studyScheduleController.text = result?.studySchedule ?? '';

    chosenTopics = result?.learnTopics ?? [];
    chosenTestPreparations = result?.testPreparations ?? [];

    setState(() {
      user = result;
      _isInitiated = true;
      _isLoading = false;
    });
  }

  Future<void> _updateUserProfile(AuthProvider authProvider) async {
    final String token = authProvider.token?.access?.token as String;
    final learnTopics =
        chosenTopics.map((topic) => topic.id.toString()).toList();
    final testPreparations =
        chosenTestPreparations.map((test) => test.id.toString()).toList();

    final result = await UserService.updateInfo(
      token: token,
      name: _nameController.text,
      country: country,
      birthday: birthday,
      level: level,
      learnTopics: learnTopics,
      testPreparations: testPreparations,
      studySchedule: _studyScheduleController.text,
    );

    setState(() {
      _isLoading = true;
      _isInitiated = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _isInitiated = false;
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    if (!_isInitiated) {
      _initiateUserProfile(authProvider);
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.blue[600],
        ),
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Container(
                          width: 108,
                          height: 108,
                          clipBehavior: Clip.hardEdge,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Avatar(
                              url: authProvider.currentUser.avatar ?? '',
                              height: 100,
                              width: 100),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[300],
                              radius: 18,
                              child: const Icon(
                                Icons.camera_alt,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[900],
                    ),
                  ),
                  const SizedBox(height: 4),
                  TextField(
                    controller: _nameController,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Email Address',
                    style: TextStyle(fontSize: 16, color: Colors.grey[900]),
                  ),
                  const SizedBox(height: 4),
                  Text(emailAddress),
                  const SizedBox(height: 16),
                  Text(
                    'Phone Number',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[900],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(phoneNumber),
                  const SizedBox(height: 16),
                  Text(
                    'Country',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[900],
                    ),
                  ),
                  const SizedBox(height: 4),
                  DropdownButtonFormField(
                    icon: const Icon(Icons.arrow_drop_down),
                    menuMaxHeight: 300,
                    isExpanded: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    value: countryList[country],
                    items: countryList.values
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e, overflow: TextOverflow.ellipsis),
                            ))
                        .toList(),
                    onChanged: (value) {
                      final chosenCountry = countryList.keys.firstWhere(
                        (element) => countryList[element] == value,
                        orElse: () => 'US',
                      );
                      setState(() {
                        country = chosenCountry;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Birthday',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[900],
                    ),
                  ),
                  const SizedBox(height: 4),
                  SelectDate(
                    initialValue: birthday,
                    onChanged: (newValue) {
                      setState(() {
                        birthday = newValue;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Level',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[900],
                    ),
                  ),
                  const SizedBox(height: 4),
                  DropdownButtonFormField(
                    isExpanded: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    value: userLevels[level],
                    items: userLevels.values
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e, overflow: TextOverflow.ellipsis),
                            ))
                        .toList(),
                    onChanged: (value) {
                      final chosenLevel = userLevels.keys.firstWhere(
                        (element) => userLevels[element] == value,
                        orElse: () => 'BEGINNER',
                      );
                      setState(() {
                        level = chosenLevel;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Topic',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[900],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: List<Widget>.generate(
                      authProvider.learnTopics.length,
                      (index) => ChoiceChip(
                        backgroundColor: Colors.grey[100],
                        selectedColor: Color.fromARGB(255, 180, 204, 214),
                        selected: chosenTopics
                            .map((e) => e.id)
                            .toList()
                            .contains(authProvider.learnTopics[index].id),
                        label: Text(
                          authProvider.learnTopics[index].name ?? '',
                          style: TextStyle(
                            fontSize: 14,
                            color: chosenTopics
                                    .map((e) => e.id)
                                    .toList()
                                    .contains(
                                        authProvider.learnTopics[index].id)
                                ? Colors.blue[700]
                                : Colors.black54,
                          ),
                        ),
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              chosenTopics.add(authProvider.learnTopics[index]);
                            } else {
                              chosenTopics.removeWhere(
                                (element) =>
                                    element.id ==
                                    authProvider.learnTopics[index].id,
                              );
                            }
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Test Preparation',
                    style: TextStyle(fontSize: 16, color: Colors.grey[900]),
                  ),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List<Widget>.generate(
                      authProvider.testPreparations.length,
                      (index) => ChoiceChip(
                        backgroundColor: Colors.grey[100],
                        selectedColor: Colors.lightBlue[100],
                        selected: chosenTestPreparations
                            .map((e) => e.id)
                            .toList()
                            .contains(authProvider.testPreparations[index].id),
                        label: Text(
                          authProvider.testPreparations[index].name ?? '',
                          style: TextStyle(
                            fontSize: 14,
                            color: chosenTestPreparations
                                    .map((e) => e.id)
                                    .toList()
                                    .contains(
                                        authProvider.testPreparations[index].id)
                                ? Colors.blue[700]
                                : Colors.black54,
                          ),
                        ),
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              chosenTestPreparations
                                  .add(authProvider.testPreparations[index]);
                            } else {
                              chosenTestPreparations.removeWhere(
                                (element) =>
                                    element.id ==
                                    authProvider.testPreparations[index].id,
                              );
                            }
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Study Schedule',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[900],
                    ),
                  ),
                  const SizedBox(height: 4),
                  TextField(
                    controller: _studyScheduleController,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Container(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        _updateUserProfile(authProvider);
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        'Save Changes',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
