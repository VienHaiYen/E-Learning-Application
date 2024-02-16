import 'package:flutter/material.dart';
import 'package:elearning_app/src/dummy/dummy_data.dart';
import 'package:elearning_app/src/constants/routes.dart';
import 'package:elearning_app/src/models/tutor/tutor_feedback.dart';
import 'package:elearning_app/src/providers/auth_provider.dart';
import 'package:elearning_app/src/services/tutor_service.dart';
import 'package:elearning_app/src/widgets/feedback_card.dart';

class TutorFeedbackView extends StatefulWidget {
  const TutorFeedbackView({Key? key}) : super(key: key);

  @override
  State<TutorFeedbackView> createState() => _TutorFeedbackViewState();
}

class _TutorFeedbackViewState extends State<TutorFeedbackView> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    dynamic arguments = ModalRoute.of(context)?.settings.arguments;
    List<TutorFeedback> feedbacks =
        arguments is List<TutorFeedback> ? arguments : [];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.blue[600],
        ),
        title: Text(
          'Reviews',
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey[400]),
                hintText: "Write your review",
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            ListView.builder(
              itemCount: feedbacks.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => FeedbackCard(
                  feedback: feedbacks[feedbacks.length - index - 1]),
            ),
          ],
        ),
      ),
    );
  }
}

// Center(
//   child: TextButton(
//     style: TextButton.styleFrom(padding: const EdgeInsets.all(12)),
//     onPressed: () {
//       Navigator.pushNamed(context, Routes.writeReview);
//     },
//     child: Row(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: const [
//         Icon(Icons.edit, size: 24),
//         SizedBox(width: 8),
//         Text(
//           'Write Review',
//           textAlign: TextAlign.center,
//           style: TextStyle(fontSize: 18),
//         ),
//       ],
//     ),
//   ),
// ),