import 'package:class_attendance/model/attendance/attendance_sheet.model.dart';

class AttendanceSigning {
  int id = 0;
  int? attendanceSheetId = 0;
  AttendanceSheet? attendanceSheet;
  String? studentId = '';
  String? name = '';
  String? deviceId = '';

  AttendanceSigning({required this.id, this.attendanceSheetId, this.attendanceSheet, this.studentId, this.name, this.deviceId});

  AttendanceSigning.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attendanceSheetId = json['attendanceSheetId'];
    attendanceSheet = json['attendanceSheet'] != null ? AttendanceSheet.fromJson(json['attendanceSheet']) : null;
    studentId = json['studentId'];
    name = json['name'];
    deviceId = '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['attendanceSheetId'] = attendanceSheetId;
    if (attendanceSheet != null) {
      data['attendanceSheet'] = attendanceSheet!.toJson();
    }
    data['studentId'] = studentId;
    data['name'] = name;
    data['deviceId'] = deviceId;
    return data;
  }
}