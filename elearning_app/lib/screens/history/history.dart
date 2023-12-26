// ignore_for_file: must_be_immutable
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:elearning_app/widgets/my_app_bar.dart';
import 'package:elearning_app/widgets/group_fixed_button.dart';
import 'package:elearning_app/provider/auth_provider.dart';
import 'package:elearning_app/services/user_service.dart';
import 'package:elearning_app/models/schedule/booking_info.dart';
import './widgets/history_item.dart';
import './widgets/history_card.dart';

const itemsPerPage = [
  5,
  10,
  15,
  20,
  25,
  50,
  100,
];

class HistoryView extends StatefulWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  List<BookingInfo> history = [];

  int _page = 1;
  int _perPage = itemsPerPage.first;
  int _count = 0;
  bool _isLoading = true;

  Future<void> _fetchHistory(String token) async {
    final result = await UserService.getHistory(
      token: token,
      page: _page,
      perPage: _perPage,
    );

    setState(() {
      history = result['classes'];
      _count = result['count'];
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    if (_isLoading && authProvider.token != null) {
      final String accessToken = authProvider.token?.access?.token as String;
      _fetchHistory(accessToken);
    }

    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : history.isEmpty
            ? const Center(
                child: Text('You have not booked any class'),
              )
            : SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'You have booked $_count classes',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Expanded(
                          flex: 20,
                          child: Text(
                            'Items per page',
                            textAlign: TextAlign.right,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 7,
                          child: DropdownButtonFormField<int>(
                            value: _perPage,
                            items: itemsPerPage
                                .map((itemPerPage) => DropdownMenuItem<int>(
                                    value: itemPerPage,
                                    child: Text('$itemPerPage')))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _perPage = value!;
                                _page = 1;
                                _isLoading = true;
                              });
                            },
                            icon: const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Colors.blue,
                            ),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 16),
                              filled: true,
                              fillColor: Colors.blue[50],
                              enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24)),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24)),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    ...List<Widget>.generate(
                      history.length,
                      (index) => HistoryCard(bookingInfo: history[index]),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        IconButton(
                          style: IconButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor:
                                _page == 1 ? Colors.grey : Colors.blue[300],
                          ),
                          onPressed: _page == 1
                              ? null
                              : () {
                                  setState(() {
                                    _isLoading = true;
                                    _page--;
                                  });
                                },
                          icon: const Icon(
                            Icons.navigate_before_rounded,
                            size: 28,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Page $_page/${(_count / _perPage).ceil()}',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        IconButton(
                          style: IconButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: _page == _count
                                ? Colors.grey
                                : Colors.blue[300],
                          ),
                          onPressed: _page == (_count / _perPage).ceil()
                              ? null
                              : () {
                                  setState(() {
                                    _isLoading = true;
                                    _page++;
                                  });
                                },
                          icon: const Icon(
                            Icons.navigate_next_rounded,
                            size: 28,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
  }
}
////////////////////////////////////

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        body: Stack(children: [
          HistoryBody(),
          const Positioned(bottom: 20, right: 20, child: GroupFixedButton())
        ]));
  }
}

class HistoryBody extends StatelessWidget {
  HistoryBody({super.key});

  TextEditingController nameC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: ListView(children: [
          Container(
            padding: const EdgeInsets.only(top: 8),
            alignment: Alignment.topLeft,
            child: const Icon(
              Icons.call,
              size: 120,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              AppLocalizations.of(context)!.booked_schedule,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
          ),
          // TODO:

          Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.only(top: 4, bottom: 8, left: 16),
            decoration: const BoxDecoration(
                border: Border(
                    left: BorderSide(
                        width: 4, color: Color.fromARGB(255, 87, 86, 86)))),
            // TODO: Làm thanh dọc đoạn văn bản trên
            child: const Text(
              "Đây là danh sách các bài học bạn đã tham gia\nBạn có thể xem lại thông tin chi tiết về các buổi học đã tham gia đã tham gia",
              style: TextStyle(fontSize: 16),
            ),
          ),

          // Lastest book not start
          Container(),
          // TODO: Dropdown of
          const HistoryItem()
        ]));
  }
}
