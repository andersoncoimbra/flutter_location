import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'geolacation/position.dart' as geo;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Lotation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CurrentLocation(title: 'Flutter Demo Location'),
    );
  }
}

class CurrentLocation extends StatefulWidget {
  const CurrentLocation({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<CurrentLocation> createState() => _CurrentLocation();
}

class _CurrentLocation extends State<CurrentLocation> {
  String? currentLocation;

  @override
  void initState() {
    _getPosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Localização"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            (currentLocation != null) ? Text(currentLocation!) : Container()
          ],
        ),
      ),
    );
  }

  Future<void> _getPosition() async {
    Position? position = await geo.determinePosition();
    if (position != null) {
      setState(() {
        currentLocation = "Latitude: ${position.latitude}" +
            " , " +
            "Logitude: ${position.longitude}";
      });
    }
  }
}
