import 'dart:convert';

import 'package:class_attendance/Controller/courses_controller.dart';
import 'package:class_attendance/model/course.model.dart';
import 'package:class_attendance/model/return_object.model.dart';

class CourseRepository {
  Future<ReturnObject> create(Course course) async {
    var response = await CoursesController().create(course);
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }

  Future<ReturnObject> getOne(int courseId) async {
    var response = await CoursesController().getOne(courseId);
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }

  Future<ReturnObject> getAll() async {
    var response = await CoursesController().getAll();
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }

  Future<ReturnObject> update(int courseId, Course course) async {
    var response = await CoursesController().update(courseId, course);
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }
}