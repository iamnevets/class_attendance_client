import 'dart:convert';
import 'package:class_attendance/model/department.model.dart';
import 'package:http/http.dart' as http;

class DepartmentsController {
  Future<http.Response> create(Department department) async {
    String jsonModel = jsonEncode(Department);
    var url = Uri.parse('https://classattendanceapi.azurewebsites.net/api/departments');

    final response = await http.post(url, body: jsonModel);
    return response;
  }

  Future<http.Response> getOne(int departmentId) async {
    var baseUrl = 'https://classattendanceapi.azurewebsites.net/api/departments';

    Map<String, int> queryParams = {'departmentId': departmentId};
    String queryString = Uri(queryParameters: queryParams).query;

    String joinedUrl = baseUrl + '?' + queryString;
    var requestUrl = Uri.parse(joinedUrl);

    final response = await http.get(requestUrl, headers: {'content-type': 'application/json'});
    return response;
  }

  Future<http.Response> getAll() async {
    var url = Uri.parse('https://classattendanceapi.azurewebsites.net/api/departments');

    final response = await http.get(url);
    return response;
  }

  Future<http.Response> update(int departmentId, Department department) async {
    var jsonModel = jsonEncode(department);

    var baseUrl = 'https://classattendanceapi.azurewebsites.net/api/departments';

    Map<String, int> queryParams = {'departmentId': departmentId};
    String queryString = Uri(queryParameters: queryParams).query;

    String joinedUrl = baseUrl + '?' + queryString;
    var requestUrl = Uri.parse(joinedUrl);

    final response = http.put(requestUrl, body: jsonModel);
    return response;
  }
}