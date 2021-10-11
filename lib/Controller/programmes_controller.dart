import 'dart:convert';
import 'package:class_attendance/model/programme.model.dart';
import 'package:http/http.dart' as http;

class ProgrammesController {
  Future<http.Response> create(Programme programme) async {
    String jsonModel = jsonEncode(programme);
    var url = Uri.parse('https://classattendanceapi.azurewebsites.net/api/programmes');

    final response = await http.post(url, body: jsonModel);
    return response;
  }

  Future<http.Response> getOne(int programmeId) async {
    var baseUrl = 'https://classattendanceapi.azurewebsites.net/api/programmes';

    Map<String, int> queryParams = {'programmeId': programmeId};
    String queryString = Uri(queryParameters: queryParams).query;

    String joinedUrl = baseUrl + '?' + queryString;
    var requestUrl = Uri.parse(joinedUrl);

    final response = await http.get(requestUrl, headers: {'content-type': 'application/json'});
    return response;
  }

  Future<http.Response> getAll() async {
    var url = Uri.parse('https://classattendanceapi.azurewebsites.net/api/programmes');

    final response = await http.get(url);
    return response;
  }

  Future<http.Response> update(int programmeId, Programme programme) async {
    var jsonModel = jsonEncode(programme);

    var baseUrl = 'https://classattendanceapi.azurewebsites.net/api/programmes';

    Map<String, int> queryParams = {'programmeId': programmeId};
    String queryString = Uri(queryParameters: queryParams).query;

    String joinedUrl = baseUrl + '?' + queryString;
    var requestUrl = Uri.parse(joinedUrl);

    final response = http.put(requestUrl, body: jsonModel);
    return response;
  }
}