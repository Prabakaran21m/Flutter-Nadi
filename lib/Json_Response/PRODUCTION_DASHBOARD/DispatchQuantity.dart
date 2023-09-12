class DispatchQuantity {
  final String message;
  final bool error;
  final List<ReadyToDispatch> readyToDispatch;
  final List<Disptached> disptached;

  DispatchQuantity(
      this.message, this.error, this.readyToDispatch, this.disptached);

  DispatchQuantity.fromJson(Map jsonMap)
      : message = jsonMap['message'],
        error = jsonMap['error'],
        readyToDispatch = jsonMap['readyToDispatch'],
        disptached = jsonMap['disptached'];
}

class ReadyToDispatch {
  String? Quantity;

  ReadyToDispatch({required this.Quantity});

  // ReadyToDispatch.fromJson(Map jsonMap) : Quantity = jsonMap['Quantity'];

  factory ReadyToDispatch.fromJson(Map<String, dynamic> jsonMap) =>
      ReadyToDispatch(
        Quantity: jsonMap["Quantity"],
      );
}

class Disptached {
  String? Quantity;

  Disptached({required this.Quantity});

  // Disptached.fromJson(Map jsonMap) : Quantity = jsonMap['Quantity'];

  factory Disptached.fromJson(Map<String, dynamic> jsonMap) => Disptached(
        Quantity: jsonMap["Quantity"],
      );
}
