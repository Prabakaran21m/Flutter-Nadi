class QrDisplayValue {
  final String message;
  final bool error;
  final List<QRDis> data;

  QrDisplayValue(this.message, this.error, this.data);

  QrDisplayValue.fromJson(Map jsonMap)
      : message = jsonMap['message'],
        error = jsonMap['error'],
        data = jsonMap['data'];
}

class QRDis {
  String? partCode, partDescriptions, onHandQty, unitCost, totalCost;

  QRDis(this.partCode, this.partDescriptions, this.onHandQty, this.unitCost,
      this.totalCost);

  QRDis.fromJson(Map jsonMap)
      : partCode = jsonMap['partCode'],
        partDescriptions = jsonMap['partDescriptions'],
        onHandQty = jsonMap['onHandQty'],
        unitCost = jsonMap['unitCost'],
        totalCost = jsonMap['totalCost'];
}
