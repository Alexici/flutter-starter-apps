import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MiCard(),
    );
  }
}

class MiCard extends StatelessWidget {
  const MiCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("images/profile.jpg"),
            ),
            const Text(
              "Alex Stan",
              style: TextStyle(
                fontFamily: "PermanentMarker",
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            Text(
              "JUNIOR FLUTTER DEVELOPER",
              style: TextStyle(
                fontFamily: "Comfortaa",
                color: Colors.teal.shade50,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            SizedBox(
              width: 150,
              height: 20,
              child: Divider(
                thickness: 1,
                color: Colors.teal.shade50,
              ),
            ),
            Card(
              margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.teal.shade800,
                  size: 30,
                ),
                title: Text(
                  "+40738727531",
                  style: TextStyle(
                    color: Colors.teal.shade800,
                    fontFamily: "Comfortaa",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: Icon(
                  Icons.alternate_email,
                  color: Colors.teal.shade800,
                  size: 30,
                ),
                title: Text(
                  "alex.stan2506@gmail.com",
                  style: TextStyle(
                    color: Colors.teal.shade800,
                    fontFamily: "Comfortaa",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
