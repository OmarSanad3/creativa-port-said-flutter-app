import 'package:creative_portsaid/main.dart';
import 'package:creative_portsaid/models/course.dart';
import 'package:flutter/material.dart';

class CourseDetailsScreen extends StatelessWidget {
  CourseDetailsScreen({super.key, required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.courseName),
      ),
      body: Center(
        child: SingleChildScrollView(
          // set the background color of the container to kBlueColor.withOpacity(0.25)
          child: Container(
            // margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF004F9F).withOpacity(0.6),
            ),
            child: Column(
              children: [
                Image.asset(
                  course.imagePath,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    course.englishDescription,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    course.arabicDescription,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Duration: ${course.duration} days",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: kYellowColor,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Register"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
