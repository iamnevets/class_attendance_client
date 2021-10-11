import 'dart:convert';

import 'package:class_attendance/Controller/departments_controller.dart';
import 'package:class_attendance/Controller/faculties_controller.dart';
import 'package:class_attendance/model/faculty.model.dart';
import 'package:class_attendance/model/return_object.model.dart';

class FacultyRepository {
  Future<ReturnObject> create(Faculty faculty) async {
    var response = await FacultiesController().create(faculty);
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }

  Future<ReturnObject> getOne(int facultyId) async {
    var response = await FacultiesController().getOne(facultyId);
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }

  Future<ReturnObject> getAll() async {
    var response = await FacultiesController().getAll();
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }

  Future<ReturnObject> update(int facultyId, Faculty faculty) async {
    var response = await FacultiesController().update(facultyId, faculty);
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }
}