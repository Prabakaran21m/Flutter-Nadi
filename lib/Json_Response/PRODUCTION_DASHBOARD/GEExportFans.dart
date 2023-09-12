class GEExportFans {
  final String message;
  final bool error;
  final List<GeExport> data;

  GEExportFans(this.message, this.error, this.data);

  GEExportFans.fromJson(Map jsonMap)
      : message = jsonMap['message'],
        error = jsonMap['error'],
        data = jsonMap['data'];
}

class GeExport {
  String? Quantity;

  GeExport(this.Quantity);

  GeExport.fromJson(Map jsonMap) : Quantity = jsonMap['Quantity'];
}
