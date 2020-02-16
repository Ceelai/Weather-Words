import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Words and Weather',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.white,
      ),
      home: MyHomePage(title: 'Flutter Words and Weather Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //String _locality = '';
  //String _weather = '';

  @override 
  initState(){
    super.initState();
    checkGps();
    getPosition();
    
  }

  //check gps 
  checkGps() async{
    final GeolocationStatus result = await Geolocator().checkGeolocationPermissionStatus();
    return result;
  }

    //get position method
  Future<Position> getPosition() async{
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  //get weather method 
  Future<String> getData(double latitude, double longitude) async{
    String api = 'https://www.metaweather.com/api/location/search/';

   

    //final url = '$api?lattlong=$latitude,$longitude';
    final url = '$api?query=$placemark'

    http.Response response = await http.get(url);

    if (response != 200){
      throw Exception('error getting location for city');
    }

    final locationJson = jsonDecode(response.body) as List;
    return (locationJson.first);
  }



  @override 
  Widget build(BuildContext context){
    return Scaffold(appBar:AppBar(title: Text('Words and Weather')
    ,)
    , 
    body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[Text('Words and Weather')
      ]
      ,)
      ,)
      );
  }

}
