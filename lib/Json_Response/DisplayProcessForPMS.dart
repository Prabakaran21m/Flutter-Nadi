class DisplayProcessForPMS {
  final String message;
  final bool error;

  // final List<Production> production;
  // final List<Mom> mom;
  // final List<Stores> stores;
  // final List<Purchase> purchase;
  final List<Cnc> cnc;
  final List<Hub> hub;
  final List<Machining> machining;
  final List<Impeller> impeller;
  final List<Casing> casing;
  final List<Accessories> accessories;
  final List<Fc_paint> fc_paint;
  final List<Assembly> assembly;
  final List<Testing> testing;
  final List<Final_paint> final_paint;
  final List<Packing> packing;

  DisplayProcessForPMS(
      this.message,
      this.error,
      // this.production,
      // this.mom,
      // this.stores,
      // this.purchase,
      this.cnc,
      this.hub,
      this.impeller,
      this.machining,
      this.casing,
      this.accessories,
      this.fc_paint,
      this.assembly,
      this.testing,
      this.final_paint,
      this.packing);

  DisplayProcessForPMS.fromJson(Map jsonMap)
      : message = jsonMap['message'],
        error = jsonMap['error'],
        // production = jsonMap['production'],
        // mom = jsonMap['mom'],
        // stores = jsonMap['stores'],
        // purchase = jsonMap['purchase'],
        cnc = jsonMap['cnc'],
        hub = jsonMap['hub'],
        impeller = jsonMap['impeller'],
        machining = jsonMap['machining'],
        casing = jsonMap['casing'],
        accessories = jsonMap['accessories'],
        fc_paint = jsonMap['fc_paint'],
        assembly = jsonMap['assembly'],
        testing = jsonMap['testing'],
        final_paint = jsonMap['final_paint'],
        packing = jsonMap['packing'];
}

class Production {
  String? orderid,
      serial_no,
      id_no,
      order_num,
      job_num_1,
      prod_code,
      short_char_01,
      order_qty_1,
      need_by_date,
      production_drawing_edd,
      productionid,
      production_dg_committed_date,
      bom_committed_date,
      production_revised_date,
      production_remarks,
      production_revised_remarks,
      production_status;

  Production(
      this.orderid,
      this.serial_no,
      this.id_no,
      this.order_num,
      this.job_num_1,
      this.prod_code,
      this.short_char_01,
      this.order_qty_1,
      this.need_by_date,
      this.production_drawing_edd,
      this.productionid,
      this.production_dg_committed_date,
      this.bom_committed_date,
      this.production_revised_date,
      this.production_remarks,
      this.production_revised_remarks,
      this.production_status);

  Production.fromJson(Map jsonMap)
      : orderid = jsonMap['orderid'],
        serial_no = jsonMap['serial_no'],
        id_no = jsonMap['id_no'],
        order_num = jsonMap['order_num'],
        job_num_1 = jsonMap['job_num_1'],
        prod_code = jsonMap['prod_code'],
        short_char_01 = jsonMap['short_char_01'],
        order_qty_1 = jsonMap['order_qty_1'],
        need_by_date = jsonMap['need_by_date'],
        production_drawing_edd = jsonMap['production_drawing_edd'],
        productionid = jsonMap['productionid'],
        production_dg_committed_date = jsonMap['production_dg_committed_date'],
        bom_committed_date = jsonMap['bom_committed_date'],
        production_revised_date = jsonMap['production_revised_date'],
        production_remarks = jsonMap['production_remarks'],
        production_revised_remarks = jsonMap['production_revised_remarks'],
        production_status = jsonMap['production_status'];
}

class Mom {
  String? orderid,
      serial_no,
      id_no,
      order_num,
      job_num_1,
      prod_code,
      short_char_01,
      order_qty_1,
      need_by_date,
      mom_planning_edd,
      momid,
      mom_executed_date,
      mom_released_date,
      mom_remarks,
      mom_status;

  Mom(
      this.orderid,
      this.serial_no,
      this.id_no,
      this.order_num,
      this.job_num_1,
      this.prod_code,
      this.short_char_01,
      this.order_qty_1,
      this.need_by_date,
      this.mom_planning_edd,
      this.momid,
      this.mom_executed_date,
      this.mom_released_date,
      this.mom_remarks,
      this.mom_status);

