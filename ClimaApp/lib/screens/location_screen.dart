import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/assets/images/rain/rain1.jpg"),
              fit: BoxFit.cover),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Empty Box For Adding Space Between Top Of The Screen And First Widget
              const SizedBox(
                height: 80,
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

              // Separator
              const SizedBox(height: 50),

              // City Name Widget
              const Text(
                'Weather in Bucharest',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),

              // Degree Card
              Card(
                color: const Color(0x99666666),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                clipBehavior: Clip.hardEdge,
                child: const SizedBox(
                  width: 200,
                  height: 200,
                  child: Center(
                    child: Text(
                      '19°',
                      style: TextStyle(fontSize: 100),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
