// List<Data> data(String str) =>
//     List<Data>.from(json.decode(str).map((x) => Data.fromJson(x)));
//
// String dataToJson(List<Data> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProcessPendingFans {
  final String message;
  final bool error;
  final List<Datas> data;

  ProcessPendingFans(
    this.message,
    this.error,
    this.data,
  );

  ProcessPendingFans.fromJson(Map jsonMap)
      : message = jsonMap['message'],
        error = jsonMap['error'],
        data = jsonMap['data'];
}

class Datas {
  String? Quantity;

  Datas({
    required this.Quantity,
  });

  factory Datas.fromJson(Map<String, dynamic> jsonMap) => Datas(
        Quantity: jsonMap["Quantity"],
        // Quantity: int.parse(Data["Quantity"].toDouble()),
      );

  // Map<String, dynamic> toJson() => {
  //       "Quantity": Quantity,
  //     };
}
