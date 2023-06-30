import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meteo_now/utilities/constants.dart';
import 'package:meteo_now/utilities/custom_card.dart';
import 'package:meteo_now/utilities/overview_card.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/assets/images/rain/rain1.jpg"),
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
                            children: const [
                              Text(
                                'Soseaua Odaii',
                                style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Bucuresti, Romania',
                                style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    color: Colors.white54),
                              )
                            ],
                          ),
                          const Text(
                            '08:54 AM',
                            style: TextStyle(
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

                  // Degree Card
                  Card(
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
                            children: const [
                              Text(
                                '19° C',
                                style: TextStyle(fontSize: 30),
                              ),
                              Text(
                                'Heavy Rain',
                                style: TextStyle(fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      CustomCard(
                        rad: 20,
                        child: OverviewCard(
                          icon: Icons.wind_power,
                          title: 'Wind Speed',
                          data: '12 Km/h',
                        ),
                      ),
                      CustomCard(
                        rad: 20,
                        child: OverviewCard(
                          icon: Icons.water,
                          title: 'Pressure',
                          data: '720 hpa',
                        ),
                      ),
                      CustomCard(
                        rad: 20,
                        child: OverviewCard(
                          icon: Icons.sunny,
                          title: 'UV Index',
                          data: '2.3',
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
