import 'dart:convert';

import 'package:class_attendance/model/timetable.model.dart';
import 'package:http/http.dart' as http;

class TimeTablesController {
  Future<http.Response> create(TimeTable timeTable) async {
    String jsonModel = jsonEncode(TimeTable);
    var url = Uri.parse('https://classattendanceapi.azurewebsites.net/api/timetables');

    final response = await http.post(url, body: jsonModel);
    return response;
  }

  Future<http.Response> getOne(int timeTableId) async {
    var baseUrl = 'https://classattendanceapi.azurewebsites.net/api/timetables';

    Map<String, int> queryParams = {'timeTableId': timeTableId};
    String queryString = Uri(queryParameters: queryParams).query;

    String joinedUrl = baseUrl + '?' + queryString;
    var requestUrl = Uri.parse(joinedUrl);

    final response = await http.get(requestUrl, headers: {'content-type': 'application/json'});
    return response;
  }

  Future<http.Response> getAll() async {
    var url = Uri.parse('https://classattendanceapi.azurewebsites.net/api/timetables');

    final response = await http.get(url);
    return response;
  }

  Future<http.Response> update(int timeTableId, TimeTable timeTable) async {
    var jsonModel = jsonEncode(timeTable);

    var baseUrl = 'https://classattendanceapi.azurewebsites.net/api/timetables';

    Map<String, int> queryParams = {'timeTableId': timeTableId};
    String queryString = Uri(queryParameters: queryParams).query;

    String joinedUrl = baseUrl + '?' + queryString;
    var requestUrl = Uri.parse(joinedUrl);

    final response = http.put(requestUrl, body: jsonModel);
    return response;
  }
}