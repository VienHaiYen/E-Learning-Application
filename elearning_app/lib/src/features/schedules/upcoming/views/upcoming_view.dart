import 'package:flutter/material.dart';
import 'package:elearning_app/src/constants/items_per_page.dart';
import 'package:elearning_app/src/models/schedule/booking_info.dart';
import 'package:elearning_app/src/providers/auth_provider.dart';
import 'package:elearning_app/src/services/user_service.dart';
import 'package:provider/provider.dart';

import '../widgets/upcoming_card.dart';

class UpcomingView extends StatefulWidget {
  const UpcomingView({Key? key}) : super(key: key);

  @override
  State<UpcomingView> createState() => _UpcomingClassViewState();
}

class _UpcomingClassViewState extends State<UpcomingView> {
  List<BookingInfo> upcoming = [];

  int _page = 1;
  int _perPage = 10;
  int _count = 0;
  bool _isLoading = true;

  Future<void> _fetchUpcomingClasses(String token) async {
    final result = await UserService.getAllUpcomingClasses(
      token: token,
      page: _page,
      perPage: _perPage,
    );

    setState(() {
      upcoming = result['classes'];
      _count = result['count'];
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    if (_isLoading && authProvider.token != null) {
      final String accessToken = authProvider.token?.access?.token as String;
      _fetchUpcomingClasses(accessToken);
    }

    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : upcoming.isEmpty
            ? const Center(
                child: Text(
                  'You have no upcoming class',
                  style: TextStyle(fontSize: 16),
                ),
              )
            : SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'You have $_count upcoming classes',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(height: 16),
                    ...List<Widget>.generate(
                      upcoming.length,
                      (index) => UpcomingClassCard(
                        bookingInfo: upcoming[index],
                        onCancel: (value) {
                          if (value) {
                            setState(() {
                              _isLoading = true;
                            });
                          }
                        },
                      ),
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
