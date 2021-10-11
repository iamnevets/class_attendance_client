import 'package:class_attendance/model/lecture.model.dart';
import 'package:class_attendance/model/user.model.dart';

import 'coordinates.model.dart';

class LectureAttendance {
  int id = 0;
  int? lectureId;
  Lecture? lecture;
  String? userId;
  User? student;
  Coordinates? coordinates;

  LectureAttendance(
      {this.lectureId,
      this.lecture,
      this.userId,
      this.student,
      this.coordinates});

  LectureAttendance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lectureId = json['lectureId'];
    lecture = json['lecture'];
    userId = json['userId'];
    student = json['student'] != null ? User.fromJson(json['student']) : null;
    coordinates = json['coordinates'] != null ? Coordinates.fromJson(json['coordinates']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['id'] = id;
    data['lectureId'] = lectureId;
    if (lecture != null) {
      data['lecture'] = lecture!.toJson();
    }
    data['userId'] = userId;
    if (student != null) {
      data['student'] = student!.toJson();
    }
    if (coordinates != null) {
      data['coordinates'] = coordinates!.toJson();
    }
    return data;
  }
}
