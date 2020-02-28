import 'package:weather/weather.dart';
import 'package:date_format/date_format.dart';

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

class WeatherData{
  final String areaName;
  final double cloudiness;
  final WeatherCondition formattedCondition; 
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
  final double temperature;
  final Temperature tempMax;
  final Temperature tempMin;
  final String weatherDescription;
  final String weatherIcon;
  final String weatherMain;
  final double windDegree;
  final double windSpeed;
  final DateTime lastUpdated;

  

  WeatherData(
      {this.areaName,
      this.country,
      this.formattedCondition,
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
      this.windSpeed,});

  static WeatherData fromApi(Weather weatherResp) {
      final assembledWeather = weatherResp;
      
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
        temperature: assembledWeather.temperature.celsius.roundToDouble(),
        tempMax: assembledWeather.tempMax,
        tempMin: assembledWeather.tempMin,
        weatherDescription: assembledWeather.weatherDescription,
        weatherIcon: assembledWeather.weatherIcon,
        windDegree: assembledWeather.windDegree,
        windSpeed: assembledWeather.windSpeed,
        weatherMain: assembledWeather.weatherMain,
        formattedCondition: _mapStringToWeatherCondition(assembledWeather.weatherMain),
        lastUpdated: DateTime.now(),
      );
  }


  static WeatherCondition _mapStringToWeatherCondition(String input){
      WeatherCondition state;

      switch (input){
        case 'Snow':
          state = WeatherCondition.snow;
          break;
        case 'Drizzle':
          state = WeatherCondition.drizzle;
          break;
        case 'Thunderstorm':
          state = WeatherCondition.thunderstorm;
          break;
        case 'Rain':
          state = WeatherCondition.rain;
          break; 
        case 'Cloud':
          state = WeatherCondition.cloud;
          break;
        case 'Clear':
          state = WeatherCondition.clear;
          break;
        default:
          state = WeatherCondition.unknown;      
      }
      return state;
  }
}
