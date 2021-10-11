
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:class_attendance/Controller/lecture_attendance_controller.dart';
import 'package:class_attendance/Repositories/accounts_repository.dart';
import 'package:class_attendance/Repositories/alert_dialog.repository.dart';
import 'package:class_attendance/Repositories/lecture_attendance.repository.dart';
import 'package:class_attendance/Repositories/lecture_repository.dart';
import 'package:class_attendance/model/coordinates.model.dart';
import 'package:class_attendance/model/lecture.model.dart';
import 'package:class_attendance/model/lecture_attendance.model.dart';
import 'package:class_attendance/model/lecture_hall.model.dart';
import 'package:class_attendance/view/ongoingclass/ongoingclass.view.dart';
import 'package:class_attendance/view/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class NewClassView extends StatefulWidget {
  const NewClassView({Key? key}) : super(key: key);

  @override
  State<NewClassView> createState() => _NewClassViewState();
}

class _NewClassViewState extends State<NewClassView> {
  Lecture? currentLectureForUser;
  LectureHall? lectureHall;

  @override
  void initState() {
    super.initState();

    currentLectureForUser = LectureRepository.getCurrentLectureForUser();
    lectureHall = currentLectureForUser!.lectureHall;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.grey[500],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: SizedBox(
          width: double.infinity,
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Join Class',
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    "Get in range to connect to the lecturer's device.",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              GestureDetector(
                  child: Container(
                      height: 300,
                      width: double.infinity,
                      child: SpinKitRipple(
                        borderWidth: 15,
                        size: 300,
                        color: Theme.of(context).colorScheme.primary,
                      )))
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 50,
        child: ElevatedButton(
          child: Text(
            'JOIN CLASS',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () async {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => OngoingClassView()));
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////
          },
        ),
      ),
    );
  }
}
