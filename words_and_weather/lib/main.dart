import 'package:flutter/material.dart';
import 'package:words_and_weather/getdata.dart';

void main() => runApp(WeatherMain());

class WeatherMain extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.indigo[300],
        ),
        home: GetData());
  }
}
