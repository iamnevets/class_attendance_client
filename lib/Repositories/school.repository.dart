import 'dart:convert';

import 'package:class_attendance/Controller/schools_controller.dart';
import 'package:class_attendance/model/school.model.dart';
import 'package:class_attendance/model/return_object.model.dart';

class SchoolRepository {
  Future<ReturnObject> create(School school) async {
    var response = await SchoolsController().create(school);
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }

  Future<ReturnObject> getOne(int schoolId) async {
    var response = await SchoolsController().getOne(schoolId);
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }

  Future<ReturnObject> getAll() async {
    var response = await SchoolsController().getAll();
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }

  Future<ReturnObject> update(int schoolId, School school) async {
    var response = await SchoolsController().update(schoolId, school);
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }
}