import 'package:class_attendance/model/programme.model.dart';
import 'package:class_attendance/model/user.model.dart';

class Course {
  int id = 0;
  String? name;
  String? description;
  int? creditHours;
  List<Topic>? courseOutline = [];
  List<Programme>? programmes = [];
  List<User> users = [];

  Course({required this.id, this.name, this.description, this.creditHours, this.programmes});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    creditHours = json['creditHours'];

    if (json['courseOutline'] == null) {
      courseOutline = [];
    } else {
      var jsonTopics = (json['courseOutline'] as List);
      for (var v in jsonTopics) {
        courseOutline!.add(Topic.fromJson(v));
      }
    }

    if (json['programmes'] == null) {
      programmes = [];
    } else {
      var jsonProgrammes = (json['programmes'] as List);
      for (var v in jsonProgrammes) {
        programmes!.add(Programme.fromJson(v));
      }
    }

    if (json['users'] == null) {
      users = [];
    } else {
      var jsonLecturers = (json['users'] as List);
      for (var v in jsonLecturers) {
        users.add(User.fromJson(v));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['creditHours'] = creditHours;
    if (courseOutline != null) {
      data['courseOutline'] = courseOutline!.map((v) => v.toJson()).toList();
    }
    if (programmes != null) {
      data['programmes'] = programmes!.map((v) => v.toJson()).toList();
    }
    data['users'] = users.map((v) => v.toJson()).toList();
    return data;
  }
}

class Topic {
  int id = 0;
  String? name;
  int? courseId;
  Course? course;

  Topic(this.id, this.name, this.courseId, this.course);

  Topic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    courseId = json['courseId'];
    course = json['course'] != null ? Course.fromJson(json['course']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['courseId'] = courseId;
    if (course != null) {
      data['course'] = course!.toJson();
    }

    return data;
  }
}
