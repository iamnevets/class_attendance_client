import 'dart:convert';
import 'package:class_attendance/model/course.model.dart';
import 'package:http/http.dart' as http;

class CoursesController {
  Future<http.Response> create(Course course) async {
    String jsonModel = jsonEncode(course);
    var url = Uri.parse('https://classattendanceapi.azurewebsites.net/api/courses');

    final response = await http.post(url, body: jsonModel);
    return response;
  }

  Future<http.Response> getOne(int courseId) async {
    var baseUrl = 'https://classattendanceapi.azurewebsites.net/api/courses';

    Map<String, int> queryParams = {'courseId': courseId};
    String queryString = Uri(queryParameters: queryParams).query;

    String joinedUrl = baseUrl + '?' + queryString;
    var requestUrl = Uri.parse(joinedUrl);

    final response = await http.get(requestUrl, headers: {'content-type': 'application/json'});
    return response;
  }

  Future<http.Response> getAll() async {
    var url = Uri.parse('https://classattendanceapi.azurewebsites.net/api/courses');

    final response = await http.get(url);
    return response;
  }

  Future<http.Response> update(int courseId, Course course) async {
    var jsonModel = jsonEncode(course);

    var baseUrl = 'https://classattendanceapi.azurewebsites.net/api/courses';

    Map<String, int> queryParams = {'courseId': courseId};
    String queryString = Uri(queryParameters: queryParams).query;

    String joinedUrl = baseUrl + '?' + queryString;
    var requestUrl = Uri.parse(joinedUrl);

    final response = http.put(requestUrl, body: jsonModel);
    return response;
  }
}