class BarcFans {
  final String message;
  final bool error;
  final List<Barc> data;

  BarcFans(this.message, this.error, this.data);

  BarcFans.fromJson(Map jsonMap)
      : message = jsonMap['message'],
        error = jsonMap['error'],
        data = jsonMap['data'];
}

class Barc {
  String? Quantity;

  Barc(this.Quantity);

  Barc.fromJson(Map jsonMap) : Quantity = jsonMap['Quantity'];
}
