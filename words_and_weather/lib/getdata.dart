//import packages
//import 'dart:html';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:words_and_weather/wdataprop.dart';
import 'package:google_fonts/google_fonts.dart';
import 'textstyles.dart';

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
  //String _timeText = '';
  String _dateText = '';
  String _mainTemp = '';
  String _mainWeather = '';
  IconData _icon;

  @override
  void initState() {
    currentWeatherQuery(weatherStation).then((assembledData) {
      setState(() {
        _icon = assembledData.weatherIcon;
        _areaName = assembledData.areaName;
        _mainTemp = assembledData.temperature.toString();
        _dateText = formatDate(DateTime.now(), [DD, ', ', d, ' ', MM]);

        _mainWeather = assembledData.weatherDescription;
      });
    });
    super.initState();
  }

  Future<WeatherData> currentWeatherQuery(weatherStation) async {
    Weather weatherResp = await weatherStation.currentWeather();
    debugPrint(weatherResp.toString());

    return WeatherData.fromApi(weatherResp);
    //handle exceptions
  }

  //link body of build method below to another private method that builds the data and returns it
  //call another ui to actually assemble

  // Widget _buildWeather = Container(
  //     padding: const EdgeInsets.all(20),
  //     child: Row(
  //       children: [
  //         Expanded(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //           ),
  //         )
  //       ],
  //     ));

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
    if (_icon == null) {
      return new Container(
          //add animation or somethign in here
          );
    } else {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Center(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Center(
                      child: returnAreaStyled(_areaName),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(1),
                    child: Center(
                      child: returnWeatherStyled(_mainWeather),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      BoxedIcon(
                        _icon,
                        color: Colors.white,
                        size: 100,
                      )
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Center(
                      child: returnTempStyled(_mainTemp),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }
  }
}

/**/
