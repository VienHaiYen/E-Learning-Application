import 'package:flutter/material.dart';
import 'package:elearning_app/src/constants/items_per_page.dart';
import 'package:elearning_app/src/models/schedule/booking_info.dart';
import 'package:elearning_app/src/providers/auth_provider.dart';
import 'package:elearning_app/src/services/user_service.dart';
import 'package:provider/provider.dart';

import '../widgets/history_card.dart';

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
      perPage: 10,
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
