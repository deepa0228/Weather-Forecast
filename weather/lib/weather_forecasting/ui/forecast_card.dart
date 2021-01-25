import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/weather_forecasting/model/weather_forecat_model.dart';
import 'package:weather/weather_forecasting/util/convert_icon.dart';
import 'package:weather/weather_forecasting/util/forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel>snapshot,int index){
  var forecastList = snapshot.data.list;
  var dayOfWeek = "";
  DateTime date = new DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = Util.getFormattedData(date);
  dayOfWeek = fullDate.split(",")[0]; // in the list we have [wednesday, dec 23,2020] need only day so we use this method

  return Column(
    mainAxisAlignment : MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(dayOfWeek),
      )),
      Row(
       mainAxisAlignment : MainAxisAlignment.start,
       children: [
         CircleAvatar(
           radius: 33,
           backgroundColor: Colors.white,
           child:getWeatherIcon(weatherDescription: forecastList[index].weather[0].main,
           color: Colors.pinkAccent,
           size: 40
           ),
         ),
         Column(
           children:[
             Row(children: [
               Padding(
                 padding: const EdgeInsets.only(left:8.0),
                 child: Text("${forecastList[0].temp.min.toStringAsFixed(0)}℉"),
               ),
               Icon(FontAwesomeIcons.solidArrowAltCircleDown, color: Colors.white,
               size: 17,
               ),
             ],),
             Row(children: [
               Padding(
                 padding: const EdgeInsets.only(left:8.0),
                 child: Text("${forecastList[0].temp.max.toStringAsFixed(0)}℉"),
               ),
               Icon(FontAwesomeIcons.solidArrowAltCircleUp, color: Colors.white,
               size: 17,
               ),
             ],),
             Row(children: [
               Padding(
                 padding: const EdgeInsets.only(left:8.0),
                 child: Text("Hum:${forecastList[0].humidity.toStringAsFixed(0)}%"),
               ),
              //  Icon(FontAwesomeIcons.solidGrinBeamSweat, color: Colors.white,
              //  size: 17,
              //  ),
             ],),
             Row(children: [
               Padding(
                 padding: const EdgeInsets.only(left:8.0),
                 child: Text("Win:${forecastList[0].speed.toStringAsFixed(1)} mi/h"),
               ),
              //  Icon(FontAwesomeIcons.wind, color: Colors.white,
              //  size: 17,
              //  ),
             ],),
           ],
         )
       ], 
      ),
      
    ],

  );
   
  
}