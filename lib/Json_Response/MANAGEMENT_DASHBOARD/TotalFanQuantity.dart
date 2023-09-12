class TotalFanQuantity {
  final String message;
  final bool error;
  final List<Data> data;

  TotalFanQuantity(this.message, this.error, this.data);

  TotalFanQuantity.fromJson(Map jsonMap)
      : message = jsonMap['message'],
        error = jsonMap['error'],
        data = jsonMap['data'];
}

class Data {
  String? Quantity;

  Data(this.Quantity);

  Data.fromJson(Map jsonMap) : Quantity = jsonMap['Quantity'];
}
