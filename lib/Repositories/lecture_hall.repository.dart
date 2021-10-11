import 'dart:convert';

import 'package:class_attendance/Controller/lecture_halls_controller.dart';
import 'package:class_attendance/model/lecture_hall.model.dart';
import 'package:class_attendance/model/return_object.model.dart';

class LectureHallRepository {
  Future<ReturnObject> create(LectureHall lectureHall) async {
    var response = await LectureHallsController().create(lectureHall);
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }

  Future<ReturnObject> getOne(int lecturehallId) async {
    var response = await LectureHallsController().getOne(lecturehallId);
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }

  Future<ReturnObject> getAll() async {
    var response = await LectureHallsController().getAll();
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }

  Future<ReturnObject> update(int lecturehallId, LectureHall lectureHall) async {
    var response = await LectureHallsController().update(lecturehallId, lectureHall);
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }
}