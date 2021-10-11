import 'package:class_attendance/model/school.model.dart';

import 'department.model.dart';

class Faculty {
  int id = 0;
  String? name;
  String? description;
  int? schoolId;
  School? school;
  List<Department>? departments;

  Faculty({required this.id, this.name, this.description, this.schoolId, this.school, this.departments});

  Faculty.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    schoolId = json['schoolId'];
    school = json['school'] != null ? School.fromJson(json['coordinate']) : null;
    description = json['description'];

    if (json['departments'] == null) {
      departments = [];
    } else {
      var jsonDepartments = (json['departments'] as List);
      for (var v in jsonDepartments) {
        departments!.add(Department.fromJson(v));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['schoolId'] = schoolId;
    data['school'] = school!.toJson();
    data['description'] = description;
    data['departments'] = departments!.map((e) => e.toJson()).toList();
    return data;
  }
}