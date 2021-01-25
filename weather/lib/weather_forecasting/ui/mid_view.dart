import 'package:flutter/material.dart';
import 'package:weather/weather_forecasting/model/weather_forecat_model.dart';
import 'package:weather/weather_forecasting/util/convert_icon.dart';
import 'package:weather/weather_forecasting/util/forecast_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Second method

Widget midView(AsyncSnapshot<WeatherForecastModel> snapShot){
   var forecastList = snapShot.data.list;
   var formattedDate = new DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt * 1000);
   var name1 = snapShot.data.city.name;
      var name2 = snapShot.data.city.country;
            Container midView = Container(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("$name1,$name2",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize:18,
                    color:Colors.black87,
                  ),),
                  Text("${Util.getFormattedData(formattedDate)}",style: TextStyle(
                    fontSize: 15,
                  ),),
                  SizedBox(height:10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: getWeatherIcon(weatherDescription: forecastList[0].weather[0].main,
                    color: Colors.pinkAccent,
                    size:198
                    ),
                  ),
                  // Icon(FontAwesomeIcons.cloud, size: 198,color: Colors.pinkAccent),
                  // Icon(Icons.wb_sunny,size: 195,color: Colors.yellow,),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:12, horizontal:12 ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${forecastList[0].temp.day.toStringAsFixed(0)}℉",
                        style: TextStyle(fontSize: 34),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${forecastList[0].weather[0].description.toUpperCase()}"),
                        ),

                      ],
                    ),
                    
                  ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical:12, horizontal:12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:[
                                    Text("${forecastList[0].speed.toStringAsFixed(1)} mi/h"),
                                    Icon(FontAwesomeIcons.wind, size: 20,color: Colors.brown),
                                    // Icon(Icons.arrow_forward, size:20,color:Colors.brown),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  Text("${forecastList[0].humidity.toStringAsFixed(0)} %"),
                                   Icon(FontAwesomeIcons.solidGrinBeamSweat, size: 20,color: Colors.brown),
                                  //  Icon(Icons.hot_tub, size:20,color:Colors.brown),
                                ],),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:[
                                    Text("${forecastList[0].temp.max.toStringAsFixed(0)}℉"),
                                    Icon(FontAwesomeIcons.temperatureHigh, size: 20,color: Colors.brown),
                                    // Icon(Icons.wb_sunny, size:20,color:Colors.brown),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                     ],
                   ),
                ),
             );
   return midView;
}