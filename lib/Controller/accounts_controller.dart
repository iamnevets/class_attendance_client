import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:class_attendance/model/account/login.model.dart';
import 'package:class_attendance/model/user.model.dart';
import 'package:http/http.dart' as http;

class AccountsControllerService {
  var headers = {
    HttpHeaders.authorizationHeader: 'Token',
    HttpHeaders.contentTypeHeader: 'application/json',
  };

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  Future<http.Response> login(LoginModel loginModel) async {
    String model = jsonEncode(loginModel);
    // String model = jsonEncode(LoginModel(username: 'admin', password: 'admin@password', fromLecturerLoginPage: false));

    var baseUrl = Uri.parse('https://classattendanceapi.azurewebsites.net/api/accounts/login');

    // String loginModel = jsonEncode(LoginModel(username: "Admin", password: "adminpassword"));

    final response = await http.post(baseUrl, headers: {'content-type': 'application/json'}, body: model);
    return response;
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  Future<http.Response> signUp(String name, String studentId, String phoneNumber, String userName, String password) async {
    var user = jsonEncode(User(name: name, phoneNumber: phoneNumber, userName: userName, password: password));

    var url = Uri.parse('https://classattendanceapi.azurewebsites.net/api/accounts/signup');

    final response = await http.post(url, headers: {'content-type': 'application/json'}, body: user);
    return response;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  Future<http.Response> logOut() async {
    var url = Uri.parse('https://classattendanceapi.azurewebsites.net/api/accounts/logout');

    final response = await http.get(url, headers: {'content-type': 'application/json'});
    return response;
  }

  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  Future<http.Response> getUser(String userId) async {
    String baseUrl = 'https://automocarapi.azurewebsites.net/api/accounts';

    Map<String, String> queryParams = {'userId': userId};
    String queryString = Uri(queryParameters: queryParams).query;

    String joinedUrl = baseUrl + '?' + queryString;
    var requestUrl = Uri.parse(joinedUrl);

    final response = await http.get(requestUrl, headers: {'content-type': 'application/json'});
    return response;
  }
}
