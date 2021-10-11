import 'dart:convert';

import 'package:class_attendance/Controller/accounts_controller.dart';
import 'package:class_attendance/Repositories/lecture_repository.dart';
import 'package:class_attendance/model/account/login.model.dart';
import 'package:class_attendance/model/return_object.model.dart';
import 'package:class_attendance/model/user.model.dart';

class AccountsRepository {
  ///////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////

  static User currentUser = User(name: '', phoneNumber: '', userName: '', password: '');
  ReturnObject user = ReturnObject(data: null, success: false, message: '');

  ///////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////

  Future<ReturnObject> signUp(String fullName, String studentId, String mobileNumber, String userName, String password) async {
    var response = await AccountsControllerService().signUp(fullName, studentId, mobileNumber, studentId, password);
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    var data = returnObject.data;
    if (returnObject.success!) {
      setCurrentUser(data);
    }

    return returnObject;
  }

  Future<ReturnObject> login(LoginModel loginModel) async {
    var response = await AccountsControllerService().login(loginModel);
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    var data = returnObject.data;
    if (returnObject.success!) {
      setCurrentUser(data);
      await setCurrentLectureForUser();
    }

    return returnObject;
  }

  Future<ReturnObject> logout() async {
    var response = await AccountsControllerService().logOut();
    ReturnObject returnObject = ReturnObject.fromJson(json.decode((response.body)));

    return returnObject;
  }

  ///////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////

  static void setCurrentUser(dynamic data) {
    currentUser = User.fromJson(data);
  }

  static User getCurrentUser() => currentUser;

  static Future<void> setCurrentLectureForUser() async {
    await LectureRepository().getAll();
  }
}
