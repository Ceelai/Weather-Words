//import packages
import 'dart:convert';

import 'dart:math';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:words_and_weather/weatherprop.dart';
import 'package:words_and_weather/wordprop.dart';
import 'textstyles.dart';
import 'package:http/http.dart' as http;
import "string_extension.dart";

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

  String _dateText = formatDate(DateTime.now(), [DD, ', ', MM, ' ', d]);

  String _word = '';
  String _definition = "";
  // String _pronounciation = "";
  String _wordClass = "";

  GetDataState({@required this.httpClient});

  get wordUrl => null;
  Future<WeatherData> futureData;
  @override
  void initState() {
    //asyncWeatherRetrieve();
    futureData = currentWeatherQuery(weatherStation);
    asyncWordRetrieve();

    super.initState();
  }

  void asyncWordRetrieve() async {
    await getRandomWord().then((data) {
      setState(() {
        _word = data.word.capitalize().toString();
        _definition = data.definition
            .replaceFirst(new RegExp(r'[nNvadjadDv\t][adj\t]'), '');

        // _pronounciation = data.pronounciation.toString();
        _wordClass = data.wordClass.toString();
      });
    });
  }

  //baseurl
  String baseURL = 'https://api.datamuse.com/words';

  //get an instance of the http client
  final http.Client httpClient;

  //randomnumber
  Random random = new Random();

  //Future weather query that passes to data persistence class
  Future<WeatherData> currentWeatherQuery(weatherStation) async {
    final weatherResp = await weatherStation.currentWeather();
    debugPrint(weatherResp.toString());
    return WeatherData.fromApi(weatherResp);
    //handle exceptions
  }

  //generate a random word length for use in the url string
  String generateWordLength(int wordLength) {
    int digits = wordLength;
    String q = "?";
    String newLength = '';

    newLength = q * digits;
    return newLength;
  }

  //get random word function for use in SetState
  Future<WordData> getRandomWord() async {
    int randomNumber = random.nextInt(5) + 5;

    String wordLen = generateWordLength(randomNumber);

    final wordUrl = '$baseURL?sp=$wordLen&md=drp&max=50';
    final wordResponse = await http.get(wordUrl);

    if (wordResponse.statusCode != 200) {
      throw Exception('There was a problem getting a word');
    }
    final wordJson = jsonDecode(wordResponse.body);
    return WordData.fromJson(wordJson);
  }

  void _openSettings(BuildContext context) {
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
    return FutureBuilder<WeatherData>(
        future: futureData,
        builder: (BuildContext context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text('Loading...');
            default:
              if (snapshot.hasData) {
                return Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(snapshot.data.backgroundImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Scaffold(
                        backgroundColor: Colors.black12,
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
                              onPressed: () => _openSettings(context),
                            )
                          ],
                        ),
                        body: Container(
                          child: ListView(
                            physics: AlwaysScrollableScrollPhysics(),
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Center(
                                      child: returnAreaStyled(
                                          snapshot.data.areaName),
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
                                      child: returnWeatherStyled(
                                          snapshot.data.weatherMain),
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
                                        snapshot.data.weatherIcon,
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
                                      child: returnTempStyled(
                                          snapshot.data.temperature.toString()),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.black26,
                                thickness: 2,
                              ),
                              //word row
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                      padding: const EdgeInsets.only(left: 25),
                                      child: returnWordStyled(_word)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 8, top: 8),
                                    child: returnClassStyled(_wordClass),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 8),
                                child: returnDefStyled(_definition),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]);
              } else if (snapshot.hasData) {
                return Text("${snapshot.error}");
              }

              return SizedBox(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                  semanticsLabel: "Loading",
                ),
                height: 200,
                width: 200,
              );
          }
        });
  }
}
