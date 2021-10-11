import 'dart:convert';

import 'package:class_attendance/Controller/timetable_controller.dart';
import 'package:class_attendance/model/return_object.model.dart';
import 'package:class_attendance/model/timetable.model.dart';

class TimeTableRepository {
  Future<ReturnObject> create(TimeTable timeTable) async {
    var response = await TimeTablesController().create(timeTable);
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }

  Future<ReturnObject> getOne(int timeTableId) async {
    var response = await TimeTablesController().getOne(timeTableId);
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }

  Future<ReturnObject> getAll() async {
    var response = await TimeTablesController().getAll();
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }

  Future<ReturnObject> update(int timeTableId, TimeTable timeTable) async {
    var response = await TimeTablesController().update(timeTableId, timeTable);
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }
}