  Mom.fromJson(Map jsonMap)
      : orderid = jsonMap['orderid'],
        serial_no = jsonMap['serial_no'],
        id_no = jsonMap['id_no'],
        order_num = jsonMap['order_num'],
        job_num_1 = jsonMap['job_num_1'],
        prod_code = jsonMap['prod_code'],
        short_char_01 = jsonMap['short_char_01'],
        order_qty_1 = jsonMap['order_qty_1'],
        need_by_date = jsonMap['need_by_date'],
        mom_planning_edd = jsonMap['mom_planning_edd'],
        momid = jsonMap['momid'],
        mom_executed_date = jsonMap['mom_executed_date'],
        mom_released_date = jsonMap['mom_released_date'],
        mom_remarks = jsonMap['mom_remarks'],
        mom_status = jsonMap['mom_status'];
}

class Stores {
  String? orderid,
      serial_no,
      bom_released_date,
      id_no,
      order_num,
      job_num_1,
      prod_code,
      short_char_01,
      order_qty_1,
      need_by_date,
      stores_edd,
      storeid,
      bom_received_date,
      stores_revised_date,
      report_submitted,
      stores_remarks,
      stores_revised_remarks,
      stores_status;

  Stores(
      this.orderid,
      this.serial_no,
      this.bom_released_date,
      this.id_no,
      this.order_num,
      this.job_num_1,
      this.prod_code,
      this.short_char_01,
      this.order_qty_1,
      this.need_by_date,
      this.stores_edd,
      this.storeid,
      this.bom_received_date,
      this.stores_revised_date,
      this.report_submitted,
      this.stores_remarks,
      this.stores_revised_remarks,
      this.stores_status);

  Stores.fromJson(Map jsonMap)
      : orderid = jsonMap['orderid'],
        serial_no = jsonMap['serial_no'],
        bom_released_date = jsonMap['bom_released_date'],
        id_no = jsonMap['id_no'],
        order_num = jsonMap['order_num'],
        job_num_1 = jsonMap['job_num_1'],
        prod_code = jsonMap['prod_code'],
        short_char_01 = jsonMap['short_char_01'],
        order_qty_1 = jsonMap['order_qty_1'],
        need_by_date = jsonMap['need_by_date'],
        stores_edd = jsonMap['stores_edd'],
        storeid = jsonMap['storeid'],
        bom_received_date = jsonMap['bom_received_date'],
        stores_revised_date = jsonMap['stores_revised_date'],
        report_submitted = jsonMap['report_submitted'],
        stores_remarks = jsonMap['stores_remarks'],
        stores_revised_remarks = jsonMap['stores_revised_remarks'],
        stores_status = jsonMap['stores_status'];
}

class Purchase {}

class Cnc {
  String? orderid,
      serial_no,
      id_no,
      order_num,
      job_num_1,
      prod_code,
      short_char_01,
      order_qty_1,
      need_by_date,
      cnc_edd,
      cncid,
      cnc_issued_date,
      cnc_completed_date,
      cnc_revised_date,
      cnc_remarks,
      cnc_revised_remarks,
      cncstatus;

  Cnc(
      this.orderid,
      this.serial_no,
      this.id_no,
      this.order_num,
      this.job_num_1,
      this.prod_code,
      this.short_char_01,
      this.order_qty_1,
      this.need_by_date,
      this.cnc_edd,
      this.cncid,
      this.cnc_issued_date,
      this.cnc_completed_date,
      this.cnc_revised_date,
      this.cnc_remarks,
      this.cnc_revised_remarks,
      this.cncstatus);

  Cnc.fromJson(Map jsonMap)
      : orderid = jsonMap['orderid'],
        serial_no = jsonMap['serial_no'],
        id_no = jsonMap['id_no'],
        order_num = jsonMap['order_num'],
        job_num_1 = jsonMap['job_num_1'],
        prod_code = jsonMap['prod_code'],
        short_char_01 = jsonMap['short_char_01'],
        order_qty_1 = jsonMap['order_qty_1'],
        need_by_date = jsonMap['need_by_date'],
        cnc_edd = jsonMap['cnc_edd'],
        cncid = jsonMap['cncid'],
        cnc_issued_date = jsonMap['cnc_issued_date'],
        cnc_completed_date = jsonMap['cnc_completed_date'],
        cnc_revised_date = jsonMap['cnc_revised_date'],
        cnc_remarks = jsonMap['cnc_remarks'],
        cnc_revised_remarks = jsonMap['cnc_revised_remarks'],
        cncstatus = jsonMap['cncstatus'];
}

