import '../../pie_data.dart';

class jobupdate {
  String? message;
  bool? error;
  List<JobUpdatesData>? data;

  jobupdate(this.message, this.error, this.data);

  jobupdate.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    if (json['Data'] != null) {
      data = <JobUpdatesData>[];
      json['Data'].forEach((v) {
        data!.add(new JobUpdatesData.fromJson(v));
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

class JobUpdatesData {
  List<Planned>? planned;
  List<Actual>? actual;
  List<Delayed>? delayed;

  JobUpdatesData({this.planned, this.actual, this.delayed});

  JobUpdatesData.fromJson(Map<String, dynamic> json) {
    if (json['Planned'] != null) {
      planned = <Planned>[];
      json['Planned'].forEach((v) {
        planned!.add(new Planned.fromJson(v));
      });
    }
    if (json['Actual'] != null) {
      actual = <Actual>[];
      json['Actual'].forEach((v) {
        actual!.add(new Actual.fromJson(v));
      });
    }
    if (json['Delayed'] != null) {
      delayed = <Delayed>[];
      json['Delayed'].forEach((v) {
        delayed!.add(new Delayed.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  String? orderQty;
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

class Delayed {
  String? jobNum;
  String? fanModel;
  String? orderQty;
  String? customerName;

  Delayed({this.jobNum, this.fanModel, this.orderQty, this.customerName});

  Delayed.fromJson(Map<String, dynamic> json) {
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

class Actual {
  String? jobNum;
  String? fanModel;
  String? orderQty;
  String? customerName;

  Actual({this.jobNum, this.fanModel, this.orderQty, this.customerName});

  Actual.fromJson(Map<String, dynamic> json) {
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

// jobUpadte 14 tabbar api respones in json to Dart:

class JobQuality {
  String? message;
  bool? error;
  List<Dataquantity>? data;

  JobQuality({this.message, this.error, this.data});

  JobQuality.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    if (json['Data'] != null) {
      data = <Dataquantity>[];
      json['Data'].forEach((v) {
        data!.add(new Dataquantity.fromJson(v));
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

class Dataquantity {
  int? Quantity;

  Dataquantity.fromJson(Map<String, dynamic> json) {
    Quantity = json['Quantity'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataQuantity = new Map<String, dynamic>();
    dataQuantity['Quantity'] = this.Quantity;
    return dataQuantity;
  }
}

class MyClass {
  String _name;
  List<int> _quantities;

  MyClass(this._name, this._quantities);

  String get name => _name;
  set name(String value) => _name = value;

  List<int> get quantities => _quantities;
  set quantities(List<int> value) => _quantities = value;
}
