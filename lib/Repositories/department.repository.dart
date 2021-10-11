import 'dart:convert';

import 'package:class_attendance/Controller/departments_controller.dart';
import 'package:class_attendance/model/department.model.dart';
import 'package:class_attendance/model/return_object.model.dart';

class DepartmentRepository {
  Future<ReturnObject> create(Department department) async {
    var response = await DepartmentsController().create(department);
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }

  Future<ReturnObject> getOne(int departmentId) async {
    var response = await DepartmentsController().getOne(departmentId);
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }

  Future<ReturnObject> getAll() async {
    var response = await DepartmentsController().getAll();
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }

  Future<ReturnObject> update(int departmentId, Department department) async {
    var response = await DepartmentsController().update(departmentId, department);
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }
}