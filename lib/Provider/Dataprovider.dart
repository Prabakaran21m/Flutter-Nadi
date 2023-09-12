import 'dart:core';
import 'package:code/Pojo/AlertPageResponse.dart';
import 'package:code/Pojo/JobUpdatesResponse.dart';
import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  JobUpdatesResponse? JouUpdate;
  List<Planned>? planned;
  String? department;

  JobUpdatesResponse? get JouUpdates => JouUpdate;

  List<Planned>? get PlannedValue => planned;

  String? get departmentvalue => department;

  void setLoginData(JobUpdatesResponse? data) {
    JouUpdate = data;
    notifyListeners();
  }

  void setPlannedData(List<Planned>? data) {
    planned = data;
    notifyListeners();
  }

  void setdatavalue(String? data) {
    department = data;
    notifyListeners();
  }
}
