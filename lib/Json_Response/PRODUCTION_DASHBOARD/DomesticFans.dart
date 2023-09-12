class DomesticFans {
  final String message;
  final bool error;
  final List<Domestic> data;

  DomesticFans(this.message, this.error, this.data);

  DomesticFans.fromJson(Map jsonMap)
      : message = jsonMap['message'],
        error = jsonMap['error'],
        data = jsonMap['data'];
}

class Domestic {
  String? Quantity;

  Domestic(this.Quantity);

  Domestic.fromJson(Map jsonMap) : Quantity = jsonMap['Quantity'];
}
