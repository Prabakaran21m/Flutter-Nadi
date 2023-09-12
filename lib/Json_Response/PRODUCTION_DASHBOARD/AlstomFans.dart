class AlstomFans {
  final String message;
  final bool error;
  final List<Alstom> data;

  AlstomFans(this.message, this.error, this.data);

  AlstomFans.fromJson(Map jsonMap)
      : message = jsonMap['message'],
        error = jsonMap['error'],
        data = jsonMap['data'];
}

class Alstom {
  String? Quantity;

  Alstom(this.Quantity);

  Alstom.fromJson(Map jsonMap) : Quantity = jsonMap['Quantity'];
}
