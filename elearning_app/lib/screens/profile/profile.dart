import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:elearning_app/screens/profile/widgets/avatar.dart';
import 'package:elearning_app/screens/profile/widgets/birthday.dart';
import 'package:elearning_app/screens/profile/widgets/button.dart';
import 'package:elearning_app/screens/profile/widgets/textfield.dart';
import 'package:elearning_app/screens/profile/widgets/want_to_learn.dart';
import 'package:elearning_app/widgets/drop_down_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? avatar;
  String? name;
  String? email;
  String? phone;
  String? country;
  String? level;
  DateTime? birthday;
  String? studySchedule;
  bool isPhoneActivated = false;

  bool isLoading = true;

  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("profile")),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              physics: const BouncingScrollPhysics(),
              children: [
                AvatarProfile(
                  imagePath: avatar ?? '',
                  isEdit: true,
                  onClicked: () {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: "Full Name",
                  text: name,
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: "email",
                  text: email,
                  enabled: false,
                ),
                const SizedBox(height: 24),
                const Text(
                  "country",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 8),
                // CustomDropdownButton2(
                //   hint: "selectCountry",
                //   value: country,
                //   dropdownItems: .values.toList(),
                //   onChanged: (value) {
                //     setState(() {
                //       country = value;
                //     });
                //   },
                // ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: "phone",
                  text: phone,
                  enabled: false,
                ),
                !isPhoneActivated
                    ? Container()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(3),
                            margin: const EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.green, width: 1),
                                color: Colors.green[50],
                                borderRadius: BorderRadius.circular(4)),
                            child: const Text(
                              "verified",
                              style:
                                  TextStyle(fontSize: 13, color: Colors.green),
                            ),
                          ),
                        ],
                      ),
                const SizedBox(height: 24),
                Text(
                  "birthday",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 8),
                BirthdayEdition(
                    setBirthday: (({DateTime? birthday}) => setState(
                          () => this.birthday = birthday,
                        )),
                    birthday: birthday),
                const SizedBox(height: 24),
                Text(
                  "level",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 8),

                // WantToLearn(
                //     userTopics: topics,
                //     editTopics: editTopics,
                //     userTestPreparations: preparations,
                //     editTestPreparations: editTests),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: "schedule",
                  hintText: "studySchedule",
                  maxLines: 5,
                  text: studySchedule,
                  onChanged: (value) {
                    setState(() {
                      studySchedule = value;
                    });
                  },
                ),
                const SizedBox(height: 24),
                ButtonWidget(
                  text: "save",
                  onClicked: () async {
                    if (name == null || name == '') {
                      var snackBar = const SnackBar(
                        content: Text("errEnterName"),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else if (country == null || country == '') {
                      var snackBar = const SnackBar(
                        content: Text("errCountry"),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else if (birthday == null ||
                        birthday!.millisecondsSinceEpoch >
                            DateTime.now().millisecondsSinceEpoch) {
                      var snackBar = const SnackBar(
                        content: Text("errBirthday"),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else if (level == null || level == '') {
                      var snackBar = const SnackBar(
                        content: Text("errLevel"),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      String bdArg =
                          "${birthday!.year.toString()}-${birthday!.month.toString().padLeft(2, "0")}-${birthday!.day..toString().padLeft(2, "0")}";
                    }
                  },
                ),
              ],
            ),
    );
  }
}
