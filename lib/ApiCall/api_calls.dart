import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as https;
import '../Json_Response/DashBoard/JobUpdates.dart';
import '../Pojo/JobUpdatesResponse.dart';
import 'ApiClass.dart';

class api_Calls {
  //post api
  displayProcess(data, url) async {
    String fullurl = ApiClass.BASE_URL + url;
    if (kDebugMode) {
      print(fullurl);
      print(data);
    }
    var uri = Uri.parse(fullurl);
    var request = https.MultipartRequest("POST", uri);
    request.fields.addAll(data);
    var response = await request.send();
    final respStr = await response.stream.bytesToString();
    print(respStr);
    return respStr;
  }

  QrdisplayProcess(data, url) async {
    String fullurl = ApiClass.BASE_URL + url;
    if (kDebugMode) {
      print(fullurl);
      print(data);
    }
    var uri = Uri.parse(fullurl);
    var request = https.MultipartRequest("POST", uri);
    request.fields.addAll(data);
    var response = await request.send();
    // final respStr = await response.stream.bytesToString();
    var respStr = await https.Response.fromStream(response);
    return respStr;
  }

  FetchOtherScreenForPms(url) async {
    String fullurl = ApiClass.BASE_URL + url;
    if (kDebugMode) {
      print(fullurl);
    }
    var uri = Uri.parse(fullurl);
    var response = await https.get(uri);
    print(json.decode(response.body));
    // final respStr = await response.stream.bytesToString();
    return response;
  }

  DisplyprocessforPMS(data, url) async {
    String fullurl = ApiClass.BASE_URL + url;
    if (kDebugMode) {
      print(fullurl);
    }
    var uri = Uri.parse(fullurl);
    var request = https.MultipartRequest("POST", uri);
    request.fields.addAll(data);
    var response = await request.send();
    // final respStr = await https.Response.fromStream(response);
    var respStr = await https.Response.fromStream(response);
    return respStr;
  }

  TOTALFANQUANTITY(url) async {
    String fullurl = ApiClass.BASE_URL + url;
    if (kDebugMode) {
      print(fullurl);
    }
    var uri = Uri.parse(fullurl);
    var respond = await https.get(uri);
    print(json.decode(respond.body));
    return respond;
  }

  TOTALSALEORDERVALUE(url) async {
    String fullurl = ApiClass.BASE_URL + url;
    if (kDebugMode) {
      print(fullurl);
    }
    var uri = Uri.parse(fullurl);
    var respond = await https.get(uri);
    print(json.decode(respond.body));
    return respond;
  }

  TOTALSALECATEGORYAMOUNT(url) async {
    String fullurl = ApiClass.BASE_URL + url;
    if (kDebugMode) {
      print(fullurl);
    }
    var uri = Uri.parse(fullurl);
    var respond = await https.get(uri);
    print(json.decode(respond.body));
    return respond;
  }

  SALECATEGORYQTY(url) async {
    String fullurl = ApiClass.BASE_URL + url;
    if (kDebugMode) {
      print(fullurl);
    }
    var uri = Uri.parse(fullurl);
    var respond = await https.get(uri);
    print(json.decode(respond.body));
    return respond;
  }

  SALESTARGET(url) async {
    String fullurl = ApiClass.BASE_URL + url;
    if (kDebugMode) {
      print(fullurl);
    }
    var uri = Uri.parse(fullurl);
    var respond = await https.get(uri);
    print(json.decode(respond.body));
    return respond;
  }

  PROCESSSCREENPENDINGFANS(url) async {
    String fullurl = ApiClass.BASE_URL + url;
    if (kDebugMode) {
      print("chart" + fullurl);
    }
    var uri = Uri.parse(fullurl);
    var respond = await https.get(uri);
    print(json.decode(respond.body));
    print(respond);
    return respond;
  }

  DOMESTICORDERSFANS(url) async {
    String fullurl = ApiClass.BASE_URL + url;
    if (kDebugMode) {
      print(fullurl);
    }
    var uri = Uri.parse(fullurl);
    var respond = await https.get(uri);
    print(json.decode(respond.body));
    return respond;
  }

