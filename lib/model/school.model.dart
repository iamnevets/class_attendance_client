import 'package:class_attendance/model/faculty.model.dart';

class School {
  int id = 0;
  String? name = '';
  String? email = '';
  String? phone = '';
  String? location = '';
  String? description = '';
  List<Faculty>? faculties = [];

  School({required this.id, this.name, this.email, this.phone, this.location, this.description, this.faculties});

  School.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    location = json['location'];
    description = json['description'];

    if (json['faculties'] == null) {
      faculties = [];
    } else {
      var jsonFaculties = (json['faculties'] as List);
      for (var v in jsonFaculties) {
        faculties!.add(Faculty.fromJson(v));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['location'] = location;
    data['description'] = description;
    if (faculties != null) {
      data['faculties'] = faculties!.map((e) => e.toJson()).toList();
    }
    return data;
  }
}
