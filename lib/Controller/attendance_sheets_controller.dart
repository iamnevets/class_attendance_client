import 'dart:convert';
import 'package:class_attendance/model/attendance/attendance_sheet.model.dart';
import 'package:http/http.dart' as http;

class AttendanceSheetsController {
  Future<http.Response> create(AttendanceSheet attendanceSheet) async {
    String jsonModel = jsonEncode(attendanceSheet);
    var url = Uri.parse('https://classattendanceapi.azurewebsites.net/api/attendancesheets');

    final response = await http.post(url, body: jsonModel);
    return response;
  }

  Future<http.Response> getOne(int attendanceSheetId) async {
    var baseUrl = 'https://classattendanceapi.azurewebsites.net/api/attendancesheets';

    Map<String, int> queryParams = {'attendanceSheetId': attendanceSheetId};
    String queryString = Uri(queryParameters: queryParams).query;

    String joinedUrl = baseUrl + '?' + queryString;
    var requestUrl = Uri.parse(joinedUrl);

    final response = await http.get(requestUrl, headers: {'content-type': 'application/json'});
    return response;
  }

  Future<http.Response> getAll() async {
    var url = Uri.parse('https://classattendanceapi.azurewebsites.net/api/attendancesheets');

    final response = await http.get(url);
    return response;
  }

  Future<http.Response> update(int attendanceSheetId, AttendanceSheet attendanceSheet) async {
    var jsonModel = jsonEncode(attendanceSheet);

    var baseUrl = 'https://classattendanceapi.azurewebsites.net/api/attendancesheets';

    Map<String, int> queryParams = {'attendanceSheetId': attendanceSheetId};
    String queryString = Uri(queryParameters: queryParams).query;

    String joinedUrl = baseUrl + '?' + queryString;
    var requestUrl = Uri.parse(joinedUrl);

    final response = http.put(requestUrl, body: jsonModel);
    return response;
  }
}