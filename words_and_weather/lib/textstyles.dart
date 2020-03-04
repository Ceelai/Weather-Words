import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//this file allows for a bit of an easier time styling all the widgets

//create Text widget that returns the date

Text returnDateStyled(String date) {
  return Text(
    "$date",
    style: TextStyle(
      fontSize: 12,
      color: Colors.white,
      fontWeight: FontWeight.w200,
      fontFamily: 'OpenSans',
    ),
  );
}

Text returnAreaStyled(String area) {
  return Text(
    "$area",
    style: TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontFamily: 'OpenSans'),
  );
}

Text returnWeatherStyled(String weatherDescription) {
  return Text(
    "$weatherDescription",
    style: TextStyle(
      fontFamily: 'OpenSans',
      color: Colors.white,
      fontSize: 20,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w200,
    ),
  );
}

Text returnTempStyled(String temp) {
  return Text(
    "$temp°",
    style: TextStyle(
      fontFamily: 'OpenSans',
      color: Colors.white,
      fontSize: 72,
      fontWeight: FontWeight.w400,
    ),
  );
}
