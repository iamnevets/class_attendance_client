import 'package:class_attendance/model/course.model.dart';
import 'package:class_attendance/model/department.model.dart';
import 'package:class_attendance/model/user.model.dart';

class Programme {
  int id = 0;
  String? name;
  int? departmentId;
  Department? department;
  List<Course>? courses;
  List<User>? students;

  Programme(
      {required this.id,
      this.name,
      this.departmentId,
      this.department,
      this.courses,
      this.students});

  Programme.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    departmentId = json['departmentId'];
    department = json['department'] != null ? Department.fromJson(json['department']) : null;
    if (json['courses'] == null) {
      courses = [];
    } else {
      var jsonCourses = (json['courses'] as List);
      for (var v in jsonCourses) {
        courses!.add(Course.fromJson(v));
      }
    }
    if (json['students'] == null) {
      students = [];
    } else {
      var jsonStudents = (json['students'] as List);
      for (var v in jsonStudents) {
        students!.add(User.fromJson(v));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['departmentId'] = departmentId;
    data['department'] = department!.toJson();
    if (courses != null) {
      data['courses'] = courses!.map((v) => v.toJson()).toList();
    }
    if (students != null) {
      data['students'] = students!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}