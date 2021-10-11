import 'package:class_attendance/Repositories/accounts_repository.dart';
import 'package:class_attendance/Repositories/classSignedIn.dart';
import 'package:class_attendance/Repositories/lecture_repository.dart';
import 'package:class_attendance/model/class_group.model.dart';
import 'package:class_attendance/model/course.model.dart';
import 'package:class_attendance/model/lecture.model.dart';
import 'package:class_attendance/model/lecture_hall.model.dart';
import 'package:class_attendance/model/student.model.dart';
import 'package:class_attendance/view/ongoingclass/ongoingclass.view.dart';
import 'package:flutter/cupertino.dart';
// ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isSignedIn = true;

  final List<Student> listStudents = [
    Student(
        id: 1,
        name: 'Kofi Aboagye',
        imgUrl: 'assets/img/img_3.jpg',
        studentID: '030118901'),
    Student(
        id: 2,
        name: 'Xena Mankye',
        imgUrl: 'assets/img/img_4.jpg',
        studentID: '030118901'),
    Student(
        id: 3,
        name: 'Eric Opoku',
        imgUrl: 'assets/img/img-11.jpeg',
        studentID: '030118901'),
    Student(
        id: 4,
        name: 'Steven Amakye',
        imgUrl: 'assets/img/img-7.jpeg',
        studentID: '030118901'),
    Student(
        id: 5,
        name: 'Moses Regan',
        imgUrl: 'assets/img/img-8.jpeg',
        studentID: '030118901'),
    Student(
        id: 11,
        name: 'Ophelia Tomoe',
        imgUrl: 'assets/img/img-10.jpeg',
        studentID: '030118901'),
    Student(
        id: 6,
        name: 'Hafiz Nuhu',
        imgUrl: 'assets/img/img-6.jpeg',
        studentID: '030118901'),
    Student(
        id: 7,
        name: 'Paul Faye',
        imgUrl: 'assets/img/img-7.jpeg',
        studentID: '030118901'),
    Student(
        id: 8,
        name: 'Ismaiela Peterson',
        imgUrl: 'assets/img/img-12.jpeg',
        studentID: '030118901'),
    Student(
        id: 9,
        name: 'Gabriel Atoh',
        imgUrl: 'assets/img/img_1.jpg',
        studentID: '030118901'),
    Student(
        id: 9,
        name: 'Daniella Okyere',
        imgUrl: 'assets/img/img_5.jpg',
        studentID: '030118901'),
    Student(
        id: 10,
        name: 'Susan Frimpong',
        imgUrl: 'assets/img/img-9.jpeg',
        studentID: '030118901'),
  ];

  var dateTime = DateTime.now();

