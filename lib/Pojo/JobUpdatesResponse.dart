import '../Json_Response/DashBoard/JobUpdates.dart';

class JobUpdatesResponse {
  String? message;
  bool? error;
  List<Data>? data;

  JobUpdatesResponse({this.message, this.error, this.data});

  JobUpdatesResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['error'] = this.error;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? department;
  List<Planned>? planned = [];
  List<Planned>? actual = [];
  List<Planned>? delayed = [];

  Data({this.department, this.planned, this.actual, this.delayed});

  Data.fromJson(Map<String, dynamic> json) {
    department = json['Department'];
    if (json['Planned'] != null) {
      planned = <Planned>[];
      json['Planned'].forEach((v) {
        planned!.add(new Planned.fromJson(v));
      });
    }
    if (json['Actual'] != null) {
      actual = <Planned>[];
      json['Actual'].forEach((v) {
        actual!.add(new Planned.fromJson(v));
      });
    }
    if (json['Delayed'] != null) {
      delayed = <Planned>[];
      json['Delayed'].forEach((v) {
        delayed!.add(new Planned.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Department'] = this.department;
    if (this.planned != null) {
      data['Planned'] = this.planned!.map((v) => v.toJson()).toList();
    }
    if (this.actual != null) {
      data['Actual'] = this.actual!.map((v) => v.toJson()).toList();
    }
    if (this.delayed != null) {
      data['Delayed'] = this.delayed!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Planned {
  String? jobNum;
  String? fanModel;
  dynamic? orderQty;
  String? customerName;

  Planned({this.jobNum, this.fanModel, this.orderQty, this.customerName});

  Planned.fromJson(Map<String, dynamic> json) {
    jobNum = json['job_num'];
    fanModel = json['FanModel'];
    orderQty = json['OrderQty'];
    customerName = json['CustomerName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['job_num'] = this.jobNum;
    data['FanModel'] = this.fanModel;
    data['OrderQty'] = this.orderQty;
    data['CustomerName'] = this.customerName;
    return data;
  }
}
