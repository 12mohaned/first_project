import 'package:first_project/Home/available_tutors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final controller = PageController(
  initialPage: 1,
  viewportFraction: 0.8,
);
Widget tutor = (Tutor(
    'Mohaned',
    'Student who thinks and practice Software Engineering, Machine Learning and loves',
    'mohaned.mashaly12@gmail.com'));
Widget pageview = (PageView(
  controller: controller,
  scrollDirection: Axis.vertical,
  children: [
    Course('CSEN102',
        'CSEN102 is an introduction to fundamentals of Computer Science. The purpose of this course is to gain a broad oversight of the discipline of formal computer science. This will allow the students to, not only use computers and software efficiently, but to understand the ideas underlying their creation and implementation. Students will be able to understand fundamental issues as algorithms, hardware design, computer organization and system software'),
    Course('CSEN301',
        'Intended for students who have a working knowledge of the core Java programming language, this course introduces classical data structures and algorithms in a programming perspective. Students will learn about tools and strategies that have proven themselves useful in modeling real-world problems and solving problems on a computer.'),
    Course('CSEN501',
        'In this course, the students will learn the basic theories of database systems as well as basic skills to operate a database so that they can design, implement, and operate an application database. The major topics covered in this course include high-level conceptual database design using ER and EER models; relational database concepts, relational database design by ER- and EER-to-Relational mapping, and basic SQL programming.From a course project running through the entire semester, the students will learn to design simple database applications using ER model, implement them on a relational database management system, and write queries to extract information from the database.'),
  ],
));

class Course extends StatelessWidget {
  final String name;
  final String about;
  const Course(this.name, this.about);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(width: 10, height: 18),
            Text(about,
                style: TextStyle(
                  fontSize: 15,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                    alignment: Alignment.topRight,
                    child: (CupertinoButton(
                      child: Text(
                        'View Tutors',
                        style: TextStyle(
                          color: Colors.orangeAccent,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => tutor),
                        );
                      },
                    ))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CourseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Courses'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/EducationBackground_Preview_03.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: pageview,
      ),
    );
  }
}
