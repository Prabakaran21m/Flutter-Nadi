class TotalSaleOrder {
  final String message;
  final bool error;
  final List<SaleOrder> saleOrder;

  TotalSaleOrder(this.message, this.error, this.saleOrder);

  TotalSaleOrder.fromJson(Map jsonMap)
      : message = jsonMap['message'],
        error = jsonMap['error'],
        saleOrder = jsonMap['saleOrder'];
}

class SaleOrder {
  String? TotalValue;

  SaleOrder(this.TotalValue);

  SaleOrder.fromJson(Map jsonMap) : TotalValue = jsonMap['TotalValue'];
}
