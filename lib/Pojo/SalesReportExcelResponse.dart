

import 'SalesReportResponse.dart';

class SalesReportExcelResponse {
  String? message;
  bool? error;
  SalesDataexcel? data;

  SalesReportExcelResponse({this.message, this.error, this.data});

  SalesReportExcelResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    data = json['data'] != null ? new SalesDataexcel.fromJson(json['data']) : null;
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

class SalesDataexcel {
  List<Domestic>? domestic;
  List<Domestic>? alstom;
  List<Domestic>? wabtecIndia;
  List<Domestic>? wabtecUSA;
  List<Domestic>? export;
  List<Domestic>? miscellaneous;

  SalesDataexcel(
      {this.domestic,
        this.alstom,
        this.wabtecIndia,
        this.wabtecUSA,
        this.export,
        this.miscellaneous});

  SalesDataexcel.fromJson(Map<String, dynamic> json) {
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
    if (json['Miscellaneous'] != null) {
      miscellaneous = <Domestic>[];
      json['Miscellaneous'].forEach((v) {
        miscellaneous!.add(new Domestic.fromJson(v));
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
    if (this.miscellaneous != null) {
      data['Miscellaneous'] =
          this.miscellaneous!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Domestic {
  String? legalNumber;
  int? orderNum;
  int? orderLine;
  int? orderQty;
  int? invoiceNum;
  String? invoiceDate;
  int? invoiceLine;
  String? customerName;
  String? salesRepName;
  String? billingGroup;
  String? partNum;
  String? lineDesc;
  String? prodCode;
  String? docUnitPrice;
  String? saleOrderValue;

  Domestic(
      {this.legalNumber,
        this.orderNum,
        this.orderLine,
        this.orderQty,
        this.invoiceNum,
        this.invoiceDate,
        this.invoiceLine,
        this.customerName,
        this.salesRepName,
        this.billingGroup,
        this.partNum,
        this.lineDesc,
        this.prodCode,
        this.docUnitPrice,
        this.saleOrderValue});

  Domestic.fromJson(Map<String, dynamic> json) {
    legalNumber = json['legal_number'];
    orderNum = json['order_num'];
    orderLine = json['order_line'];
    orderQty = json['order_qty'];
    invoiceNum = json['invoice_num'];
    invoiceDate = json['invoice_date'];
    invoiceLine = json['invoice_line'];
    customerName = json['customer_name'];
    salesRepName = json['sales_rep_name'];
    billingGroup = json['billing_group'];
    partNum = json['part_num'];
    lineDesc = json['line_desc'];
    prodCode = json['prod_code'];
    docUnitPrice = json['doc_unit_price'];
    saleOrderValue = json['sale_order_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['legal_number'] = this.legalNumber;
    data['order_num'] = this.orderNum;
    data['order_line'] = this.orderLine;
    data['order_qty'] = this.orderQty;
    data['invoice_num'] = this.invoiceNum;
    data['invoice_date'] = this.invoiceDate;
    data['invoice_line'] = this.invoiceLine;
    data['customer_name'] = this.customerName;
    data['sales_rep_name'] = this.salesRepName;
    data['billing_group'] = this.billingGroup;
    data['part_num'] = this.partNum;
    data['line_desc'] = this.lineDesc;
    data['prod_code'] = this.prodCode;
    data['doc_unit_price'] = this.docUnitPrice;
    data['sale_order_value'] = this.saleOrderValue;
    return data;
  }
}