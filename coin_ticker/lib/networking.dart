import 'package:http/http.dart' as http;
import 'key.dart';
import 'dart:convert';

class Networking {
  Future getData(String? currency) async {
    var url = Uri.https(
        'rest.coinapi.io', '/v1/exchangerate/BTC/$currency', {'apikey': KEY});
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