// Date Details
// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
  showHour() {
    var currentHour = DateFormat('Hm');
    String todayHour = currentHour.format(dateTime);
    return Text(
      todayHour,
      style: TextStyle(fontSize: 18),
    );
  }

  showDayName() {
    var currentDay = DateFormat('EEEE');
    String todayDay = currentDay.format(dateTime);
    return Text(
      todayDay,
      style: TextStyle(fontSize: 48),
    );
  }

  showDayNumber() {
    var currentDay = DateFormat('d');
    String todayDay = currentDay.format(dateTime);
    return Text(
      todayDay,
      style: TextStyle(fontSize: 48),
    );
  }

  showDay() {
    return Row(
      children: [
        showDayName(),
        Text(',', style: TextStyle(fontSize: 48)),
        SizedBox(
          width: 5,
        ),
        showDayNumber(),
      ],
    );
  }

  showMonth() {
    var currentMonth = DateFormat('MMMM');
    String todayMonth = currentMonth.format(dateTime);
    return Text(todayMonth,
        style: TextStyle(
          fontSize: 25,
        ));
  }

  showYear() {
    var currentYear = DateFormat('y');
    String todayYear = currentYear.format(dateTime);
    return Text(
      todayYear,
      style: TextStyle(
        fontSize: 25,
      ),
    );
  }
  // \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

  Lecture? currentLectureForUser;
  LectureHall? lectureHall;
  ClassGroup? classGroup;
  Course? course;
  List<Topic>? courseOutline = [];

  @override
  void initState() {
    super.initState();

    isSignedIn = IsSignedIn.isSignedIn;

    currentLectureForUser = LectureRepository.getCurrentLectureForUser();
    classGroup = currentLectureForUser!.classGroup;
    course = currentLectureForUser!.course;
    lectureHall = currentLectureForUser!.lectureHall;

    courseOutline = course!.courseOutline;

    print(
        '////////////////////////////////////////////////////////////////////////////////');

    print('Class Group: ${currentLectureForUser!.classGroup!.name}');
    print('Course: ${currentLectureForUser!.course!.name}');
    print('Lecture Hall: ${currentLectureForUser!.lectureHall!.name}');
    print('Lecturer: ${currentLectureForUser!.lecturer!.name}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          // leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          elevation: 0,
          title: Text(
            'Home',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
                icon: Icon(
                  Icons.settings_outlined,
                  size: 28,
                )),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
                icon: Icon(
                  Icons.account_circle_outlined,
                  size: 28,
                )),
          ],
        ),
        drawer: Drawer(
          child: Container(
            height: 600,
            color: Theme.of(context).colorScheme.primary,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height * .3,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'TODAY',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            showDay(),
                            Row(
                              children: [
                                showMonth(),
                                SizedBox(
                                  width: 6,
                                ),
                                showYear()
                              ],
                            ),
                            // showHour(),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.event_available,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Networking',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  subtitle:
                      Text('Completed', style: TextStyle(color: Colors.white)),
                  onTap: () {},
                ),
                Divider(
                  color: Colors.white.withAlpha(40),
                ),
                ListTile(
                  leading: Icon(
                    Icons.today,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Visual Basic',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  subtitle: Text('Now',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          backgroundColor: Colors.white)),
                  onTap: () {},
                ),
                Divider(
                  color: Colors.white.withAlpha(40),
                ),
                ListTile(
                  leading: Icon(
                    Icons.timer_outlined,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Entrepreneurship',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  subtitle: Text('Next - 05:45 PM',
                      style: TextStyle(color: Colors.white)),
                  onTap: () {},
                ),
                Divider(
                  color: Colors.white.withAlpha(40),
                ),
                ListTile(
                  leading: Icon(
                    Icons.timer,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Research Methods',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  subtitle: Text(
                    'Next - 06:00 PM',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                ),
                Divider(
                  color: Colors.white.withAlpha(40),
                ),
                ListTile(
                  leading: Icon(
                    Icons.timer,
                    color: Colors.white,
                  ),
                  title: Text(
                    'C++',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  subtitle: Text(
                    'Next - 07:00 PM',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          padding: EdgeInsets.all(0),
          child: Column(children: [
            Container(
              color: Theme.of(context).colorScheme.primary,
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isSignedIn
                      ? ActionChip(
                          avatar:
                              Icon(Icons.check, color: Colors.white, size: 15),
                          label: Text(
                            'Signed',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: Colors.green[400],
                          onPressed: () {})
                      : ActionChip(
                          avatar: Icon(
                            Icons.warning,
                            color: Colors.black,
                            size: 15,
                          ),
                          label: Text(
                            'Not Signed',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: Colors.amber[700],
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OngoingClassView()));
                          }),
                  Text(
                    course!.name!,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    '02:48',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              // padding: EdgeInsets.all(0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    child: Text(
                      'PRESENT',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // ___________________________________________________________________________________________
                  Container(
                      // width: double.infinity,
                      height: 100,
                      // color: Colors.grey[350],
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: listStudents
                            .map((e) => Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: AssetImage(e.imgUrl),
                                        radius: 30,
                                      ),
                                      SizedBox(height: 5,),
                                      Text(e.name,),
                                    ],
                                  ),
                                ))
                            .toList(),
                      )),
                  // ___________________________________________________________________________________________
                  // SizedBox(height: 30),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Container(
                            child: ListTile(
                          title: Text('Topic'),
                          leading: Icon(Icons.topic),
                          subtitle: Text(courseOutline!.elementAt(5).name!),
                        )),
                        Container(
                            child: ListTile(
                          title: Text(lectureHall!.name!),
                          leading: Icon(Icons.location_city),
                          subtitle: Text('Venue'),
                        )),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      'Course Outline',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: courseOutlineWidget(),
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
        floatingActionButton: isSignedIn
            ? FloatingActionButton.extended(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OngoingClassView()));
                },
                elevation: 0,
                label: Text('Classroom', style: TextStyle(color: Colors.white),),
                icon: Icon(Icons.arrow_forward, color: Colors.white,),
                backgroundColor: Colors.green[600],
              )
            : FloatingActionButton(
                backgroundColor: Theme.of(context).primaryColor,
                onPressed: () {
                  Navigator.pushNamed(context, '/join-class');
                },
                elevation: 0,
                splashColor: Theme.of(context).primaryColor,
                child: SpinKitRipple(
                  color: Colors.white,
                  size: 50,
                ),
              ));
  }

  List<Widget> courseOutlineWidget() {
    var children = <Widget>[];
    var arrayOfCourseOutline = <Topic>[];

    for (var course in courseOutline!) {
      arrayOfCourseOutline.add(course);
    }

    for (var i = 0; i < arrayOfCourseOutline.length; i++) {
      children.add(
        Column(
          children: [
            ListTile(
              trailing: Icon(Icons.check),
              title: Text(
                arrayOfCourseOutline[i].name!,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Divider()
          ],
        ),
      );
    }

    return children;
  }
}
