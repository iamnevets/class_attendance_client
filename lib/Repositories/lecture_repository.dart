import 'dart:convert';

import 'package:class_attendance/Controller/lectures_controller.dart';
import 'package:class_attendance/Repositories/accounts_repository.dart';
import 'package:class_attendance/model/lecture.model.dart';
import 'package:class_attendance/model/return_object.model.dart';

class LectureRepository {
  static Lecture currentLectureForUser = Lecture(id: 0);

  Future<ReturnObject> joinLecture(Lecture lecture) async {
    var response = await LecturesController().create(lecture);
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }

  Future<ReturnObject> getAll() async {
    var response = await LecturesController().getAll();
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    var data = returnObject.data;
    if (returnObject.success!) {
      setCurrentLectureForUser(data);
    }

    return returnObject;
  }

  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  static void setCurrentLectureForUser(data) {
    var currentUser = AccountsRepository.getCurrentUser();
    List<Lecture> allLectures = [];
    (data as List).map((e) => Lecture.fromJson(e)).toList().forEach((lecture) {
      allLectures.add(lecture);
    });

    currentLectureForUser = allLectures.firstWhere((lecture) => lecture.classGroup!.id == currentUser.classGroup!.id);
  }

  static Lecture getCurrentLectureForUser() {
    return currentLectureForUser;
  }
}
