import 'dart:convert';

import 'package:class_attendance/model/school.model.dart';
import 'package:http/http.dart' as http;

class SchoolsController {
  Future<http.Response> create(School school) async {
    String jsonModel = jsonEncode(school);
    var url = Uri.parse('https://classattendanceapi.azurewebsites.net/api/schools');

    final response = await http.post(url, body: jsonModel);
    return response;
  }

  Future<http.Response> getOne(int schoolId) async {
    var baseUrl = 'https://classattendanceapi.azurewebsites.net/api/schools';

    Map<String, int> queryParams = {'schoolId': schoolId};
    String queryString = Uri(queryParameters: queryParams).query;

    String joinedUrl = baseUrl + '?' + queryString;
    var requestUrl = Uri.parse(joinedUrl);

    final response = await http.get(requestUrl, headers: {'content-type': 'application/json'});
    return response;
  }

  Future<http.Response> getAll() async {
    var url = Uri.parse('https://classattendanceapi.azurewebsites.net/api/schools');

    final response = await http.get(url);
    return response;
  }

  Future<http.Response> update(int schoolId, School school) async {
    var jsonModel = jsonEncode(school);

    var baseUrl = 'https://classattendanceapi.azurewebsites.net/api/schools';

    Map<String, int> queryParams = {'schoolId': schoolId};
    String queryString = Uri(queryParameters: queryParams).query;

    String joinedUrl = baseUrl + '?' + queryString;
    var requestUrl = Uri.parse(joinedUrl);

    final response = http.put(requestUrl, body: jsonModel);
    return response;
  }
}
