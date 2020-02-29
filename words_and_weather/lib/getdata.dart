//import packages

//import 'dart:html';
import 'package:flutter/material.dart';
//import 'package:geolocator/geolocator.dart';
//import 'package:http/htt' as http;
import 'package:weather/weather.dart';
import 'package:weather_icons/weather_icons.dart';
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
  String _timeText = '';
  String _mainTemp = '';
  IconData _icon; 

  @override
  void initState() {
    super.initState();

    currentWeatherQuery(weatherStation).then((assembledData) {
      setState(() {
        _areaName = assembledData.areaName;
        DateTime assembledTime = assembledData.lastUpdated;
        _mainTemp = assembledData.temperature.toString();
        _timeText = TimeOfDay.fromDateTime(assembledTime).format(context);
        _icon = assembledData.weatherIcon;
        debugPrint(_icon.toString());
        //for temperature get user preference
      });
    });
  }

  Future<WeatherData> currentWeatherQuery(weatherStation) async {
    Weather weatherResp = await weatherStation.currentWeather();
    debugPrint(weatherResp.toString());
    return WeatherData.fromApi(weatherResp);

    //handle exceptions
  }

  //link body of build method below to another private method that builds the data and returns it
  //call another ui to actually assemble

  Widget _buildWeather = Container(
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
    //Complete the Settings Screen transition
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'assets/images/WordsWeatherCharacter.png',
              fit: BoxFit.cover,
              height: 50,
            )
          ],
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: _openSettings,
          )
        ],
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Center(
                child: Text(
                  "$_areaName",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: Center(
                child: Text(
                  "Last Updated: $_timeText",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Center(
                    child: Text(
                      "$_mainTemp°C",
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      children: <Widget>[
                       BoxedIcon(_icon, color: Colors.white, size: 100,)
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/**/
