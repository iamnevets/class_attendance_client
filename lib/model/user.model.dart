import 'package:class_attendance/model/class_group.model.dart';
import 'package:class_attendance/model/course.model.dart';

class User {
  String id = '';
  String name = '';
  // String? studentId = '';
  String? phoneNumber = '';
  String userName = '';
  String password = '';
  String? token = '';
  int? classGroupId = 0;
  ClassGroup? classGroup = ClassGroup(0, '', null, 0, null);
  List<Course>? courses = [];

  User({required this.name, this.phoneNumber, required this.userName, required this.password, this.classGroupId, this.classGroup});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    userName = json['userName'];
    token = json['token'];
    classGroupId = json['classGroupId'];
    classGroup = json['classGroup'] != null ? ClassGroup.fromJson(json['classGroup']) : null;

    if (json['courses'] == null) {
      courses = [];
    } else {
      (json['courses'] as List).map((e) => Course.fromJson(e)).toList().forEach((course) {
        courses!.add(course);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phoneNumber'] = phoneNumber;
    data['userName'] = userName;
    data['password'] = password;
    data['classGroupId'] = classGroupId;
    if (classGroup != null) {
      data['classGroup'] = classGroup!.toJson();
    }
    if (courses != null) {
      data['courses'] = courses!.map((course) => course.toJson()).toList();
    }
    return data;
  }
}
