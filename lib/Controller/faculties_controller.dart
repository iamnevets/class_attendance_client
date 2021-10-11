import 'dart:convert';
import 'package:class_attendance/model/faculty.model.dart';
import 'package:http/http.dart' as http;

class FacultiesController {
  Future<http.Response> create(Faculty faculty) async {
    String jsonModel = jsonEncode(faculty);
    var url = Uri.parse('https://classattendanceapi.azurewebsites.net/api/faculties');

    final response = await http.post(url, body: jsonModel);
    return response;
  }

  Future<http.Response> getOne(int facultyId) async {
    var baseUrl = 'https://classattendanceapi.azurewebsites.net/api/faculties';

    Map<String, int> queryParams = {'facultyId': facultyId};
    String queryString = Uri(queryParameters: queryParams).query;

    String joinedUrl = baseUrl + '?' + queryString;
    var requestUrl = Uri.parse(joinedUrl);

    final response = await http.get(requestUrl, headers: {'content-type': 'application/json'});
    return response;
  }

  Future<http.Response> getAll() async {
    var url = Uri.parse('https://classattendanceapi.azurewebsites.net/api/faculties');

    final response = await http.get(url);
    return response;
  }

  Future<http.Response> update(int facultyId, Faculty faculty) async {
    var jsonModel = jsonEncode(faculty);

    var baseUrl = 'https://classattendanceapi.azurewebsites.net/api/faculties';

    Map<String, int> queryParams = {'facultyId': facultyId};
    String queryString = Uri(queryParameters: queryParams).query;

    String joinedUrl = baseUrl + '?' + queryString;
    var requestUrl = Uri.parse(joinedUrl);

    final response = http.put(requestUrl, body: jsonModel);
    return response;
  }
}