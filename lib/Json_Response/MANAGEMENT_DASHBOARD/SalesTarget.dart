class SalesTarget {
  final String message;
  final bool error;
  final List<Data1> data1;
  final List<Data2> data2;
  final List<Data3> data3;
  final List<Data4> data4;
  final List<Data5> data5;
  final List<Data6> data6;
  final List<Data7> data7;

  SalesTarget(this.message, this.error, this.data1, this.data2, this.data3,
      this.data4, this.data5, this.data6, this.data7);

  SalesTarget.fromJson(Map jsonMap)
      : message = jsonMap['message'],
        error = jsonMap['error'],
        data1 = jsonMap['data1'],
        data2 = jsonMap['data2'],
        data3 = jsonMap['data3'],
        data4 = jsonMap['data4'],
        data5 = jsonMap['data5'],
        data6 = jsonMap['data6'],
        data7 = jsonMap['data7'];
}

class Data1 {
  String? Quantity;

  Data1(this.Quantity);

  Data1.fromJson(Map jsonMap) : Quantity = jsonMap['Quantity'];
}

class Data2 {
  String? Quantity;

  Data2(this.Quantity);

  Data2.fromJson(Map jsonMap) : Quantity = jsonMap['Quantity'];
}

class Data3 {
  String? Quantity;

  Data3(this.Quantity);

  Data3.fromJson(Map jsonMap) : Quantity = jsonMap['Quantity'];
}

class Data4 {
  String? Quantity;

  Data4(this.Quantity);

  Data4.fromJson(Map jsonMap) : Quantity = jsonMap['Quantity'];
}

class Data5 {
  String? Quantity;

  Data5(this.Quantity);

  Data5.fromJson(Map jsonMap) : Quantity = jsonMap['Quantity'];
}

class Data6 {
  String? Quantity;

  Data6(this.Quantity);

  Data6.fromJson(Map jsonMap) : Quantity = jsonMap['Quantity'];
}

class Data7 {
  String? Quantity;

  Data7(this.Quantity);

  Data7.fromJson(Map jsonMap) : Quantity = jsonMap['Quantity'];
}
