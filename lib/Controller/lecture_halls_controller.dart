import 'dart:convert';
import 'package:class_attendance/model/lecture_hall.model.dart';
import 'package:http/http.dart' as http;

class LectureHallsController {
  Future<http.Response> create(LectureHall lectureHall) async {
    String jsonModel = jsonEncode(lectureHall);
    var url = Uri.parse('https://classattendanceapi.azurewebsites.net/api/lecturehalls');

    final response = await http.post(url, body: jsonModel);
    return response;
  }

  Future<http.Response> getOne(int lecturehallId) async {
    var baseUrl = 'https://classattendanceapi.azurewebsites.net/api/lecturehalls';

    Map<String, int> queryParams = {'lecturehallId': lecturehallId};
    String queryString = Uri(queryParameters: queryParams).query;

    String joinedUrl = baseUrl + '?' + queryString;
    var requestUrl = Uri.parse(joinedUrl);

    final response = await http.get(requestUrl, headers: {'content-type': 'application/json'});
    return response;
  }

  Future<http.Response> getAll() async {
    var url = Uri.parse('https://classattendanceapi.azurewebsites.net/api/lecturehalls');

    final response = await http.get(url);
    return response;
  }

  Future<http.Response> update(int lecturehallId, LectureHall lectureHall) async {
    var jsonModel = jsonEncode(lectureHall);

    var baseUrl = 'https://classattendanceapi.azurewebsites.net/api/lecturehalls';

    Map<String, int> queryParams = {'lecturehallId': lecturehallId};
    String queryString = Uri(queryParameters: queryParams).query;

    String joinedUrl = baseUrl + '?' + queryString;
    var requestUrl = Uri.parse(joinedUrl);

    final response = http.put(requestUrl, body: jsonModel);
    return response;
  }
}