import 'package:http/http.dart' as http;
import 'dart:convert';
import '../key.dart';

class Networking {
  Future getData(double lat, double long) async {
    var url = Uri.https('api.weatherapi.com', '/v1/current.json',
        {'key': apiKey, 'q': '$lat,$long'});
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
