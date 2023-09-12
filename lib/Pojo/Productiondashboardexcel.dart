class Productiondashboardexcel {
  String? message;
  bool? error;
  List<ProductionData>? data;

  Productiondashboardexcel({this.message, this.error, this.data});

  Productiondashboardexcel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    if (json['data'] != null) {
      data = <ProductionData>[];
      json['data'].forEach((v) {
        data!.add(new ProductionData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductionData {
  int? orderid;
  String? serialNo;
  String? idNo;
  String? orderNum;
  String? jobNum;
  String? customerName;
  String? fanType;
  String? fanModel;
  int? orderQty;
  String? eDD;
  String? productionDrawingEdd;
  String? productionDgCommittedDate;
  int? productionDelay;
  String? productionRemarks;
  String? momPlanningEdd;
  String? momReleasedDate;
  int? momDelay;
  String? momRemarks;
  String? cncEdd;
  String? drawingReceivedDate;
  String? cncCompletedDate;
  int? cncDelay;
  String? cncRemarks;
  String? hubEdd;
  String? hubIssuedDate;
  String? hubCompletedDate;
  int? hubDelay;
  String? hubRemarks;
  String? machiningEdd;
  String? machiningIssuedDate;
  String? machiningCompletedDate;
  int? machiningDelay;
  String? machiningRemarks;
  String? impellerEdd;
  String? impellerIssuedDate;
  String? impellerCompletedDate;
  int? impellerDelay;
  String? impellerRemarks;
  String? casingEdd;
  String? casingIssuedDate;
  String? casingCompletedDate;
  int? casingDelay;
  String? casingRemarks;
  String? firstCoatPaintEdd;
  String? firstcoatpaintActualDate;
  String? firstCoatPaintRemarks;
  String? assemblyEdd;
  String? assemblyActualDate;
  String? assemblyRemarks;
  String? testingEdd;
  String? testingActualDate;
  String? testingRemarks;
  String? finalPaintEdd;
  String? finalpaintActualDate;
  String? finalPaintRemarks;
  String? packingDispatchEdd;
  String? packingDate;
  String? packingRemarks;
  String? dispatchDate;
  String? dispatchRemarks;
  String? accessoriesEdd;
  String? accessoriesIssuedDate;
  String? accessoriesCompletedDate;
  String? accessoriesRemarks;

  ProductionData(
      {this.orderid,
      this.serialNo,
      this.idNo,
      this.orderNum,
      this.jobNum,
      this.customerName,
      this.fanType,
      this.fanModel,
      this.orderQty,
      this.eDD,
      this.productionDrawingEdd,
      this.productionDgCommittedDate,
      this.productionDelay,
      this.productionRemarks,
      this.momPlanningEdd,
      this.momReleasedDate,
      this.momDelay,
      this.momRemarks,
      this.cncEdd,
      this.drawingReceivedDate,
      this.cncCompletedDate,
      this.cncDelay,
      this.cncRemarks,
      this.hubEdd,
      this.hubIssuedDate,
      this.hubCompletedDate,
      this.hubDelay,
      this.hubRemarks,
      this.machiningEdd,
      this.machiningIssuedDate,
      this.machiningCompletedDate,
      this.machiningDelay,
      this.machiningRemarks,
      this.impellerEdd,
      this.impellerIssuedDate,
      this.impellerCompletedDate,
      this.impellerDelay,
      this.impellerRemarks,
      this.casingEdd,
      this.casingIssuedDate,
      this.casingCompletedDate,
      this.casingDelay,
      this.casingRemarks,
      this.firstCoatPaintEdd,
      this.firstcoatpaintActualDate,
      this.firstCoatPaintRemarks,
      this.assemblyEdd,
      this.assemblyActualDate,
      this.assemblyRemarks,
      this.testingEdd,
      this.testingActualDate,
      this.testingRemarks,
      this.finalPaintEdd,
      this.finalpaintActualDate,
      this.finalPaintRemarks,
      this.packingDispatchEdd,
      this.packingDate,
      this.packingRemarks,
      this.dispatchDate,
      this.dispatchRemarks,
      this.accessoriesEdd,
      this.accessoriesIssuedDate,
      this.accessoriesCompletedDate,
      this.accessoriesRemarks});

  ProductionData.fromJson(Map<String, dynamic> json) {
    orderid = json['orderid'];
    serialNo = json['serial_no'];
    idNo = json['id_no'];
    orderNum = json['order_num'];
    jobNum = json['job_num'];
    customerName = json['customerName'];
    fanType = json['fanType'];
    fanModel = json['fanModel'];
    orderQty = json['orderQty'];
    eDD = json['EDD'];
    productionDrawingEdd = json['production_drawing_edd'];
    productionDgCommittedDate = json['production_dg_committed_date'];
    productionDelay = json['productionDelay'];
    productionRemarks = json['production_remarks'];
    momPlanningEdd = json['mom_planning_edd'];
    momReleasedDate = json['mom_released_date'];
    momDelay = json['momDelay'];
    momRemarks = json['mom_remarks'];
    cncEdd = json['cnc_edd'];
    drawingReceivedDate = json['drawing_received_date'];
    cncCompletedDate = json['cnc_completed_date'];
    cncDelay = json['cncDelay'];
    cncRemarks = json['cnc_remarks'];
    hubEdd = json['hub_edd'];
    hubIssuedDate = json['hub_issued_date'];
    hubCompletedDate = json['hub_completed_date'];
    hubDelay = json['hubDelay'];
    hubRemarks = json['hub_remarks'];
    machiningEdd = json['machining_edd'];
    machiningIssuedDate = json['machining_issued_date'];
    machiningCompletedDate = json['machining_completed_date'];
    machiningDelay = json['machiningDelay'];
    machiningRemarks = json['machining_remarks'];
    impellerEdd = json['impeller_edd'];
    impellerIssuedDate = json['impeller_issued_date'];
    impellerCompletedDate = json['impeller_completed_date'];
    impellerDelay = json['impellerDelay'];
    impellerRemarks = json['impeller_remarks'];
    casingEdd = json['casing_edd'];
    casingIssuedDate = json['casing_issued_date'];
    casingCompletedDate = json['casing_completed_date'];
    casingDelay = json['casingDelay'];
    casingRemarks = json['casing_remarks'];
    firstCoatPaintEdd = json['first_coat_paint_edd'];
    firstcoatpaintActualDate = json['firstcoatpaint_actual_date'];
    firstCoatPaintRemarks = json['firstCoatPaintRemarks'];
    assemblyEdd = json['assembly_edd'];
    assemblyActualDate = json['assembly_actual_date'];
    assemblyRemarks = json['assemblyRemarks'];
    testingEdd = json['testing_edd'];
    testingActualDate = json['testing_actual_date'];
    testingRemarks = json['testingRemarks'];
    finalPaintEdd = json['final_paint_edd'];
    finalpaintActualDate = json['finalpaint_actual_date'];
    finalPaintRemarks = json['finalPaintRemarks'];
    packingDispatchEdd = json['packing_dispatch_edd'];
    packingDate = json['PackingDate'];
    packingRemarks = json['packingRemarks'];
    dispatchDate = json['dispatchDate'];
    dispatchRemarks = json['dispatchRemarks'];
    accessoriesEdd = json['accessories_edd'];
    accessoriesIssuedDate = json['accessories_issued_date'];
    accessoriesCompletedDate = json['accessories_completed_date'];
    accessoriesRemarks = json['accessories_remarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderid'] = this.orderid;
    data['serial_no'] = this.serialNo;
    data['id_no'] = this.idNo;
    data['order_num'] = this.orderNum;
    data['job_num'] = this.jobNum;
    data['customerName'] = this.customerName;
    data['fanType'] = this.fanType;
    data['fanModel'] = this.fanModel;
    data['orderQty'] = this.orderQty;
    data['EDD'] = this.eDD;
    data['production_drawing_edd'] = this.productionDrawingEdd;
    data['production_dg_committed_date'] = this.productionDgCommittedDate;
    data['productionDelay'] = this.productionDelay;
    data['production_remarks'] = this.productionRemarks;
    data['mom_planning_edd'] = this.momPlanningEdd;
    data['mom_released_date'] = this.momReleasedDate;
    data['momDelay'] = this.momDelay;
    data['mom_remarks'] = this.momRemarks;
    data['cnc_edd'] = this.cncEdd;
    data['drawing_received_date'] = this.drawingReceivedDate;
    data['cnc_completed_date'] = this.cncCompletedDate;
    data['cncDelay'] = this.cncDelay;
    data['cnc_remarks'] = this.cncRemarks;
    data['hub_edd'] = this.hubEdd;
    data['hub_issued_date'] = this.hubIssuedDate;
    data['hub_completed_date'] = this.hubCompletedDate;
    data['hubDelay'] = this.hubDelay;
    data['hub_remarks'] = this.hubRemarks;
    data['machining_edd'] = this.machiningEdd;
    data['machining_issued_date'] = this.machiningIssuedDate;
    data['machining_completed_date'] = this.machiningCompletedDate;
    data['machiningDelay'] = this.machiningDelay;
    data['machining_remarks'] = this.machiningRemarks;
    data['impeller_edd'] = this.impellerEdd;
    data['impeller_issued_date'] = this.impellerIssuedDate;
    data['impeller_completed_date'] = this.impellerCompletedDate;
    data['impellerDelay'] = this.impellerDelay;
    data['impeller_remarks'] = this.impellerRemarks;
    data['casing_edd'] = this.casingEdd;
    data['casing_issued_date'] = this.casingIssuedDate;
    data['casing_completed_date'] = this.casingCompletedDate;
    data['casingDelay'] = this.casingDelay;
    data['casing_remarks'] = this.casingRemarks;
    data['first_coat_paint_edd'] = this.firstCoatPaintEdd;
    data['firstcoatpaint_actual_date'] = this.firstcoatpaintActualDate;
    data['firstCoatPaintRemarks'] = this.firstCoatPaintRemarks;
    data['assembly_edd'] = this.assemblyEdd;
    data['assembly_actual_date'] = this.assemblyActualDate;
    data['assemblyRemarks'] = this.assemblyRemarks;
    data['testing_edd'] = this.testingEdd;
    data['testing_actual_date'] = this.testingActualDate;
    data['testingRemarks'] = this.testingRemarks;
    data['final_paint_edd'] = this.finalPaintEdd;
    data['finalpaint_actual_date'] = this.finalpaintActualDate;
    data['finalPaintRemarks'] = this.finalPaintRemarks;
    data['packing_dispatch_edd'] = this.packingDispatchEdd;
    data['PackingDate'] = this.packingDate;
    data['packingRemarks'] = this.packingRemarks;
    data['dispatchDate'] = this.dispatchDate;
    data['dispatchRemarks'] = this.dispatchRemarks;
    data['accessories_edd'] = this.accessoriesEdd;
    data['accessories_issued_date'] = this.accessoriesIssuedDate;
    data['accessories_completed_date'] = this.accessoriesCompletedDate;
    data['accessories_remarks'] = this.accessoriesRemarks;
    return data;
  }
}
