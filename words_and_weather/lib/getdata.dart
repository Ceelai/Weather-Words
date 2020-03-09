//import packages
import 'dart:convert';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:words_and_weather/weatherprop.dart';
import 'package:words_and_weather/wordprop.dart';
import 'textstyles.dart';
import 'package:http/http.dart' as http;

//This dart file mainly serves as the ways to obtain weather and word data, I think i will move
//the updating UI states to another file to clean up code eventually

//Create Stateful Widget to update information
class GetData extends StatefulWidget {
  @override
  GetDataState createState() => GetDataState(httpClient: null);
}

class GetDataState extends State<GetData> {
  WeatherStation weatherStation =
      new WeatherStation("d26e8cca4002f56655dfc70214763190");

  String _areaName = '';
  String _dateText = '';
  String _mainTemp = '';
  String _mainWeather = '';
  IconData _icon;
  String _backgroundImage;
  String _word = '';
  String _definition = "";
  String _pronounciation = "";

  GetDataState({@required this.httpClient});

  get wordUrl => null;

  @override
  void initState() {
    currentWeatherQuery(weatherStation).then((assembledData) {
      setState(() {
        _icon = assembledData.weatherIcon;
        _areaName = assembledData.areaName;
        _mainTemp = assembledData.temperature.toString();
        _dateText = formatDate(DateTime.now(), [DD, ', ', MM, ' ', d]);
        _mainWeather = assembledData.weatherMain;
        _backgroundImage = assembledData.backgroundImage;
      });
    });

    getRandomWord().then((data) {
      setState(() {
        _word = data.word.toString();
        _definition = data.definition.toString();
        _pronounciation = data.pronounciation.toString();
      });
    });

    super.initState();
  }

  String baseURL = 'https://api.datamuse.com/words';
  final http.Client httpClient;

 
  Future<WeatherData> currentWeatherQuery(weatherStation) async {
    final weatherResp = await weatherStation.currentWeather();

    debugPrint(weatherResp.toString());

    return WeatherData.fromApi(weatherResp);
    //handle exceptions
  }

   Future<WordData> getRandomWord() async {
    final wordUrl = '$baseURL?sp=???????&md=dr&max=2';
    final wordResponse = await http.get(wordUrl);

    if (wordResponse.statusCode != 200) {
      throw Exception('There was a problem getting a word');
    }
    final wordJson = jsonDecode(wordResponse.body);
    return WordData.fromJson(wordJson);
  }


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
        child: CircularProgressIndicator(),
      );
    } else {
      return Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(_backgroundImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.white30,
              elevation: 0,
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  returnDateStyled(_dateText),
                ],
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.settings),
                  color: Colors.white,
                  onPressed: _openSettings,
                )
              ],
            ),
            body: Container(
              child: ListView(
                children: <Widget>[
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
                  SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Center(
                          child: returnWeatherStyled(_mainWeather),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 14,
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
                            size: 64,
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
                  ),
                  Divider(color: Colors.grey),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      
                        Text(_word),
                        Text(_pronounciation),
                        Text(_definition),
                      
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      );
    }
  }
}

/**/
