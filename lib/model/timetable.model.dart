import 'package:class_attendance/model/class_group.model.dart';
import 'package:class_attendance/model/course.model.dart';

class TimeTable {
  int id = 0;
  int? classGroupId;
  ClassGroup? classGroup;
  List<TimeTableOutline>? outline;

  TimeTable(this.id, this.classGroupId, this.classGroup, this.outline);

  TimeTable.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    classGroupId = json['classGroupId'];
    classGroup = json['classGroup'] != null ? ClassGroup.fromJson(json['classGroup']) : null;
    if (json['outline'] == null) {
      outline = [];
    } else {
      (json['outline'] as List).map((e) => TimeTableOutline.fromJson(e)).toList().forEach((tableOutline) {
        outline!.add(tableOutline);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['classGroupId'] = classGroupId;
    if (classGroup != null) {
      data['classGroup'] = classGroup!.toJson();
    }
    data['outline'] = outline!.map((e) => e.toJson()).toList();
    return data;
  }
}

class TimeTableOutline {
  int id = 0;
  DayOfTheWeek? day;
  String? time;
  int? courseId;
  Course? course;
  List<TimeTable>? timeTables;

  TimeTableOutline(this.id, this.day, this.time, this.courseId, this.course, this.timeTables);

  TimeTableOutline.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    day = json['day'];
    courseId = json['courseId'];
    course = json['course'] != null ? Course.fromJson(json['course']) : null;
    if (json['timeTables'] == null) {
      timeTables = [];
    } else {
      (json['timeTables'] as List).map((e) => TimeTable.fromJson(e)).toList().forEach((timeTable) {
        timeTables!.add(timeTable);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['day'] = day;
    data['time'] = time;
    data['courseId'] = courseId;
    if (course != null) {
      data['course'] = course!.toJson();
    }
    data['timeTables'] = timeTables!.map((e) => e.toJson()).toList();
    return data;
  }
}

enum DayOfTheWeek { monday, tuesday, wednesday, thursday, friday }
