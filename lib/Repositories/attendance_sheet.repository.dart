import 'dart:convert';

import 'package:class_attendance/Controller/attendance_sheets_controller.dart';
import 'package:class_attendance/model/attendance/attendance_sheet.model.dart';
import 'package:class_attendance/model/return_object.model.dart';

class AttendanceSheetRepository {
  Future<ReturnObject> create(AttendanceSheet attendanceSheet) async {
    var response = await AttendanceSheetsController().create(attendanceSheet);
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }

  Future<ReturnObject> getOne(int attendanceSheetId) async {
    var response = await AttendanceSheetsController().getOne(attendanceSheetId);
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }

  Future<ReturnObject> getAll() async {
    var response = await AttendanceSheetsController().getAll();
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }

  Future<ReturnObject> update(int attendanceSheetId, AttendanceSheet attendanceSheet) async {
    var response = await AttendanceSheetsController().update(attendanceSheetId, attendanceSheet);
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }
}