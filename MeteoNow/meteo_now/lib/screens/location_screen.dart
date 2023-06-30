import 'package:flutter/material.dart';
import 'package:meteo_now/screens/error_screen.dart';
import 'package:meteo_now/utilities/constants.dart';
import 'package:meteo_now/utilities/custom_card.dart';
import 'package:meteo_now/utilities/overview_card.dart';
import 'package:meteo_now/services/weather.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key, this.locationWeather}) : super(key: key);

  final Map? locationWeather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late double temp;
  late String condition;
  late int conditionCode;
  late String cityName;
  late String region;
  late String country;
  late double windSpeed;
  late double pressure;
  late double uvIndex;
  late String time;
  late String lastUpdated;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(Map? weatherData) {
    if (weatherData == null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const ErrorScreen();
      }));
    } else {
      temp = weatherData['current']['temp_c'];
      condition = weatherData['current']['condition']['text'];
      conditionCode = weatherData['current']['condition']['code'];
      cityName = weatherData['location']['name'];
      region = weatherData['location']['region'];
      country = weatherData['location']['country'];
      windSpeed = weatherData['current']['wind_kph'];
      pressure = weatherData['current']['pressure_mb'];
      uvIndex = weatherData['current']['uv'];
      time = weatherData['location']['localtime'];

      List splitTime = time.split(" ");
      lastUpdated = splitTime[1];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: WeatherModel().getBackgroundImage(conditionCode),
                fit: BoxFit.cover),
          ),
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Empty Box For Adding Space Between Top Of The Screen And First Widget
                  const SizedBox(
                    height: 20,
                  ),

                  // City Text Input
                  SizedBox(
                    width: 300,
                    child: TextField(
                      textCapitalization: TextCapitalization.words,
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                      decoration: InputDecoration(
                        hintText: "Enter City Name Here",
                        hintStyle:
                            const TextStyle(color: Colors.black, fontSize: 18),
                        filled: true,
                        fillColor: const Color(0x99666666),
                        contentPadding: const EdgeInsets.all(16.0),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        enabledBorder: OutlineInputBorder(
                          gapPadding: 8.0,
                          borderSide:
                              const BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        border: OutlineInputBorder(
                          gapPadding: 8.0,
                          borderSide:
                              const BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  // City Name Widget
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    clipBehavior: Clip.hardEdge,
                    color: kCardColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cityName,
                                style: const TextStyle(
                                    fontFamily: 'OpenSans',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '$region, $country',
                                maxLines: 2,
                                softWrap: true,
                                style: const TextStyle(
                                  fontFamily: 'OpenSans',
                                  color: Colors.white54,
                                ),
                              )
                            ],
                          ),
                          Text(
                            lastUpdated,
                            style: const TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    height: 25,
                    thickness: 1,
                    color: Colors.black,
                    indent: 20,
                    endIndent: 20,
                  ),

                  const SizedBox(
                    height: 100,
                  ),
                  // Degree Card
                  Expanded(
                    child: Card(
                      color: kCardColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      clipBehavior: Clip.hardEdge,
                      child: SizedBox(
                        height: 50,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${temp.toInt().toString()}°',
                                  style: const TextStyle(fontSize: 30),
                                ),
                                Text(
                                  condition,
                                  style: const TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomCard(
                        rad: 20,
                        child: OverviewCard(
                          icon: Icons.wind_power,
                          title: 'Wind Speed',
                          data: windSpeed.toString(),
                        ),
                      ),
                      CustomCard(
                        rad: 20,
                        child: OverviewCard(
                          icon: Icons.water,
                          title: 'Pressure',
                          data: pressure.toString(),
                        ),
                      ),
                      CustomCard(
                        rad: 20,
                        child: OverviewCard(
                          icon: Icons.sunny,
                          title: 'UV Index',
                          data: uvIndex.toString(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
