import 'package:class_attendance/model/attendance/attendance_signing.model.dart';
import 'package:class_attendance/model/lecture.model.dart';

import '../user.model.dart';

class AttendanceSheet {
  int id = 0;
  int? lectureId;
  Lecture? lecture;
  //////////////////////////// Don't forget to remove userId and student in the near future
  String? userId;
  User? student;
  List<AttendanceSigning>? signedAttendances;
  bool? signedByLecturer = false;

  AttendanceSheet({required this.id, this.lectureId, this.lecture, this.userId, this.student, this.signedByLecturer});

  AttendanceSheet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lectureId = json['lectureId'];
    lecture = json['lecture'] != null ? Lecture.fromJson(json['lecture']) : null;
    userId = json['userId'];
    student = json['student'] != null ? User.fromJson(json['student']) : null;

    if (json['signedAttendances'] == null) {
      signedAttendances = [];
    } else {
      var jsonSignedAttendances = (json['signedAttendances'] as List);
      for (var v in jsonSignedAttendances) {
        signedAttendances!.add(AttendanceSigning.fromJson(v));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['lectureId'] = lectureId;
    if (lecture != null) {
      data['lecture'] = lecture!.toJson();
    }
    data['userId'] = userId;
    if (student != null) {
      data['student'] = student!.toJson();
    }
    if (signedAttendances != null) {
      data['signedAttendances'] =
          signedAttendances!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}