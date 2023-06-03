import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

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
      home: const XylophoneApp(),
    );
  }
}

class XylophoneApp extends StatefulWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  @override
  State<XylophoneApp> createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  void playAudio(String assetnr) async {
    final player = AudioPlayer();
    await player.play(AssetSource("assets_note$assetnr.wav"));
  }

  Widget buildKeys(MaterialColor color, String assetnr) {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: color,
        child: TextButton(
          onPressed: () => playAudio(assetnr),
          child: const Text(""),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            buildKeys(Colors.red, "1"),
            buildKeys(Colors.orange, "2"),
            buildKeys(Colors.yellow, "3"),
            buildKeys(Colors.lightGreen, "4"),
            buildKeys(Colors.green, "5"),
            buildKeys(Colors.blue, "6"),
            buildKeys(Colors.purple, "7"),
          ],
        ),
      ),
    );
  }
}
