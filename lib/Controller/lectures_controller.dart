import 'dart:convert';
import 'package:class_attendance/model/lecture.model.dart';
import 'package:http/http.dart' as http;

class LecturesController {
  Future<http.Response> create(Lecture lecture) async {
    String jsonModel = jsonEncode(lecture);
    var url = Uri.parse('https://classattendanceapi.azurewebsites.net/api/lectures');

    final response = await http.post(url, body: jsonModel);
    return response;
  }

  Future<http.Response> getOne(int lectureId) async {
    var baseUrl = 'https://classattendanceapi.azurewebsites.net/api/lectures';

    Map<String, int> queryParams = {'lectureId': lectureId};
    String queryString = Uri(queryParameters: queryParams).query;

    String joinedUrl = baseUrl + '?' + queryString;
    var requestUrl = Uri.parse(joinedUrl);

    final response = await http.get(requestUrl, headers: {'content-type': 'application/json'});
    return response;
  }

  Future<http.Response> getAll() async {
    var url = Uri.parse('https://classattendanceapi.azurewebsites.net/api/lectures');

    final response = await http.get(url);
    return response;
  }

  Future<http.Response> update(int lectureId, Lecture lecture) async {
    var jsonModel = jsonEncode(lecture);

    var baseUrl = 'https://classattendanceapi.azurewebsites.net/api/lectures';

    Map<String, int> queryParams = {'lectureId': lectureId};
    String queryString = Uri(queryParameters: queryParams).query;

    String joinedUrl = baseUrl + '?' + queryString;
    var requestUrl = Uri.parse(joinedUrl);

    final response = http.put(requestUrl, body: jsonModel);
    return response;
  }
}