// ignore_for_file: constant_identifier_names

import 'package:class_attendance/model/programme.model.dart';
import 'package:class_attendance/model/user.model.dart';

class ClassGroup {
  int? id;
  String? name;
  int? level;
  int? programmeId;
  Programme? programme;
  List<User>? students;

  // Todo: add the rest of the code...
  ClassGroup(this.id, this.name, this.level, this.programmeId, this.programme);

  ClassGroup.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    level = json['level'];
    programmeId = json['programmeId'];
    programme = json['programme'] != null ? Programme.fromJson(json['programme']) : null;

    if (json['students'] == null) {
      students = [];
    } else {
      (json['students'] as List).map((e) => User.fromJson(e)).toList().forEach((student) {
        students!.add(student);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['level'] = level;
    data['programmeId'] = programmeId;
    if (programme != null) {
      data['programme'] = programme!.toJson();
    }
    if (students != null) {
      data['students'] = students!.map((student) => student.toJson()).toList();
    }

    return data;
  }
}

enum Level { L100, L200, L300, L400 }
