import 'dart:convert';

import 'package:class_attendance/Controller/programmes_controller.dart';
import 'package:class_attendance/model/programme.model.dart';
import 'package:class_attendance/model/return_object.model.dart';

class ProgrammeRepository {
  Future<ReturnObject> create(Programme programme) async {
    var response = await ProgrammesController().create(programme);
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }

  Future<ReturnObject> getOne(int programmeId) async {
    var response = await ProgrammesController().getOne(programmeId);
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }

  Future<ReturnObject> getAll() async {
    var response = await ProgrammesController().getAll();
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }

  Future<ReturnObject> update(int programmeId, Programme programme) async {
    var response = await ProgrammesController().update(programmeId, programme);
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }
}