class SaleCategoryQuantity {
  final String message;
  final bool error;
  final List<Standard> standard;
  final List<Spares> spares;
  final List<Other> other;

  SaleCategoryQuantity(
      this.message, this.error, this.standard, this.spares, this.other);

  SaleCategoryQuantity.fromJson(Map jsonMap)
      : message = jsonMap['message'],
        error = jsonMap['error'],
        standard = jsonMap['standard'],
        spares = jsonMap['spares'],
        other = jsonMap['other'];
}

class Standard {
  String? Quantity;

  Standard(this.Quantity);

  Standard.fromJson(Map jsonMap) : Quantity = jsonMap['Quantity'];
}

class Spares {
  String? Quantity;

  Spares(this.Quantity);

  Spares.fromJson(Map jsonMap) : Quantity = jsonMap['Quantity'];
}

class Other {
  String? Quantity;

  Other(this.Quantity);

  Other.fromJson(Map jsonMap) : Quantity = jsonMap['Quantity'];
}
