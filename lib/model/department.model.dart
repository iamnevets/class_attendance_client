import 'package:class_attendance/model/faculty.model.dart';
import 'package:class_attendance/model/programme.model.dart';

class Department {
  int id = 0;
  String? name = '';
  String? description = '';
  int? facultyId = 0;
  Faculty? faculty = Faculty(id: 0);
  List<Programme>? programmes = [];

  Department(
      {required this.id,
      required this.name,
      required this.description,
      required this.facultyId,
      required this.faculty,
      required this.programmes});

  Department.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    facultyId = json['facultyId'];
    faculty = json['faculty'] != null ? Faculty.fromJson(json['faculty']) : null;

    if (json['programmes'] == null) {
      programmes = [];
    } else {
      var jsonProgrammes = (json['programmes'] as List);
      for (var v in jsonProgrammes) {
        programmes!.add(Programme.fromJson(v));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['facultyId'] = facultyId;
    data['faculty'] = faculty!.toJson();
    if (programmes != null) {
      data['programmes'] = programmes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}