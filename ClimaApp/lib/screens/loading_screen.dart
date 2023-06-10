import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:clima_app/services/location.dart';
import 'package:http/http.dart' as http;
import 'package:clima_app/key.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    double latitude = location.latitude;
    double longitude = location.longitude;

    getData(latitude, longitude);
  }

  void getData(double lat, double long) async {
    var url = Uri.https('api.weatherapi.com', '/v1/current.json',
        {'key': apiKey, 'q': '$lat,$long'});
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);

      double tempDouble = decodedData['current']['temp_c'];
      int temp = tempDouble.toInt();
      String condition = decodedData['current']['condition']['text'];
      String cityName = decodedData['location']['name'];

      print("$temp,$condition,$cityName");
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            getLocation();
          },
          child: const Text('Get Location'),
        ),
      ),
    );
  }
}
