import 'dart:convert';
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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Words and Weather Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  //String _locality = '';
  //String _weather = '';
  Position _currentPosition; 


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
    _currentPosition = position;
    print(_currentPosition);
    return _currentPosition;
  }

  //get weather method 
  Future<String> getData(double latitude, double longitude) async{
    String api = 'https://www.metaweather.com//api/location/search/?lattlong=';

    

    //final url = '$api?lattlong=$latitude,$longitude';
    final url = '$api$_currentPosition.lattitude,$_currentPosition.longitude';

    http.Response response = await http.get(url);

    final locationJson = jsonDecode(response.body) as List;
    print(locationJson.first);
    return (locationJson.first);
  }



  @override 
  Widget build(BuildContext context){
    return Scaffold(appBar:AppBar(title: Text('Words and Weather'),),);
      
    
  }

}

