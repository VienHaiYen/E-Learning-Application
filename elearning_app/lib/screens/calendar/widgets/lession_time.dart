import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LessionTime extends StatelessWidget {
  const LessionTime({super.key, this.time});

  final String? time;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          time ?? "01:30 - 01:55",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        Container(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.lesson_require,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                // TODO: chưa làm dropdown xuống
                TextButton(
                    onPressed: () {},
                    child: Text(
                        AppLocalizations.of(context)!.lesson_require_edit,
                        style: const TextStyle(color: Colors.blue)))
              ],
            )
          ],
        ))
      ]),
    );
  }
}
