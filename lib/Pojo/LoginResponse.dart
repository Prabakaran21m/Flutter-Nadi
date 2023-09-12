class LoginResponse {
  String? message;
  bool? error;
  Data? data;

  LoginResponse({this.message, this.error, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
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
  String? roles;
  String? department;
  String? employeeId;
  String? jobscreenedit;
  String? momscreenedit;
  String? partcodeEdit;
  String? fgpartcodeEdit;
  String? sfgpartcodeEdit;
  String? subcomppartcodeEdit;
  String? jobscreenview;
  String? momscreenview;
  String? partcodeView;
  String? production;
  String? mom;
  String? store;
  String? purchase;
  String? cnc;
  String? hub;
  String? machining;
  String? impeller;
  String? casing;
  String? accessories;
  String? firstPaint;
  String? assembly;
  String? testing;
  String? finalPaint;
  String? packing;
  String? productionView;
  String? momView;
  String? storeView;
  String? purchaseView;
  String? cncView;
  String? hubView;
  String? machiningView;
  String? impellerView;
  String? casingView;
  String? accessoriesView;
  String? firstPaintView;
  String? assemblyView;
  String? testingView;
  String? finalPaintView;
  String? packingView;
  String? viewAll;
  String? processEdit;
  String? processView;
  String? pms;
  String? dashboardView;
  String? bomFileEdit;
  String? salesTargetEdit;
  String? inventory;
  String? outwards;
  String? inwards;
  String? dcNumbers;
  String? addRegister;
  String? editRegister;
  String? saleOrder;
  String? management;
  String? storeStock;
  String? stockJob;
  String? stockQr;
  String? stockPending;
  String? stockIssued;
  String? monthlyJob;

  Data(
      {this.roles,
      this.department,
      this.employeeId,
      this.jobscreenedit,
      this.momscreenedit,
      this.partcodeEdit,
      this.fgpartcodeEdit,
      this.sfgpartcodeEdit,
      this.subcomppartcodeEdit,
      this.jobscreenview,
      this.momscreenview,
      this.partcodeView,
      this.production,
      this.mom,
      this.store,
      this.purchase,
      this.cnc,
      this.hub,
      this.machining,
      this.impeller,
      this.casing,
      this.accessories,
      this.firstPaint,
      this.assembly,
      this.testing,
      this.finalPaint,
      this.packing,
      this.productionView,
      this.momView,
      this.storeView,
      this.purchaseView,
      this.cncView,
      this.hubView,
      this.machiningView,
      this.impellerView,
      this.casingView,
      this.accessoriesView,
      this.firstPaintView,
      this.assemblyView,
      this.testingView,
      this.finalPaintView,
      this.packingView,
      this.viewAll,
      this.processEdit,
      this.processView,
      this.pms,
      this.dashboardView,
      this.bomFileEdit,
      this.salesTargetEdit,
      this.inventory,
      this.outwards,
      this.inwards,
      this.dcNumbers,
      this.addRegister,
      this.editRegister,
      this.saleOrder,
      this.management,
      this.storeStock,
      this.stockJob,
      this.stockQr,
      this.stockPending,
      this.stockIssued,
      this.monthlyJob});

  Data.fromJson(Map<String, dynamic> json) {
    roles = json['roles'];
    department = json['department'];
    employeeId = json['employee_id'];
    jobscreenedit = json['jobscreenedit'];
    momscreenedit = json['momscreenedit'];
    partcodeEdit = json['partcode_edit'];
    fgpartcodeEdit = json['fgpartcode_edit'];
    sfgpartcodeEdit = json['sfgpartcode_edit'];
    subcomppartcodeEdit = json['subcomppartcode_edit'];
    jobscreenview = json['jobscreenview'];
    momscreenview = json['momscreenview'];
    partcodeView = json['partcode_view'];
    production = json['production'];
    mom = json['mom'];
    store = json['store'];
    purchase = json['purchase'];
    cnc = json['cnc'];
    hub = json['hub'];
    machining = json['machining'];
    impeller = json['impeller'];
    casing = json['casing'];
    accessories = json['accessories'];
    firstPaint = json['first_paint'];
    assembly = json['assembly'];
    testing = json['testing'];
    finalPaint = json['final_paint'];
    packing = json['packing'];
    productionView = json['production_view'];
    momView = json['mom_view'];
    storeView = json['store_view'];
    purchaseView = json['purchase_view'];
    cncView = json['cnc_view'];
    hubView = json['hub_view'];
    machiningView = json['machining_view'];
    impellerView = json['impeller_view'];
    casingView = json['casing_view'];
    accessoriesView = json['accessories_view'];
    firstPaintView = json['first_paint_view'];
    assemblyView = json['assembly_view'];
    testingView = json['testing_view'];
    finalPaintView = json['final_paint_view'];
    packingView = json['packing_view'];
    viewAll = json['view_all'];
    processEdit = json['process_edit'];
    processView = json['process_view'];
    pms = json['pms'];
    dashboardView = json['dashboard_view'];
    bomFileEdit = json['bom_file_edit'];
    salesTargetEdit = json['sales_target_edit'];
    inventory = json['inventory'];
    outwards = json['outwards'];
    inwards = json['inwards'];
    dcNumbers = json['dc_numbers'];
    addRegister = json['add_register'];
    editRegister = json['edit_register'];
    saleOrder = json['sale_order'];
    management = json['management'];
    storeStock = json['store_stock'];
    stockJob = json['stock_job'];
    stockQr = json['stock_qr'];
    stockPending = json['stock_pending'];
    stockIssued = json['stock_issued'];
    monthlyJob = json['monthly_job'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roles'] = this.roles;
    data['department'] = this.department;
    data['employee_id'] = this.employeeId;
    data['jobscreenedit'] = this.jobscreenedit;
    data['momscreenedit'] = this.momscreenedit;
    data['partcode_edit'] = this.partcodeEdit;
    data['fgpartcode_edit'] = this.fgpartcodeEdit;
    data['sfgpartcode_edit'] = this.sfgpartcodeEdit;
    data['subcomppartcode_edit'] = this.subcomppartcodeEdit;
    data['jobscreenview'] = this.jobscreenview;
    data['momscreenview'] = this.momscreenview;
    data['partcode_view'] = this.partcodeView;
    data['production'] = this.production;
    data['mom'] = this.mom;
    data['store'] = this.store;
    data['purchase'] = this.purchase;
    data['cnc'] = this.cnc;
    data['hub'] = this.hub;
    data['machining'] = this.machining;
    data['impeller'] = this.impeller;
    data['casing'] = this.casing;
    data['accessories'] = this.accessories;
    data['first_paint'] = this.firstPaint;
    data['assembly'] = this.assembly;
    data['testing'] = this.testing;
    data['final_paint'] = this.finalPaint;
    data['packing'] = this.packing;
    data['production_view'] = this.productionView;
    data['mom_view'] = this.momView;
    data['store_view'] = this.storeView;
    data['purchase_view'] = this.purchaseView;
    data['cnc_view'] = this.cncView;
    data['hub_view'] = this.hubView;
    data['machining_view'] = this.machiningView;
    data['impeller_view'] = this.impellerView;
    data['casing_view'] = this.casingView;
    data['accessories_view'] = this.accessoriesView;
    data['first_paint_view'] = this.firstPaintView;
    data['assembly_view'] = this.assemblyView;
    data['testing_view'] = this.testingView;
    data['final_paint_view'] = this.finalPaintView;
    data['packing_view'] = this.packingView;
    data['view_all'] = this.viewAll;
    data['process_edit'] = this.processEdit;
    data['process_view'] = this.processView;
    data['pms'] = this.pms;
    data['dashboard_view'] = this.dashboardView;
    data['bom_file_edit'] = this.bomFileEdit;
    data['sales_target_edit'] = this.salesTargetEdit;
    data['inventory'] = this.inventory;
    data['outwards'] = this.outwards;
    data['inwards'] = this.inwards;
    data['dc_numbers'] = this.dcNumbers;
    data['add_register'] = this.addRegister;
    data['edit_register'] = this.editRegister;
    data['sale_order'] = this.saleOrder;
    data['management'] = this.management;
    data['store_stock'] = this.storeStock;
    data['stock_job'] = this.stockJob;
    data['stock_qr'] = this.stockQr;
    data['stock_pending'] = this.stockPending;
    data['stock_issued'] = this.stockIssued;
    data['monthly_job'] = this.monthlyJob;
    return data;
  }
}
