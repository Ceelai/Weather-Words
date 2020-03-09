import 'package:flutter/cupertino.dart';
import 'package:weather/weather.dart';
//import 'package:date_format/date_format.dart';
import 'package:weather_icons/weather_icons.dart';

enum WeatherCondition {
  snow,
  drizzle,
  hail,
  thunderstorm,
  rain,
  cloud,
  clear,
  unknown
}

class WeatherData {
  final String areaName;
  final double cloudiness;
  final String country;
  final DateTime date;
  final double humudity;
  final double latitude;
  final double longitude;
  final double pressure;
  final double rainLast3Hours;
  final double rainLastHour;
  final double snowLast3Hours;
  final double snowLastHour;
  final DateTime sunrise;
  final DateTime sunset;
  final int temperature;
  final Temperature tempMax;
  final Temperature tempMin;
  final String weatherDescription;
  final IconData weatherIcon;
  final String weatherMain;
  final double windDegree;
  final double windSpeed;
  final DateTime lastUpdated;
  final String backgroundImage;

  WeatherData({
    this.areaName,
    this.country,
    this.cloudiness,
    this.date,
    this.humudity,
    this.latitude,
    this.longitude,
    this.pressure,
    this.rainLast3Hours,
    this.rainLastHour,
    this.snowLast3Hours,
    this.snowLastHour,
    this.sunrise,
    this.sunset,
    this.temperature,
    this.tempMax,
    this.tempMin,
    this.weatherDescription,
    this.weatherIcon,
    this.weatherMain,
    this.windDegree,
    this.lastUpdated,
    this.windSpeed,
    this.backgroundImage,
  });

  static WeatherData fromApi(Weather weatherResp) {
    final assembledWeather = weatherResp;
    debugPrint(assembledWeather.weatherIcon.toString());
    String resultBackground = _returnWeatherBackground(assembledWeather.weatherIcon);
    IconData resultWeatherIcon =
        _returnWeatherIcon(assembledWeather.weatherIcon);
    return WeatherData(
      areaName: assembledWeather.areaName,
      country: assembledWeather.country,
      cloudiness: assembledWeather.cloudiness,
      date: assembledWeather.date,
      humudity: assembledWeather.humidity,
      latitude: assembledWeather.latitude,
      longitude: assembledWeather.longitude,
      pressure: assembledWeather.pressure,
      rainLast3Hours: assembledWeather.rainLast3Hours,
      rainLastHour: assembledWeather.rainLastHour,
      snowLast3Hours: assembledWeather.snowLast3Hours,
      snowLastHour: assembledWeather.snowLastHour,
      sunrise: assembledWeather.sunrise,
      sunset: assembledWeather.sunset,
      temperature: assembledWeather.temperature.celsius.round(),
      tempMax: assembledWeather.tempMax,
      tempMin: assembledWeather.tempMin,
      weatherDescription: assembledWeather.weatherDescription,
      weatherIcon: resultWeatherIcon,
      windDegree: assembledWeather.windDegree,
      windSpeed: assembledWeather.windSpeed,
      weatherMain: assembledWeather.weatherMain,
      lastUpdated: DateTime.now(),
      backgroundImage: resultBackground,
    );
  }

  // static String _getTemperatureUnit(String setting){
  //   return setting;
  // }

  static String _returnWeatherBackground(String input) {
    String img;

    switch (input) {
      case '11d':
        img = 'assets/images/thunderstorm.jpg';
        break;
      case '11n':
        img = 'assets/images/thunderstorm.jpg';
        break;
      case '09d':
        img = 'assets/images/bigbenrain.jpg';
        break;
      case '09n':
        img = 'assets/images/bigbenrain.jpg';
        break;
      case '13d':
        img = 'assets/images/snow.jpg';
        break;
      case '13n':
        img = 'assets/images/snow.jpg';
        break;
      case '50d':
        img = 'assets/images/fog.jpg';
        break;
      case '50n':
        img = 'assets/images/fog.jpg';
        break;
      case '10d':
        img = 'assets/images/bigbenrain.jpg';
        break;
      case '10n':
        img = 'assets/images/bigbenrain.jpg';
        break;
      case '02d':
        img = 'assets/images/cloud.jpg';
        break;
      case '02n':
        img = 'assets/images/cloud.jpg';
        break;
      case '01d':
        img = 'assets/images/clearsky.jpg';
        break;
      case '01n':
        img = 'assets/images/clearsky.jpg';
        break;
      case '04d':
        img = 'assets/images/cloud1.jpg';
        break;
      case '04n':
        img = 'assets/images/cloud1.jpg';
        break;
      case '03d':
        img = 'assets/images/cloud.jpg';
        break;
      case '03n':
        img = 'assets/images/cloud.jpg';
        break;
      default:
        img = null;
    }
    return img;
  }

  static IconData _returnWeatherIcon(String input) {
    IconData state;

    switch (input) {
      case '11d':
        state = WeatherIcons.thunderstorm;
        break;
      case '11n':
        state = WeatherIcons.night_alt_thunderstorm;
        break;
      case '09d':
        state = WeatherIcons.rain_mix;
        break;
      case '09n':
        state = WeatherIcons.night_alt_rain_mix;
        break;
      case '13d':
        state = WeatherIcons.snowflake_cold;
        break;
      case '13n':
        state = WeatherIcons.snowflake_cold;
        break;
      case '50d':
        state = WeatherIcons.fog;
        break;
      case '50n':
        state = WeatherIcons.fog;
        break;
      case '10d':
        state = WeatherIcons.rain;
        break;
      case '10n':
        state = WeatherIcons.rain;
        break;
      case '02d':
        state = WeatherIcons.day_cloudy;
        break;
      case '02n':
        state = WeatherIcons.night_alt_cloudy;
        break;
      case '01d':
        state = WeatherIcons.day_sunny;
        break;
      case '01n':
        state = WeatherIcons.night_clear;
        break;
      case '04d':
        state = WeatherIcons.cloudy;
        break;
      case '04n':
        state = WeatherIcons.cloudy;
        break;
      case '03d':
        state = WeatherIcons.cloud;
        break;
      case '03n':
        state = WeatherIcons.cloud;
        break;
      default:
        state = WeatherIcons.na;
    }
    return state;
  }
}
