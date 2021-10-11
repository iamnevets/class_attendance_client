// ignore_for_file: constant_identifier_names

import 'package:class_attendance/model/class_group.model.dart';
import 'package:class_attendance/model/course.model.dart';
import 'package:class_attendance/model/lecture_hall.model.dart';
import 'package:class_attendance/model/user.model.dart';

import 'lecture_attendance.model.dart';

class Lecture {
  int id = 0;
  String? date;
  int? courseId;
  Course? course;
  String? userId;
  User? lecturer;
  List<LectureAttendance>? lectureAttendance = [];
  int? lectureHallId;
  LectureHall? lectureHall;
  int? classGroupId;
  ClassGroup? classGroup;

  Lecture(
      {required this.id,
      this.date,
      this.courseId,
      this.course,
      this.userId,
      this.lecturer,
      this.lectureAttendance,
      this.lectureHallId,
      this.lectureHall,
      this.classGroupId,
      this.classGroup});

  Lecture.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    courseId = json['courseId'];
    course = json['course'] != null ? Course.fromJson(json['course']) : null;
    userId = json['userId'];
    lecturer = json['lecturer'] != null ? User.fromJson(json['lecturer']) : null;
    classGroupId = json['classGroupId'];
    classGroup = json['classGroup'] != null ? ClassGroup.fromJson(json['classGroup']) : null;

    if (json['lectureAttendance'] == null) {
      lectureAttendance = [];
    } else {
      var jsonLectureAttendance = (json['lectureAttendance'] as List);
      for (var v in jsonLectureAttendance) {
        lectureAttendance!.add(LectureAttendance.fromJson(v));
      }
    }
    lectureHallId = json['lectureHallId'];
    lectureHall = json['lectureHall'] != null ? LectureHall.fromJson(json['lectureHall']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['courseId'] = courseId;
    if (course != null) {
      data['course'] = course!.toJson();
    }
    data['userId'] = userId;
    if (lecturer != null) {
      data['lecturer'] = lecturer!.toJson();
    }
    data['classGroupId'] = classGroupId;
    if (classGroup != null) {
      data['classGroup'] = classGroup!.toJson();
    }
    if (lectureAttendance != null) {
      data['lectureAttendance'] = lectureAttendance!.map((v) => v.toJson()).toList();
    }
    data['lectureHallId'] = lectureHallId;
    if (lectureHall != null) {
      data['lectureHall'] = lectureHall!.toJson();
    }

    return data;
  }
}
