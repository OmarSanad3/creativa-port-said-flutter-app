import 'package:creative_portsaid/main.dart';
import 'package:creative_portsaid/widgets/screens/add_feedback_screen.dart';
import 'package:flutter/material.dart';

class SuggestionsAndComplaintsScreen extends StatefulWidget {
  const SuggestionsAndComplaintsScreen({super.key});

  @override
  State<SuggestionsAndComplaintsScreen> createState() =>
      _SuggestionsAndComplaintsScreenState();
}

class _SuggestionsAndComplaintsScreenState
    extends State<SuggestionsAndComplaintsScreen> {
  final String _description =
      "We genuinely care about your thoughts and experiences. Whether you have a suggestion to improve our services or a complaint that needs attention, we want to hear from you. Your input helps us grow and serve you better. Thank you for taking the time to share with us!";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBlueColor.withOpacity(0.5),
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "lib/assets/collective_photo.jpeg",
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Suggestions and Complaints",
                style: TextStyle(
                  fontSize: 24,
                  color: kBlueColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "We Value Your Feedback!",
                style: TextStyle(
                  fontSize: 17,
                  color: kYellowColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _description,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(kYellowColor),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddFeedbackScreen(),
                    ),
                  );
                },
                child: const Text("Add Feedback"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
