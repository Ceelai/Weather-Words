import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

//this file allows for a bit of an easier time styling all the widgets

//create Text widget that returns the date

Text returnDateStyled(String date) {
  return Text(
    "$date",
    style: TextStyle(
      fontSize: 15,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      
    ),
  );
}

Text returnAreaStyled(String area) {
  return Text(
    "$area",
    style: TextStyle(
        color: Colors.white,
        fontSize: 25,
        letterSpacing: 5,
        fontWeight: FontWeight.w900,
        
        ),
  );
}

Text returnWeatherStyled(String weatherDescription) {
  return Text(
    "$weatherDescription",
    style: TextStyle(
      letterSpacing: 5,
      color: Colors.white,
      fontSize: 18,
      
      fontWeight: FontWeight.w300,
    ),
  );
}

Text returnTempStyled(String temp) {
  return Text(
    "$temp°",
    style: TextStyle(
      fontFamily: 'OpenSans',
      color: Colors.white,
      fontSize: 80,
      fontWeight: FontWeight.w400,
    ),
  );
}
