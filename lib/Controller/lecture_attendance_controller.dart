import 'dart:convert';
import 'package:class_attendance/model/lecture_attendance.model.dart';
import 'package:http/http.dart' as http;

class LectureAttendanceController {
  Future<http.Response> create(LectureAttendance lectureAttendance) async {
    String jsonModel = jsonEncode(lectureAttendance);
    var url = Uri.parse('https://classattendanceapi.azurewebsites.net/api/lectureattendances');

    final response = await http.post(url, headers: {'content-type': 'application/json'}, body: jsonModel);
    return response;
  }

  Future<http.Response> getOne(int lectureAttendanceId) async {
    var baseUrl = 'https://classattendanceapi.azurewebsites.net/api/lectureattendances';

    Map<String, int> queryParams = {'lectureAttendanceId': lectureAttendanceId};
    String queryString = Uri(queryParameters: queryParams).query;

    String joinedUrl = baseUrl + '?' + queryString;
    var requestUrl = Uri.parse(joinedUrl);

    final response = await http.get(requestUrl, headers: {'content-type': 'application/json'});
    return response;
  }

  Future<http.Response> getAll() async {
    var url = Uri.parse('https://classattendanceapi.azurewebsites.net/api/lectureattendances');

    final response = await http.get(url);
    return response;
  }

  Future<http.Response> update(int lectureAttendanceId, LectureAttendance lectureAttendance) async {
    var jsonModel = jsonEncode(lectureAttendance);

    var baseUrl = 'https://classattendanceapi.azurewebsites.net/api/lectureattendances';

    Map<String, int> queryParams = {'lectureAttendanceId': lectureAttendanceId};
    String queryString = Uri(queryParameters: queryParams).query;

    String joinedUrl = baseUrl + '?' + queryString;
    var requestUrl = Uri.parse(joinedUrl);

    final response = http.put(requestUrl, body: jsonModel);
    return response;
  }
}