  GEEXPORTFANS(url) async {
    String fullurl = ApiClass.BASE_URL + url;
    if (kDebugMode) {
      print(fullurl);
    }
    var uri = Uri.parse(fullurl);
    var respond = await https.get(uri);
    print(json.decode(respond.body));
    return respond;
  }

  ALSTOMFANS(url) async {
    String fullurl = ApiClass.BASE_URL + url;
    if (kDebugMode) {
      print(fullurl);
    }
    var uri = Uri.parse(fullurl);
    var respond = await https.get(uri);
    print(json.decode(respond.body));
    return respond;
  }

  DISPATCHQTY(url) async {
    String fullurl = ApiClass.BASE_URL + url;
    if (kDebugMode) {
      print(fullurl);
    }
    var uri = Uri.parse(fullurl);
    var respond = await https.get(uri);
    print(json.decode(respond.body));
    return respond;
  }

  DELAYEDPROCESS(url) async {
    String fullurl = ApiClass.BASE_URL + url;
    if (kDebugMode) {
      print(fullurl);
    }
    var uri = Uri.parse(fullurl);
    var respond = await https.get(uri);
    print(json.decode(respond.body));
    return respond;
  }

//get api
  BARCFANS(url) async {
    String fullurl = ApiClass.BASE_URL + url;
    if (kDebugMode) {
      print(fullurl);
    }
    var uri = Uri.parse(fullurl);
    var respond = await https.get(uri);
    print(json.decode(respond.body));
    return respond;
  }

  //post api
  Future<jobupdate> JOBUPDATES(url, data) async {
    String fullurl = ApiClass.BASE_URL + url;

    if (kDebugMode) {
      print(fullurl);
      print(data);
    }
    var uri = Uri.parse(fullurl);
    var request = https.MultipartRequest("POST", uri);
    request.fields.addAll(data!);
    var response = await request.send();
    final respStr = await response.stream.bytesToString();
    var jsonData = jsonDecode(respStr);
    var responseString = jobupdate.fromJson(jsonData);
    print(responseString);
    return responseString;
  }

  Future<JobQuality> JOBUPDATES2(url, data) async {
    String fullurl = ApiClass.BASE_URL + url;

    if (kDebugMode) {
      print(fullurl);
      print(data);
    }
    var uri = Uri.parse(fullurl);
    var request = https.MultipartRequest("POST", uri);
    request.fields.addAll(data!);
    var response = await request.send();
    final respStr = await response.stream.bytesToString();
    var jsonData = jsonDecode(respStr);
    var responseString = JobQuality.fromJson(jsonData);
    print(responseString);
    return responseString;
  }

  //
//
//   Future<getdata> DataTable(url, data) async {
//     String fullurl = ApiClass.BASE_URL + url;
//
//     if (kDebugMode) {
//       print(fullurl);
//       print(data);
//     }
//     var uri = Uri.parse(fullurl);
//     var request = https.MultipartRequest("POST", uri);
//     request.fields.addAll(data!);
//     var response = await request.send();
//     final respStr = await response.stream.bytesToString();
//     var jsonData = jsonDecode(respStr);
//     var responseString = getdata.fromJson(jsonData);
//     print(responseString);
//     return responseString;
//   }

  //
//

  // Future<getdata> jobupdates(url, data) async {
  //   String fullurl = ApiClass.BASE_URL + ApiClass.jobupdates;
  //
  //   if (kDebugMode) {
  //     print(fullurl);
  //     print(data);
  //   }
  //   var uri = Uri.parse(fullurl);
  //   var request = https.MultipartRequest("POST", uri);
  //   request.fields.addAll(data!);
  //   var response = await request.send();
  //   final respStr = await response.stream.bytesToString();
  //   var jsonData = jsonDecode(respStr);
  //   var responseString = getdata.fromJson(jsonData);
  //   print(responseString);
  //   return responseString;
  // }
}