class Hub {
  String? orderid,
      serial_no,
      id_no,
      order_num,
      job_num_1,
      prod_code,
      short_char_01,
      order_qty_1,
      need_by_date,
      hub_edd,
      hubid,
      hub_issued_date,
      hub_completed_date,
      hub_revised_date,
      hub_remarks,
      hub_revised_remarks,
      hubstatus;

  Hub(
      this.orderid,
      this.serial_no,
      this.id_no,
      this.order_num,
      this.job_num_1,
      this.prod_code,
      this.short_char_01,
      this.order_qty_1,
      this.need_by_date,
      this.hub_edd,
      this.hubid,
      this.hub_issued_date,
      this.hub_completed_date,
      this.hub_revised_date,
      this.hub_remarks,
      this.hub_revised_remarks,
      this.hubstatus);

  Hub.fromJson(Map jsonMap)
      : orderid = jsonMap['orderid'],
        serial_no = jsonMap['serial_no'],
        id_no = jsonMap['id_no'],
        order_num = jsonMap['order_num'],
        job_num_1 = jsonMap['job_num_1'],
        prod_code = jsonMap['prod_code'],
        short_char_01 = jsonMap['short_char_01'],
        order_qty_1 = jsonMap['order_qty_1'],
        need_by_date = jsonMap['need_by_date'],
        hub_edd = jsonMap['hub_edd'],
        hubid = jsonMap['hubid'],
        hub_issued_date = jsonMap['hub_issued_date'],
        hub_completed_date = jsonMap['hub_completed_date'],
        hub_revised_date = jsonMap['hub_revised_date'],
        hub_remarks = jsonMap['hub_remarks'],
        hub_revised_remarks = jsonMap['hub_revised_remarks'],
        hubstatus = jsonMap['hubstatus'];
}

class Machining {
  String? need_by_date, machining_edd;

  Machining(this.need_by_date, this.machining_edd);

  Machining.fromJson(Map jsonMap)
      : need_by_date = jsonMap['need_by_date'],
        machining_edd = jsonMap['machining_edd'];
}

class Impeller {
  String? need_by_date, impeller_edd;

  Impeller(this.need_by_date, this.impeller_edd);

  Impeller.fromJson(Map jsonMap)
      : need_by_date = jsonMap['need_by_date'],
        impeller_edd = jsonMap['impeller_edd'];
}

class Casing {
  String? need_by_date, casing_edd;

  Casing(this.need_by_date, this.casing_edd);

  Casing.fromJson(Map jsonMap)
      : need_by_date = jsonMap['need_by_date'],
        casing_edd = jsonMap['casing_edd'];
}

class Accessories {
  String? need_by_date, accessories_edd;

  Accessories(this.need_by_date, this.accessories_edd);

  Accessories.fromJson(Map jsonMap)
      : need_by_date = jsonMap['need_by_date'],
        accessories_edd = jsonMap['accessories_edd'];
}

class Fc_paint {
  String? need_by_date, first_coat_paint_edd;

  Fc_paint(this.need_by_date, this.first_coat_paint_edd);

  Fc_paint.fromJson(Map jsonMap)
      : need_by_date = jsonMap['need_by_date'],
        first_coat_paint_edd = jsonMap['first_coat_paint_edd'];
}

class Assembly {
  String? need_by_date, assembly_edd;

  Assembly(this.need_by_date, this.assembly_edd);

  Assembly.fromJson(Map jsonMap)
      : need_by_date = jsonMap['need_by_date'],
        assembly_edd = jsonMap['assembly_edd'];
}

class Testing {
  String? need_by_date, testing_edd;

  Testing(this.need_by_date, this.testing_edd);

  Testing.fromJson(Map jsonMap)
      : need_by_date = jsonMap['need_by_date'],
        testing_edd = jsonMap['testing_edd'];
}

class Final_paint {
  String? need_by_date, final_paint_edd;

  Final_paint(this.need_by_date, this.final_paint_edd);

  Final_paint.fromJson(Map jsonMap)
      : need_by_date = jsonMap['need_by_date'],
        final_paint_edd = jsonMap['final_paint_edd'];
}

class Packing {
  String? need_by_date, packing_dispatch_edd;

  Packing(this.need_by_date, this.packing_dispatch_edd);

  Packing.fromJson(Map jsonMap)
      : need_by_date = jsonMap['need_by_date'],
        packing_dispatch_edd = jsonMap['packing_dispatch_edd'];
}
