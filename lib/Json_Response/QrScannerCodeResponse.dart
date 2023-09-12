class QrScannerCodeResponse {
  final String message;
  final bool error;
  final Data data;

  QrScannerCodeResponse(this.message, this.error, this.data);

  QrScannerCodeResponse.fromJson(Map jsonMap)
      : message = jsonMap['message'],
        error = jsonMap['error'],
        data = jsonMap['data'];
}

class Data {
  String partCode, partDescriptions, onHandQty, totalCost;

  Data(this.partCode, this.partDescriptions, this.onHandQty, this.totalCost);

  Data.fromJson(Map jsonMap)
      : partCode = jsonMap['partCode'],
        partDescriptions = jsonMap['partDescriptions'],
        onHandQty = jsonMap['onHandQty'],
        totalCost = jsonMap['totalCost'];
}
