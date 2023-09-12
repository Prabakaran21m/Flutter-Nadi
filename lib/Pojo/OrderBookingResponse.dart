class OrderBookingResponse {
  String? message;
  bool? error;
  Data? data;

  OrderBookingResponse({this.message, this.error, this.data});

  OrderBookingResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  Domestic? domestic;
  Alstom? alstom;
  WabtecIndia? wabtecIndia;
  WabtecUSA? wabtecUSA;
  Export? export;
  GrandTotal? grandTotal;

  Data(
      {this.domestic,
        this.alstom,
        this.wabtecIndia,
        this.wabtecUSA,
        this.export,
        this.grandTotal});

  Data.fromJson(Map<String, dynamic> json) {
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
    if (this.grandTotal != null) {
      data['Grand Total'] = this.grandTotal!.toJson();
    }
    return data;
  }
}

class Domestic {
  Centrifugal? centrifugal;
  Centrifugal? axial;
  Centrifugal? spares;
  DomesticTotal? domesticTotal;

  Domestic({this.centrifugal, this.axial, this.spares, this.domesticTotal});

  Domestic.fromJson(Map<String, dynamic> json) {
    centrifugal = json['Centrifugal'] != null
        ? new Centrifugal.fromJson(json['Centrifugal'])
        : null;
    axial =
    json['Axial'] != null ? new Centrifugal.fromJson(json['Axial']) : null;
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
  dynamic? bookedOrderQty;
  dynamic? bookedOrderValue;

  Centrifugal({this.bookedOrderQty, this.bookedOrderValue});

  Centrifugal.fromJson(Map<String, dynamic> json) {
    bookedOrderQty = json['BookedOrderQty'] ?? "0";
    bookedOrderValue = json['BookedOrderValue'] ?? "₹0.00";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BookedOrderQty'] = this.bookedOrderQty;
    data['BookedOrderValue'] = this.bookedOrderValue;
    return data;
  }
}

class DomesticTotal {
  dynamic? bookedOrderQty;
  dynamic? bookedOrderValue;

  DomesticTotal({this.bookedOrderQty, this.bookedOrderValue});

  DomesticTotal.fromJson(Map<String, dynamic> json) {
    bookedOrderQty = json['BookedOrderQty'];
    bookedOrderValue = json['BookedOrderValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BookedOrderQty'] = this.bookedOrderQty;
    data['BookedOrderValue'] = this.bookedOrderValue;
    return data;
  }
}

class Alstom {
  Centrifugal? centrifugal;
  Centrifugal? axial;
  Centrifugal? spares;
  DomesticTotal? alstomTotal;

  Alstom({this.centrifugal, this.axial, this.spares, this.alstomTotal});

  Alstom.fromJson(Map<String, dynamic> json) {
    centrifugal = json['Centrifugal'] != null
        ? new Centrifugal.fromJson(json['Centrifugal'])
        : null;
    axial =
    json['Axial'] != null ? new Centrifugal.fromJson(json['Axial']) : null;
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
  Centrifugal? centrifugal;
  Centrifugal? axial;
  Centrifugal? spares;
  DomesticTotal? wabtecIndiaTotal;

  WabtecIndia(
      {this.centrifugal, this.axial, this.spares, this.wabtecIndiaTotal});

  WabtecIndia.fromJson(Map<String, dynamic> json) {
    centrifugal = json['Centrifugal'] != null
        ? new Centrifugal.fromJson(json['Centrifugal'])
        : null;
    axial =
    json['Axial'] != null ? new Centrifugal.fromJson(json['Axial']) : null;
    spares = json['Spares'] != null
        ? new Centrifugal.fromJson(json['Spares'])
        : null;
    wabtecIndiaTotal = json['Wabtec India Total'] != null
        ? new DomesticTotal.fromJson(json['Wabtec India Total'])
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

class WabtecUSA {
  Centrifugal? centrifugal;
  Centrifugal? axial;
  Centrifugal? spares;
  DomesticTotal? wabtecUSATotal;

  WabtecUSA({this.centrifugal, this.axial, this.spares, this.wabtecUSATotal});

  WabtecUSA.fromJson(Map<String, dynamic> json) {
    centrifugal = json['Centrifugal'] != null
        ? new Centrifugal.fromJson(json['Centrifugal'])
        : null;
    axial =
    json['Axial'] != null ? new Centrifugal.fromJson(json['Axial']) : null;
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
  Centrifugal? centrifugal;
  Centrifugal? axial;
  Centrifugal? spares;
  DomesticTotal? exportTotal;

  Export({this.centrifugal, this.axial, this.spares, this.exportTotal});

  Export.fromJson(Map<String, dynamic> json) {
    centrifugal = json['Centrifugal'] != null
        ? new Centrifugal.fromJson(json['Centrifugal'])
        : null;
    axial =
    json['Axial'] != null ? new Centrifugal.fromJson(json['Axial']) : null;
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