import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather/weather_forecasting/model/weather_forecat_model.dart';
import 'package:weather/weather_forecasting/util/forecast_util.dart';


class Network{
  Future<WeatherForecastModel> getWeatherForecat({String cityName})async{
    var finalUrl = "https://api.openweathermap.org/data/2.5/forecast/daily?q="+cityName+"&appid="+Util.appId+"&units=imperial";//change to metric or imperial

    final response = await get(Uri.encodeFull(finalUrl));
    print("Url: ${Uri.encodeFull(finalUrl)}");

    if(response.statusCode == 200){
      print("Weather data:${response.body}");
      return WeatherForecastModel.fromJson(json.decode(response.body));// we get the actual mapped dart object
    }else
    throw Exception("Error getting weather forecast");
  }
}