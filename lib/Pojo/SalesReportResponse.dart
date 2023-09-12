class SalesReportResponse {
  String? message;
  bool? error;
  SalesData? data;

  SalesReportResponse({this.message, this.error, this.data});

  SalesReportResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    data = json['data'] != null ? new SalesData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class SalesData {
  Domestic? domestic;
  Alstom? alstom;
  WabtecIndia? wabtecIndia;
  WabtecUSA? wabtecUSA;
  Export? export;
  Miscellaneous? miscellaneous;
  GrandTotal? grandTotal;

  SalesData(
      {this.domestic,
        this.alstom,
        this.wabtecIndia,
        this.wabtecUSA,
        this.export,
        this.miscellaneous,
        this.grandTotal});

  SalesData.fromJson(Map<String, dynamic> json) {
    domestic = json['Domestic'] != null
        ? new Domestic.fromJson(json['Domestic'])
        : null;
    alstom =
    json['Alstom'] != null ? new Alstom.fromJson(json['Alstom']) : null;
    wabtecIndia = json['Wabtec India'] != null
        ? new WabtecIndia.fromJson(json['Wabtec India'])
        : null;
    wabtecUSA = json['Wabtec USA'] != null
        ? new WabtecUSA.fromJson(json['Wabtec USA'])
        : null;
    export =
    json['Export'] != null ? new Export.fromJson(json['Export']) : null;
    miscellaneous = json['Miscellaneous'] != null
        ? new Miscellaneous.fromJson(json['Miscellaneous'])
        : null;
    grandTotal = json['Grand Total'] != null
        ? new GrandTotal.fromJson(json['Grand Total'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.domestic != null) {
      data['Domestic'] = this.domestic!.toJson();
    }
    if (this.alstom != null) {
      data['Alstom'] = this.alstom!.toJson();
    }
    if (this.wabtecIndia != null) {
      data['Wabtec India'] = this.wabtecIndia!.toJson();
    }
    if (this.wabtecUSA != null) {
      data['Wabtec USA'] = this.wabtecUSA!.toJson();
    }
    if (this.export != null) {
      data['Export'] = this.export!.toJson();
    }
    if (this.miscellaneous != null) {
      data['Miscellaneous'] = this.miscellaneous!.toJson();
    }
    if (this.grandTotal != null) {
      data['Grand Total'] = this.grandTotal!.toJson();
    }
    return data;
  }
}

class Domestic {
  Spares? centrifugal;
  Spares? axial;
  Centrifugal? spares;
  DomesticTotal? domesticTotal;

  Domestic({this.centrifugal, this.axial, this.spares, this.domesticTotal});

  Domestic.fromJson(Map<String, dynamic> json) {
    centrifugal = json['Centrifugal'] != null
        ? new Spares.fromJson(json['Centrifugal'])
        : null;
    axial = json['Axial'] != null ? new Spares.fromJson(json['Axial']) : null;
    spares = json['Spares'] != null
        ? new Centrifugal.fromJson(json['Spares'])
        : null;
    domesticTotal = json['Domestic Total'] != null
        ? new DomesticTotal.fromJson(json['Domestic Total'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.centrifugal != null) {
      data['Centrifugal'] = this.centrifugal!.toJson();
    }
    if (this.axial != null) {
      data['Axial'] = this.axial!.toJson();
    }
    if (this.spares != null) {
      data['Spares'] = this.spares!.toJson();
    }
    if (this.domesticTotal != null) {
      data['Domestic Total'] = this.domesticTotal!.toJson();
    }
    return data;
  }
}

class Centrifugal {
  String? saleOrderQty;
  String? saleOrderValue;

  Centrifugal({this.saleOrderQty, this.saleOrderValue});

  Centrifugal.fromJson(Map<String, dynamic> json) {
    saleOrderQty = json['SaleOrderQty'];
    saleOrderValue = json['SaleOrderValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SaleOrderQty'] = this.saleOrderQty;
    data['SaleOrderValue'] = this.saleOrderValue;
    return data;
  }
}

class DomesticTotal {
  int? saleOrderQty;
  double? saleOrderValue;

  DomesticTotal({this.saleOrderQty, this.saleOrderValue});

  DomesticTotal.fromJson(Map<String, dynamic> json) {
    saleOrderQty = json['SaleOrderQty'];
    saleOrderValue = json['SaleOrderValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SaleOrderQty'] = this.saleOrderQty;
    data['SaleOrderValue'] = this.saleOrderValue;
    return data;
  }
}

class Alstom {
  Spares? centrifugal;
  Spares? axial;
  Centrifugal? spares;
  DomesticTotal? alstomTotal;

  Alstom({this.centrifugal, this.axial, this.spares, this.alstomTotal});

  Alstom.fromJson(Map<String, dynamic> json) {
    centrifugal = json['Centrifugal'] != null
        ? new Spares.fromJson(json['Centrifugal'])
        : null;
    axial = json['Axial'] != null ? new Spares.fromJson(json['Axial']) : null;
    spares = json['Spares'] != null
        ? new Centrifugal.fromJson(json['Spares'])
        : null;
    alstomTotal = json['Alstom Total'] != null
        ? new DomesticTotal.fromJson(json['Alstom Total'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.centrifugal != null) {
      data['Centrifugal'] = this.centrifugal!.toJson();
    }
    if (this.axial != null) {
      data['Axial'] = this.axial!.toJson();
    }
    if (this.spares != null) {
      data['Spares'] = this.spares!.toJson();
    }
    if (this.alstomTotal != null) {
      data['Alstom Total'] = this.alstomTotal!.toJson();
    }
    return data;
  }
}

class WabtecIndia {
  Spares? centrifugal;
  Spares? axial;
  Centrifugal? spares;
  WabtecIndiaTotal? wabtecIndiaTotal;

  WabtecIndia(
      {this.centrifugal, this.axial, this.spares, this.wabtecIndiaTotal});

  WabtecIndia.fromJson(Map<String, dynamic> json) {
    centrifugal = json['Centrifugal'] != null
        ? new Spares.fromJson(json['Centrifugal'])
        : null;
    axial = json['Axial'] != null ? new Spares.fromJson(json['Axial']) : null;
    spares = json['Spares'] != null
        ? new Centrifugal.fromJson(json['Spares'])
        : null;
    wabtecIndiaTotal = json['Wabtec India Total'] != null
        ? new WabtecIndiaTotal.fromJson(json['Wabtec India Total'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.centrifugal != null) {
      data['Centrifugal'] = this.centrifugal!.toJson();
    }
    if (this.axial != null) {
      data['Axial'] = this.axial!.toJson();
    }
    if (this.spares != null) {
      data['Spares'] = this.spares!.toJson();
    }
    if (this.wabtecIndiaTotal != null) {
      data['Wabtec India Total'] = this.wabtecIndiaTotal!.toJson();
    }
    return data;
  }
}

class Spares {
  dynamic? saleOrderQty;
  dynamic? saleOrderValue;

  Spares({this.saleOrderQty, this.saleOrderValue});

  Spares.fromJson(Map<String, dynamic> json) {
    saleOrderQty = json['SaleOrderQty'];
    saleOrderValue = json['SaleOrderValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SaleOrderQty'] = this.saleOrderQty;
    data['SaleOrderValue'] = this.saleOrderValue;
    return data;
  }
}

class WabtecIndiaTotal {
  int? saleOrderQty;
  int? saleOrderValue;

  WabtecIndiaTotal({this.saleOrderQty, this.saleOrderValue});

  WabtecIndiaTotal.fromJson(Map<String, dynamic> json) {
    saleOrderQty = json['SaleOrderQty'];
    saleOrderValue = json['SaleOrderValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SaleOrderQty'] = this.saleOrderQty;
    data['SaleOrderValue'] = this.saleOrderValue;
    return data;
  }
}

class WabtecUSA {
  Spares? centrifugal;
  Spares? axial;
  Centrifugal? spares;
  DomesticTotal? wabtecUSATotal;

  WabtecUSA({this.centrifugal, this.axial, this.spares, this.wabtecUSATotal});

  WabtecUSA.fromJson(Map<String, dynamic> json) {
    centrifugal = json['Centrifugal'] != null
        ? new Spares.fromJson(json['Centrifugal'])
        : null;
    axial = json['Axial'] != null ? new Spares.fromJson(json['Axial']) : null;
    spares = json['Spares'] != null
        ? new Centrifugal.fromJson(json['Spares'])
        : null;
    wabtecUSATotal = json['Wabtec USA Total'] != null
        ? new DomesticTotal.fromJson(json['Wabtec USA Total'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.centrifugal != null) {
      data['Centrifugal'] = this.centrifugal!.toJson();
    }
    if (this.axial != null) {
      data['Axial'] = this.axial!.toJson();
    }
    if (this.spares != null) {
      data['Spares'] = this.spares!.toJson();
    }
    if (this.wabtecUSATotal != null) {
      data['Wabtec USA Total'] = this.wabtecUSATotal!.toJson();
    }
    return data;
  }
}

class Export {
  Spares? centrifugal;
  Spares? axial;
  Centrifugal? spares;
  DomesticTotal? exportTotal;

  Export({this.centrifugal, this.axial, this.spares, this.exportTotal});

  Export.fromJson(Map<String, dynamic> json) {
    centrifugal = json['Centrifugal'] != null
        ? new Spares.fromJson(json['Centrifugal'])
        : null;
    axial = json['Axial'] != null ? new Spares.fromJson(json['Axial']) : null;
    spares = json['Spares'] != null
        ? new Centrifugal.fromJson(json['Spares'])
        : null;
    exportTotal = json['Export Total'] != null
        ? new DomesticTotal.fromJson(json['Export Total'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.centrifugal != null) {
      data['Centrifugal'] = this.centrifugal!.toJson();
    }
    if (this.axial != null) {
      data['Axial'] = this.axial!.toJson();
    }
    if (this.spares != null) {
      data['Spares'] = this.spares!.toJson();
    }
    if (this.exportTotal != null) {
      data['Export Total'] = this.exportTotal!.toJson();
    }
    return data;
  }
}

class Miscellaneous {
  MiscellaneousTotal? miscellaneousTotal;

  Miscellaneous({this.miscellaneousTotal});

  Miscellaneous.fromJson(Map<String, dynamic> json) {
    miscellaneousTotal = json['Miscellaneous Total'] != null
        ? new MiscellaneousTotal.fromJson(json['Miscellaneous Total'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.miscellaneousTotal != null) {
      data['Miscellaneous Total'] = this.miscellaneousTotal!.toJson();
    }
    return data;
  }
}

class MiscellaneousTotal {
  int? saleOrderQty;
  String? saleOrderValue;

  MiscellaneousTotal({this.saleOrderQty, this.saleOrderValue});

  MiscellaneousTotal.fromJson(Map<String, dynamic> json) {
    saleOrderQty = json['SaleOrderQty'];
    saleOrderValue = json['SaleOrderValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SaleOrderQty'] = this.saleOrderQty;
    data['SaleOrderValue'] = this.saleOrderValue;
    return data;
  }
}

class GrandTotal {
  DomesticTotal? total;

  GrandTotal({this.total});

  GrandTotal.fromJson(Map<String, dynamic> json) {
    total = json['Total'] != null
        ? new DomesticTotal.fromJson(json['Total'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.total != null) {
      data['Total'] = this.total!.toJson();
    }
    return data;
  }
}