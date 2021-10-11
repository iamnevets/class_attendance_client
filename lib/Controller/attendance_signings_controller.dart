import 'dart:convert';
import 'package:class_attendance/model/attendance/attendance_signing.model.dart';
import 'package:http/http.dart' as http;

class AttendanceSigningsController {
  Future<http.Response> create(AttendanceSigning attendanceSigning) async {
    String jsonModel = jsonEncode(attendanceSigning);
    var url = Uri.parse('https://classattendanceapi.azurewebsites.net/api/attendancesignings');

    final response = await http.post(url, body: jsonModel);
    return response;
  }

  Future<http.Response> getOne(int attendanceSigningId) async {
    var baseUrl = 'https://classattendanceapi.azurewebsites.net/api/attendancesignings';

    Map<String, int> queryParams = {'attendanceSigningId': attendanceSigningId};
    String queryString = Uri(queryParameters: queryParams).query;

    String joinedUrl = baseUrl + '?' + queryString;
    var requestUrl = Uri.parse(joinedUrl);

    final response = await http.get(requestUrl, headers: {'content-type': 'application/json'});
    return response;
  }

  Future<http.Response> getAll() async {
    var url = Uri.parse('https://classattendanceapi.azurewebsites.net/api/attendancesignings');

    final response = await http.get(url);
    return response;
  }

  Future<http.Response> update(int attendanceSigningId, AttendanceSigning attendanceSigning) async {
    var jsonModel = jsonEncode(attendanceSigning);

    var baseUrl = 'https://classattendanceapi.azurewebsites.net/api/attendancesignings';

    Map<String, int> queryParams = {'attendanceSigningId': attendanceSigningId};
    String queryString = Uri(queryParameters: queryParams).query;

    String joinedUrl = baseUrl + '?' + queryString;
    var requestUrl = Uri.parse(joinedUrl);

    final response = http.put(requestUrl, body: jsonModel);
    return response;
  }
}