//import packages
//import 'dart:convert';
//import 'dart:html';
import 'package:flutter/material.dart';
//import 'package:geolocator/geolocator.dart';
//import 'package:http/htt' as http;
import 'package:weather/weather.dart';
import 'package:words_and_weather/wdataprop.dart';

//This dart file mainly serves as the ways to obtain weather and word data, I think i will move
//the updating UI states to another file to clean up code eventually

//Create Stateful Widget to update information
class GetData extends StatefulWidget {
  @override
  GetDataState createState() => GetDataState();
}

class GetDataState extends State<GetData> {
  WeatherStation weatherStation =
      new WeatherStation("d26e8cca4002f56655dfc70214763190");

  String _areaName = '';
  @override
  void initState() {
    super.initState();

    //Weather weatherCall = currentWeatherQuery(weatherStation) as Weather;
    currentWeatherQuery(weatherStation).then((assembledData) {
      setState(() {
        _areaName = assembledData.areaName;
      });
    });
  }

  Future<WeatherData> currentWeatherQuery(weatherStation) async {
    Weather weatherResp = await weatherStation.currentWeather();
    debugPrint(weatherResp.toString());
    return WeatherData.fromApi(weatherResp);
  }

  //link body of build method below to another private method that builds the data and returns it
  //call another ui to actually assemble
  // TODO: Build data from query
  Widget weatherDataSection = Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          )
        ],
      ));

  void _openSettings() {
    // TODO: Near Completion, Converter setting will need to be here
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: Text("Something goes here"),
      );
    }));
  }

  //Widget build method to update the current UI
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather and Words'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: _openSettings,
          )
        ],
      ),
      body: Column(
        children: [
          Text('$_areaName'),
        ],
      ),
    );
  }
}
