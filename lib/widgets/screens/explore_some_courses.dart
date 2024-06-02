import 'package:creative_portsaid/data/courses.dart';
import 'package:creative_portsaid/main.dart';
import 'package:creative_portsaid/models/custom_list_item.dart';
import 'package:creative_portsaid/widgets/home_screen.dart';
import 'package:creative_portsaid/widgets/screens/course_details_screen.dart';
import 'package:creative_portsaid/widgets/screens/courses_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class ExploreSomeCourses extends StatelessWidget {
  const ExploreSomeCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      height: 550,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: min(3, courses.length) + 1,
        itemBuilder: (context, index) {
          return index >= min(3, courses.length)
              ? Container(
                  margin: const EdgeInsets.all(8.0),
                  width: MediaQuery.of(context).size.width * 0.8,
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
                          builder: (context) => HomeScreen(
                            viewdScreen: CustomListItem(
                              title: "Courses",
                              icon: Icons.school_rounded,
                              screen: const CoursesScreen(),
                            ),
                          ),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 48,
                          color: kYellowColor,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "See More",
                          style: TextStyle(
                            fontSize: 24,
                            color: kBlueColorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
                  margin: const EdgeInsets.all(8.0),
                  width: MediaQuery.of(context).size.width * 0.8,
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
                      children: [
                        Image.asset(
                          courses[index].imagePath,
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
                          getInCompleteDescription(
                              courses[index].englishDescription),
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
      ),
    );
  }
}
