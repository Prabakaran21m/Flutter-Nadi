class DelayedProcess {
  final String message;
  final bool error;
  final List<Delay> data;

  DelayedProcess(this.message, this.error, this.data);

  DelayedProcess.fromJson(Map jsonMap)
      : message = jsonMap['message'],
        error = jsonMap['error'],
        data = jsonMap['data'];
}

class Delay {
  String? Quantity;

  Delay(this.Quantity);

  Delay.fromJson(Map jsonMap) : Quantity = jsonMap['Quantity'];
}
