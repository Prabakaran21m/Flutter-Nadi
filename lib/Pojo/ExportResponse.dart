class CommonExportResponse {
  String? message;
  bool? error;
  List<PlannedProduction>? plannedProduction;
  List<ActualProduction>? actualProduction;
  List<DelayedProduction>? delayedProduction;
  List<PlannedProduction>? plannedMom;
  List<ActualProduction>? actualMom;
  List<DelayedProduction>? delayedMom;
  List<PlannedProduction>? plannedCnc;
  List<ActualProduction>? actualCnc;
  List<DelayedProduction>? delayedCnc;
  List<PlannedProduction>? plannedHub;
  List<ActualProduction>? actualHub;
  List<DelayedProduction>? delayedHub;
  List<PlannedProduction>? plannedMachining;
  List<ActualProduction>? actualMachining;
  List<DelayedProduction>? delayedMachining;
  List<PlannedProduction>? plannedImpeller;
  List<ActualProduction>? actualImpeller;
  List<DelayedProduction>? delayedImpeller;
  List<PlannedProduction>? plannedCasing;
  List<ActualProduction>? actualCasing;
  List<DelayedProduction>? delayedCasing;
  List<PlannedProduction>? plannedAccessories;
  List<ActualProduction>? actualAccessories;
  List<DelayedProduction>? delayedAccessories;
  List<PlannedProduction>? plannedFcp;
  List<ActualProduction>? actualFcp;
  List<DelayedProduction>? delayedFcp;
  List<PlannedProduction>? plannedAssembly;
  List<ActualProduction>? actualAssembly;
  List<DelayedProduction>? delayedAssembly;
  List<PlannedProduction>? plannedTesting;
  List<ActualProduction>? actualTesting;
  List<DelayedProduction>? delayedTesting;
  List<PlannedProduction>? plannedFinalPaint;
  List<ActualProduction>? actualFinalPaint;
  List<DelayedProduction>? delayedFinalPaint;
  List<PlannedProduction>? plannedPacking;
  List<ActualProduction>? actualPacking;
  List<DelayedProduction>? delayedPacking;
  List<PlannedProduction>? plannedDispatch;
  List<ActualProduction>? actualDispatch;
  List<DelayedProduction>? delayedDispatch;

  CommonExportResponse(
      {this.message,
      this.error,
      this.plannedProduction,
      this.actualProduction,
      this.delayedProduction,
      this.plannedMom,
      this.actualMom,
      this.delayedMom,
      this.plannedCnc,
      this.actualCnc,
      this.delayedCnc,
      this.plannedHub,
      this.actualHub,
      this.delayedHub,
      this.plannedMachining,
      this.actualMachining,
      this.delayedMachining,
      this.plannedImpeller,
      this.actualImpeller,
      this.delayedImpeller,
      this.plannedCasing,
      this.actualCasing,
      this.delayedCasing,
      this.plannedAccessories,
      this.actualAccessories,
      this.delayedAccessories,
      this.plannedFcp,
      this.actualFcp,
      this.delayedFcp,
      this.plannedAssembly,
      this.actualAssembly,
      this.delayedAssembly,
      this.plannedTesting,
      this.actualTesting,
      this.delayedTesting,
      this.plannedFinalPaint,
      this.actualFinalPaint,
      this.delayedFinalPaint,
      this.plannedPacking,
      this.actualPacking,
      this.delayedPacking,
      this.plannedDispatch,
      this.actualDispatch,
      this.delayedDispatch});

  CommonExportResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    if (json['PlannedProduction'] != null) {
      plannedProduction = <PlannedProduction>[];
      json['PlannedProduction'].forEach((v) {
        plannedProduction!.add(new PlannedProduction.fromJson(v));
      });
    }
    if (json['ActualProduction'] != null) {
      actualProduction = <ActualProduction>[];
      json['ActualProduction'].forEach((v) {
        actualProduction!.add(new ActualProduction.fromJson(v));
      });
    }
    if (json['DelayedProduction'] != null) {
      delayedProduction = <DelayedProduction>[];
      json['DelayedProduction'].forEach((v) {
        delayedProduction!.add(new DelayedProduction.fromJson(v));
      });
    }
    if (json['PlannedMom'] != null) {
      plannedMom = <PlannedProduction>[];
      json['PlannedMom'].forEach((v) {
        plannedMom!.add(new PlannedProduction.fromJson(v));
      });
    }
    if (json['ActualMom'] != null) {
      actualMom = <ActualProduction>[];
      json['ActualMom'].forEach((v) {
        actualMom!.add(new ActualProduction.fromJson(v));
      });
    }
    if (json['DelayedMom'] != null) {
      delayedMom = <DelayedProduction>[];
      json['DelayedMom'].forEach((v) {
        delayedMom!.add(new DelayedProduction.fromJson(v));
      });
    }
    if (json['PlannedCnc'] != null) {
      plannedCnc = <PlannedProduction>[];
      json['PlannedCnc'].forEach((v) {
        plannedCnc!.add(new PlannedProduction.fromJson(v));
      });
    }
    if (json['ActualCnc'] != null) {
      actualCnc = <ActualProduction>[];
      json['ActualCnc'].forEach((v) {
        actualCnc!.add(new ActualProduction.fromJson(v));
      });
    }
    if (json['DelayedCnc'] != null) {
      delayedCnc = <DelayedProduction>[];
      json['DelayedCnc'].forEach((v) {
        delayedCnc!.add(new DelayedProduction.fromJson(v));
      });
    }
    if (json['PlannedHub'] != null) {
      plannedHub = <PlannedProduction>[];
      json['PlannedHub'].forEach((v) {
        plannedHub!.add(new PlannedProduction.fromJson(v));
      });
    }
    if (json['ActualHub'] != null) {
      actualHub = <ActualProduction>[];
      json['ActualHub'].forEach((v) {
        actualHub!.add(new ActualProduction.fromJson(v));
      });
    }
    if (json['DelayedHub'] != null) {
      delayedHub = <DelayedProduction>[];
      json['DelayedHub'].forEach((v) {
        delayedHub!.add(new DelayedProduction.fromJson(v));
      });
    }
    if (json['PlannedMachining'] != null) {
      plannedMachining = <PlannedProduction>[];
      json['PlannedMachining'].forEach((v) {
        plannedMachining!.add(new PlannedProduction.fromJson(v));
      });
    }
    if (json['ActualMachining'] != null) {
      actualMachining = <ActualProduction>[];
      json['ActualMachining'].forEach((v) {
        actualMachining!.add(new ActualProduction.fromJson(v));
      });
    }
    if (json['DelayedMachining'] != null) {
      delayedMachining = <DelayedProduction>[];
      json['DelayedMachining'].forEach((v) {
        delayedMachining!.add(new DelayedProduction.fromJson(v));
      });
    }
    if (json['PlannedImpeller'] != null) {
      plannedImpeller = <PlannedProduction>[];
      json['PlannedImpeller'].forEach((v) {
        plannedImpeller!.add(new PlannedProduction.fromJson(v));
      });
    }
    if (json['ActualImpeller'] != null) {
      actualImpeller = <ActualProduction>[];
      json['ActualImpeller'].forEach((v) {
        actualImpeller!.add(new ActualProduction.fromJson(v));
      });
    }
    if (json['DelayedImpeller'] != null) {
      delayedImpeller = <DelayedProduction>[];
      json['DelayedImpeller'].forEach((v) {
        delayedImpeller!.add(new DelayedProduction.fromJson(v));
      });
    }
    if (json['PlannedCasing'] != null) {
      plannedCasing = <PlannedProduction>[];
      json['PlannedCasing'].forEach((v) {
        plannedCasing!.add(new PlannedProduction.fromJson(v));
      });
    }
    if (json['ActualCasing'] != null) {
      actualCasing = <ActualProduction>[];
      json['ActualCasing'].forEach((v) {
        actualCasing!.add(new ActualProduction.fromJson(v));
      });
    }
    if (json['DelayedCasing'] != null) {
      delayedCasing = <DelayedProduction>[];
      json['DelayedCasing'].forEach((v) {
        delayedCasing!.add(new DelayedProduction.fromJson(v));
      });
    }
    if (json['PlannedAccessories'] != null) {
      plannedAccessories = <PlannedProduction>[];
      json['PlannedAccessories'].forEach((v) {
        plannedAccessories!.add(new PlannedProduction.fromJson(v));
      });
    }
    if (json['ActualAccessories'] != null) {
      actualAccessories = <ActualProduction>[];
      json['ActualAccessories'].forEach((v) {
        actualAccessories!.add(new ActualProduction.fromJson(v));
      });
    }
    if (json['DelayedAccessories'] != null) {
      delayedAccessories = <DelayedProduction>[];
      json['DelayedAccessories'].forEach((v) {
        delayedAccessories!.add(new DelayedProduction.fromJson(v));
      });
    }
    if (json['PlannedFcp'] != null) {
      plannedFcp = <PlannedProduction>[];
      json['PlannedFcp'].forEach((v) {
        plannedFcp!.add(new PlannedProduction.fromJson(v));
      });
    }
    if (json['ActualFcp'] != null) {
      actualFcp = <ActualProduction>[];
      json['ActualFcp'].forEach((v) {
        actualFcp!.add(new ActualProduction.fromJson(v));
      });
    }
    if (json['DelayedFcp'] != null) {
      delayedFcp = <DelayedProduction>[];
      json['DelayedFcp'].forEach((v) {
        delayedFcp!.add(new DelayedProduction.fromJson(v));
      });
    }
    if (json['PlannedAssembly'] != null) {
      plannedAssembly = <PlannedProduction>[];
      json['PlannedAssembly'].forEach((v) {
        plannedAssembly!.add(new PlannedProduction.fromJson(v));
      });
    }
    if (json['ActualAssembly'] != null) {
      actualAssembly = <ActualProduction>[];
      json['ActualAssembly'].forEach((v) {
        actualAssembly!.add(new ActualProduction.fromJson(v));
      });
    }
    if (json['DelayedAssembly'] != null) {
      delayedAssembly = <DelayedProduction>[];
      json['DelayedAssembly'].forEach((v) {
        delayedAssembly!.add(new DelayedProduction.fromJson(v));
      });
    }
    if (json['PlannedTesting'] != null) {
      plannedTesting = <PlannedProduction>[];
      json['PlannedTesting'].forEach((v) {
        plannedTesting!.add(new PlannedProduction.fromJson(v));
      });
    }
    if (json['ActualTesting'] != null) {
      actualTesting = <ActualProduction>[];
      json['ActualTesting'].forEach((v) {
        actualTesting!.add(new ActualProduction.fromJson(v));
      });
    }
    if (json['DelayedTesting'] != null) {
      delayedTesting = <DelayedProduction>[];
      json['DelayedTesting'].forEach((v) {
        delayedTesting!.add(new DelayedProduction.fromJson(v));
      });
    }
    if (json['PlannedFinalPaint'] != null) {
      plannedFinalPaint = <PlannedProduction>[];
      json['PlannedFinalPaint'].forEach((v) {
        plannedFinalPaint!.add(new PlannedProduction.fromJson(v));
      });
    }
    if (json['ActualFinalPaint'] != null) {
      actualFinalPaint = <ActualProduction>[];
      json['ActualFinalPaint'].forEach((v) {
        actualFinalPaint!.add(new ActualProduction.fromJson(v));
      });
    }
    if (json['DelayedFinalPaint'] != null) {
      delayedFinalPaint = <DelayedProduction>[];
      json['DelayedFinalPaint'].forEach((v) {
        delayedFinalPaint!.add(new DelayedProduction.fromJson(v));
      });
    }
    if (json['PlannedPacking'] != null) {
      plannedPacking = <PlannedProduction>[];
      json['PlannedPacking'].forEach((v) {
        plannedPacking!.add(new PlannedProduction.fromJson(v));
      });
    }
    if (json['ActualPacking'] != null) {
      actualPacking = <ActualProduction>[];
      json['ActualPacking'].forEach((v) {
        actualPacking!.add(new ActualProduction.fromJson(v));
      });
    }
    if (json['DelayedPacking'] != null) {
      delayedPacking = <DelayedProduction>[];
      json['DelayedPacking'].forEach((v) {
        delayedPacking!.add(new DelayedProduction.fromJson(v));
      });
    }
    if (json['PlannedDispatch'] != null) {
      plannedDispatch = <PlannedProduction>[];
      json['PlannedDispatch'].forEach((v) {
        plannedDispatch!.add(new PlannedProduction.fromJson(v));
      });
    }
    if (json['ActualDispatch'] != null) {
      actualDispatch = <ActualProduction>[];
      json['ActualDispatch'].forEach((v) {
        actualDispatch!.add(new ActualProduction.fromJson(v));
      });
    }
    if (json['DelayedDispatch'] != null) {
      delayedDispatch = <DelayedProduction>[];
      json['DelayedDispatch'].forEach((v) {
        delayedDispatch!.add(new DelayedProduction.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['error'] = this.error;
    if (this.plannedProduction != null) {
      data['PlannedProduction'] =
          this.plannedProduction!.map((v) => v.toJson()).toList();
    }
    if (this.actualProduction != null) {
      data['ActualProduction'] =
          this.actualProduction!.map((v) => v.toJson()).toList();
    }
    if (this.delayedProduction != null) {
      data['DelayedProduction'] =
          this.delayedProduction!.map((v) => v.toJson()).toList();
    }
    if (this.plannedMom != null) {
      data['PlannedMom'] = this.plannedMom!.map((v) => v.toJson()).toList();
    }
    if (this.actualMom != null) {
      data['ActualMom'] = this.actualMom!.map((v) => v.toJson()).toList();
    }
    if (this.delayedMom != null) {
      data['DelayedMom'] = this.delayedMom!.map((v) => v.toJson()).toList();
    }
    if (this.plannedCnc != null) {
      data['PlannedCnc'] = this.plannedCnc!.map((v) => v.toJson()).toList();
    }
    if (this.actualCnc != null) {
      data['ActualCnc'] = this.actualCnc!.map((v) => v.toJson()).toList();
    }
    if (this.delayedCnc != null) {
      data['DelayedCnc'] = this.delayedCnc!.map((v) => v.toJson()).toList();
    }
    if (this.plannedHub != null) {
      data['PlannedHub'] = this.plannedHub!.map((v) => v.toJson()).toList();
    }
    if (this.actualHub != null) {
      data['ActualHub'] = this.actualHub!.map((v) => v.toJson()).toList();
    }
    if (this.delayedHub != null) {
      data['DelayedHub'] = this.delayedHub!.map((v) => v.toJson()).toList();
    }
    if (this.plannedMachining != null) {
      data['PlannedMachining'] =
          this.plannedMachining!.map((v) => v.toJson()).toList();
    }
    if (this.actualMachining != null) {
      data['ActualMachining'] =
          this.actualMachining!.map((v) => v.toJson()).toList();
    }
    if (this.delayedMachining != null) {
      data['DelayedMachining'] =
          this.delayedMachining!.map((v) => v.toJson()).toList();
    }
    if (this.plannedImpeller != null) {
      data['PlannedImpeller'] =
          this.plannedImpeller!.map((v) => v.toJson()).toList();
    }
    if (this.actualImpeller != null) {
      data['ActualImpeller'] =
          this.actualImpeller!.map((v) => v.toJson()).toList();
    }
    if (this.delayedImpeller != null) {
      data['DelayedImpeller'] =
          this.delayedImpeller!.map((v) => v.toJson()).toList();
    }
    if (this.plannedCasing != null) {
      data['PlannedCasing'] =
          this.plannedCasing!.map((v) => v.toJson()).toList();
    }
    if (this.actualCasing != null) {
      data['ActualCasing'] = this.actualCasing!.map((v) => v.toJson()).toList();
    }
    if (this.delayedCasing != null) {
      data['DelayedCasing'] =
          this.delayedCasing!.map((v) => v.toJson()).toList();
    }
    if (this.plannedAccessories != null) {
      data['PlannedAccessories'] =
          this.plannedAccessories!.map((v) => v.toJson()).toList();
    }
    if (this.actualAccessories != null) {
      data['ActualAccessories'] =
          this.actualAccessories!.map((v) => v.toJson()).toList();
    }
    if (this.delayedAccessories != null) {
      data['DelayedAccessories'] =
          this.delayedAccessories!.map((v) => v.toJson()).toList();
    }
    if (this.plannedFcp != null) {
      data['PlannedFcp'] = this.plannedFcp!.map((v) => v.toJson()).toList();
    }
    if (this.actualFcp != null) {
      data['ActualFcp'] = this.actualFcp!.map((v) => v.toJson()).toList();
    }
    if (this.delayedFcp != null) {
      data['DelayedFcp'] = this.delayedFcp!.map((v) => v.toJson()).toList();
    }
    if (this.plannedAssembly != null) {
      data['PlannedAssembly'] =
          this.plannedAssembly!.map((v) => v.toJson()).toList();
    }
    if (this.actualAssembly != null) {
      data['ActualAssembly'] =
          this.actualAssembly!.map((v) => v.toJson()).toList();
    }
    if (this.delayedAssembly != null) {
      data['DelayedAssembly'] =
          this.delayedAssembly!.map((v) => v.toJson()).toList();
    }
    if (this.plannedTesting != null) {
      data['PlannedTesting'] =
          this.plannedTesting!.map((v) => v.toJson()).toList();
    }
    if (this.actualTesting != null) {
      data['ActualTesting'] =
          this.actualTesting!.map((v) => v.toJson()).toList();
    }
    if (this.delayedTesting != null) {
      data['DelayedTesting'] =
          this.delayedTesting!.map((v) => v.toJson()).toList();
    }
    if (this.plannedFinalPaint != null) {
      data['PlannedFinalPaint'] =
          this.plannedFinalPaint!.map((v) => v.toJson()).toList();
    }
    if (this.actualFinalPaint != null) {
      data['ActualFinalPaint'] =
          this.actualFinalPaint!.map((v) => v.toJson()).toList();
    }
    if (this.delayedFinalPaint != null) {
      data['DelayedFinalPaint'] =
          this.delayedFinalPaint!.map((v) => v.toJson()).toList();
    }
    if (this.plannedPacking != null) {
      data['PlannedPacking'] =
          this.plannedPacking!.map((v) => v.toJson()).toList();
    }
    if (this.actualPacking != null) {
      data['ActualPacking'] =
          this.actualPacking!.map((v) => v.toJson()).toList();
    }
    if (this.delayedPacking != null) {
      data['DelayedPacking'] =
          this.delayedPacking!.map((v) => v.toJson()).toList();
    }
    if (this.plannedDispatch != null) {
      data['PlannedDispatch'] =
          this.plannedDispatch!.map((v) => v.toJson()).toList();
    }
    if (this.actualDispatch != null) {
      data['ActualDispatch'] =
          this.actualDispatch!.map((v) => v.toJson()).toList();
    }
    if (this.delayedDispatch != null) {
      data['DelayedDispatch'] =
          this.delayedDispatch!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PlannedProduction {
  int? orderId;
  String? orderNumber;
  String? jobNumber;
  String? fanModel;
  String? orderDate;
  String? jobReleaseDate;
  String? customerName;
  int? orderQty;
  String? unitPrice;
  String? totalValue;
  String? plannedDate;

  PlannedProduction(
      {this.orderId,
      this.orderNumber,
      this.jobNumber,
      this.fanModel,
      this.orderDate,
      this.jobReleaseDate,
      this.customerName,
      this.orderQty,
      this.unitPrice,
      this.totalValue,
      this.plannedDate});

  PlannedProduction.fromJson(Map<String, dynamic> json) {
    orderId = json['OrderId'];
    orderNumber = json['OrderNumber'];
    jobNumber = json['JobNumber'];
    fanModel = json['FanModel'];
    orderDate = json['OrderDate'];
    jobReleaseDate = json['JobReleaseDate'];
    customerName = json['CustomerName'];
    orderQty = json['OrderQty'];
    unitPrice = json['UnitPrice'];
    totalValue = json['TotalValue'];
    plannedDate = json['PlannedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['OrderId'] = this.orderId;
    data['OrderNumber'] = this.orderNumber;
    data['JobNumber'] = this.jobNumber;
    data['FanModel'] = this.fanModel;
    data['OrderDate'] = this.orderDate;
    data['JobReleaseDate'] = this.jobReleaseDate;
    data['CustomerName'] = this.customerName;
    data['OrderQty'] = this.orderQty;
    data['UnitPrice'] = this.unitPrice;
    data['TotalValue'] = this.totalValue;
    data['PlannedDate'] = this.plannedDate;
    return data;
  }
}

class ActualProduction {
  int? orderId;
  String? orderNumber;
  String? jobNumber;
  String? fanModel;
  String? orderDate;
  String? jobReleaseDate;
  String? customerName;
  int? orderQty;
  String? unitPrice;
  String? totalValue;
  String? plannedDate;
  String? actualDate;
  String? delayedDays;

  ActualProduction(
      {this.orderId,
      this.orderNumber,
      this.jobNumber,
      this.fanModel,
      this.orderDate,
      this.jobReleaseDate,
      this.customerName,
      this.orderQty,
      this.unitPrice,
      this.totalValue,
      this.plannedDate,
      this.actualDate,
      this.delayedDays});

  ActualProduction.fromJson(Map<String, dynamic> json) {
    orderId = json['OrderId'];
    orderNumber = json['OrderNumber'];
    jobNumber = json['JobNumber'];
    fanModel = json['FanModel'];
    orderDate = json['OrderDate'];
    jobReleaseDate = json['JobReleaseDate'];
    customerName = json['CustomerName'];
    orderQty = json['OrderQty'];
    unitPrice = json['UnitPrice'];
    totalValue = json['TotalValue'];
    plannedDate = json['PlannedDate'];
    actualDate = json['ActualDate'];
    delayedDays = json['DelayedDays'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['OrderId'] = this.orderId;
    data['OrderNumber'] = this.orderNumber;
    data['JobNumber'] = this.jobNumber;
    data['FanModel'] = this.fanModel;
    data['OrderDate'] = this.orderDate;
    data['JobReleaseDate'] = this.jobReleaseDate;
    data['CustomerName'] = this.customerName;
    data['OrderQty'] = this.orderQty;
    data['UnitPrice'] = this.unitPrice;
    data['TotalValue'] = this.totalValue;
    data['PlannedDate'] = this.plannedDate;
    data['ActualDate'] = this.actualDate;
    data['DelayedDays'] = this.delayedDays;
    return data;
  }
}

class DelayedProduction {
  dynamic? orderId;
  dynamic? orderNumber;
  dynamic? jobNumber;
  dynamic? fanModel;
  dynamic? orderDate;
  dynamic? jobReleaseDate;
  dynamic? customerName;
  dynamic? orderQty;
  dynamic? unitPrice;
  dynamic? totalValue;
  dynamic? plannedDate;

  DelayedProduction(
      {this.orderId,
      this.orderNumber,
      this.jobNumber,
      this.fanModel,
      this.orderDate,
      this.jobReleaseDate,
      this.customerName,
      this.orderQty,
      this.unitPrice,
      this.totalValue,
      this.plannedDate});

  DelayedProduction.fromJson(Map<String, dynamic> json) {
    orderId = json['OrderId'];
    orderNumber = json['OrderNumber'];
    jobNumber = json['JobNumber'];
    fanModel = json['FanModel'];
    orderDate = json['OrderDate'];
    jobReleaseDate = json['JobReleaseDate'];
    customerName = json['CustomerName'];
    orderQty = json['OrderQty'];
    unitPrice = json['UnitPrice'];
    totalValue = json['TotalValue'];
    plannedDate = json['PlannedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['OrderId'] = this.orderId;
    data['OrderNumber'] = this.orderNumber;
    data['JobNumber'] = this.jobNumber;
    data['FanModel'] = this.fanModel;
    data['OrderDate'] = this.orderDate;
    data['JobReleaseDate'] = this.jobReleaseDate;
    data['CustomerName'] = this.customerName;
    data['OrderQty'] = this.orderQty;
    data['UnitPrice'] = this.unitPrice;
    data['TotalValue'] = this.totalValue;
    data['PlannedDate'] = this.plannedDate;
    return data;
  }
}
