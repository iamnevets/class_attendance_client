import 'dart:convert';

import 'package:class_attendance/Controller/attendance_signings_controller.dart';
import 'package:class_attendance/model/attendance/attendance_signing.model.dart';
import 'package:class_attendance/model/return_object.model.dart';

class AttendanceSigningRepository {
  Future<ReturnObject> create(AttendanceSigning attendanceSigning) async {
    var response = await AttendanceSigningsController().create(attendanceSigning);
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }

  Future<ReturnObject> getOne(int attendanceSheetId) async {
    var response = await AttendanceSigningsController().getOne(attendanceSheetId);
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }

  Future<ReturnObject> getAll() async {
    var response = await AttendanceSigningsController().getAll();
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }

  Future<ReturnObject> update(int attendanceSheetId, AttendanceSigning attendanceSigning) async {
    var response = await AttendanceSigningsController().update(attendanceSheetId, attendanceSigning);
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }
}