//import packages 
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather/weather.dart';

//This dart file mainly serves as the ways to obtain weather and word data, I think i will move 
//the updating UI states to another file to clean up code eventually 


//Create Stateful Widget to update information 
class GetData extends StatefulWidget{
  @override 
  GetDataState createState() => GetDataState();
}

class GetDataState extends State<GetData> {



  //Widget build method to update the current UI 
  Widget build(context){
    
  }
}


