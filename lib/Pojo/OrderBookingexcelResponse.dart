class OrderBookingexcelResponse {
  String? message;
  bool? error;
  Dataexcel? data;

  OrderBookingexcelResponse({this.message, this.error, this.data});

  OrderBookingexcelResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    data = json['data'] != null ? new Dataexcel.fromJson(json['data']) : null;
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

class Dataexcel {
  List<Domestic>? domestic;
  List<Domestic>? alstom;
  List<Domestic>? wabtecIndia;
  List<Domestic>? wabtecUSA;
  List<Domestic>? export;

  Dataexcel(
      {this.domestic,
        this.alstom,
        this.wabtecIndia,
        this.wabtecUSA,
        this.export});

  Dataexcel.fromJson(Map<String, dynamic> json) {
    if (json['Domestic'] != null) {
      domestic = <Domestic>[];
      json['Domestic'].forEach((v) {
        domestic!.add(new Domestic.fromJson(v));
      });
    }
    if (json['Alstom'] != null) {
      alstom = <Domestic>[];
      json['Alstom'].forEach((v) {
        alstom!.add(new Domestic.fromJson(v));
      });
    }
    if (json['WabtecIndia'] != null) {
      wabtecIndia = <Domestic>[];
      json['WabtecIndia'].forEach((v) {
        wabtecIndia!.add(new Domestic.fromJson(v));
      });
    }
    if (json['WabtecUSA'] != null) {
      wabtecUSA = <Domestic>[];
      json['WabtecUSA'].forEach((v) {
        wabtecUSA!.add(new Domestic.fromJson(v));
      });
    }
    if (json['Export'] != null) {
      export = <Domestic>[];
      json['Export'].forEach((v) {
        export!.add(new Domestic.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.domestic != null) {
      data['Domestic'] = this.domestic!.map((v) => v.toJson()).toList();
    }
    if (this.alstom != null) {
      data['Alstom'] = this.alstom!.map((v) => v.toJson()).toList();
    }
    if (this.wabtecIndia != null) {
      data['WabtecIndia'] = this.wabtecIndia!.map((v) => v.toJson()).toList();
    }
    if (this.wabtecUSA != null) {
      data['WabtecUSA'] = this.wabtecUSA!.map((v) => v.toJson()).toList();
    }
    if (this.export != null) {
      data['Export'] = this.export!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Domestic {
  int? orderNum;
  String? orderDate;
  int? custNum;
  String? releaseDate;
  int? territoryId;
  String? salesRepCode;
  String? salesRepName;
  String? billingGroup;
  String? customerName;
  String? needByDate;
  String? requestDate;
  int? orderLine;
  String? partNum;
  String? lineDesc;
  String? docUnitPrice;
  int? orderQty;
  String? prodCode;
  String? docExtPriceDtl;
  String? docTotalCharges;
  String? docTotalMisc;
  String? docTotalDiscount;
  String? exchangeRate;
  String? orderBookValue;
  String? salesCategory;

  Domestic(
      {this.orderNum,
        this.orderDate,
        this.custNum,
        this.releaseDate,
        this.territoryId,
        this.salesRepCode,
        this.salesRepName,
        this.billingGroup,
        this.customerName,
        this.needByDate,
        this.requestDate,
        this.orderLine,
        this.partNum,
        this.lineDesc,
        this.docUnitPrice,
        this.orderQty,
        this.prodCode,
        this.docExtPriceDtl,
        this.docTotalCharges,
        this.docTotalMisc,
        this.docTotalDiscount,
        this.exchangeRate,
        this.orderBookValue,
        this.salesCategory});

  Domestic.fromJson(Map<String, dynamic> json) {
    orderNum = json['order_num'];
    orderDate = json['order_date'];
    custNum = json['cust_num'];
    releaseDate = json['release_date'];
    territoryId = json['territory_id'];
    salesRepCode = json['sales_rep_code'];
    salesRepName = json['sales_rep_name'];
    billingGroup = json['billing_group'];
    customerName = json['customer_name'];
    needByDate = json['need_by_date'];
    requestDate = json['request_date'];
    orderLine = json['order_line'];
    partNum = json['part_num'];
    lineDesc = json['line_desc'];
    docUnitPrice = json['doc_unit_price'];
    orderQty = json['order_qty'];
    prodCode = json['prod_code'];
    docExtPriceDtl = json['doc_ext_price_dtl'];
    docTotalCharges = json['doc_total_charges'];
    docTotalMisc = json['doc_total_misc'];
    docTotalDiscount = json['doc_total_discount'];
    exchangeRate = json['exchange_rate'];
    orderBookValue = json['order_book_value'];
    salesCategory = json['sales_category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_num'] = this.orderNum;
    data['order_date'] = this.orderDate;
    data['cust_num'] = this.custNum;
    data['release_date'] = this.releaseDate;
    data['territory_id'] = this.territoryId;
    data['sales_rep_code'] = this.salesRepCode;
    data['sales_rep_name'] = this.salesRepName;
    data['billing_group'] = this.billingGroup;
    data['customer_name'] = this.customerName;
    data['need_by_date'] = this.needByDate;
    data['request_date'] = this.requestDate;
    data['order_line'] = this.orderLine;
    data['part_num'] = this.partNum;
    data['line_desc'] = this.lineDesc;
    data['doc_unit_price'] = this.docUnitPrice;
    data['order_qty'] = this.orderQty;
    data['prod_code'] = this.prodCode;
    data['doc_ext_price_dtl'] = this.docExtPriceDtl;
    data['doc_total_charges'] = this.docTotalCharges;
    data['doc_total_misc'] = this.docTotalMisc;
    data['doc_total_discount'] = this.docTotalDiscount;
    data['exchange_rate'] = this.exchangeRate;
    data['order_book_value'] = this.orderBookValue;
    data['sales_category'] = this.salesCategory;
    return data;
  }
}