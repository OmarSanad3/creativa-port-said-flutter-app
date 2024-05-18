import 'package:creative_portsaid/main.dart';
import 'package:creative_portsaid/widgets/screens/course_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:creative_portsaid/data/courses.dart';

String getInCompleteDescription(String description) {
  description = description.trim();
  description = description[0].toUpperCase() + description.substring(1);
  if (description.length > 100) {
    return "${description.substring(0, 97)}...";
  }
  return description;
}

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: kBlueColor.withOpacity(0.45),
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseDetailsScreen(
                    course: courses[index],
                  ),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  courses[index].imagePath,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 8),
                Text(
                  courses[index].courseName,
                  style: TextStyle(
                    fontSize: 24,
                    color: kBlueColorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  getInCompleteDescription(courses[index].englishDescription),
                  style: const TextStyle(
                    // color: kYellowColorScheme.primary,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Duration: ${courses[index].duration} days",
                  style: const TextStyle(
                    fontSize: 16,
                    color: kYellowColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
