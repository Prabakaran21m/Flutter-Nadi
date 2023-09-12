class SaleCategoryTotalValue {
  final String message;
  final bool error;
  final List<Standard> standard;
  final List<Spares> spares;
  final List<Other> other;

  SaleCategoryTotalValue(
      this.message, this.error, this.standard, this.spares, this.other);

  SaleCategoryTotalValue.fromJson(Map jsonMap)
      : message = jsonMap['message'],
        error = jsonMap['error'],
        standard = jsonMap['standard'],
        spares = jsonMap['spares'],
        other = jsonMap['other'];
}

class Standard {
  String? TotalValue;

  Standard(this.TotalValue);

  Standard.fromJson(Map jsonMap) : TotalValue = jsonMap['TotalValue'];
}

class Spares {
  String? TotalValue;

  Spares(this.TotalValue);

  Spares.fromJson(Map jsonMap) : TotalValue = jsonMap['TotalValue'];
}

class Other {
  String? TotalValue;

  Other(this.TotalValue);

  Other.fromJson(Map jsonMap) : TotalValue = jsonMap['TotalValue'];
}
