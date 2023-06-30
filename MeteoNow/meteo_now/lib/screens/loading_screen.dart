import 'package:flutter/material.dart';
import 'package:meteo_now/screens/location_screen.dart';
import 'package:meteo_now/services/location.dart';
import '../services/networking.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    double latitude = location.latitude;
    double longitude = location.longitude;

    Networking networking = Networking();

    var weatherData = await networking.getData(latitude, longitude);

    if (context.mounted) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(
          locationWeather: weatherData,
        );
      }));
    }
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
