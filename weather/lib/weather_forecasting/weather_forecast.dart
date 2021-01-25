import 'package:flutter/material.dart';
import 'package:weather/weather_forecasting/model/weather_forecat_model.dart';
import 'package:weather/weather_forecasting/network/network.dart';
import 'package:weather/weather_forecasting/ui/bottom_view.dart';
import 'package:weather/weather_forecasting/ui/mid_view.dart';

class WeatherForecast extends StatefulWidget {
  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  Future<WeatherForecastModel> forecastObject;
  String _cityName="Mumbai";

  @override
  void initState() {
   
    super.initState();
    forecastObject = getWeather(cityName: _cityName);

    // forecastObject.then((weather) => {
    //   print(weather.list[0].weather[0].main),
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:[
          textFieldView(),
                    Container(
                      child: FutureBuilder(
                        future: forecastObject,
                        builder: (BuildContext context, AsyncSnapshot<WeatherForecastModel>snapShot){
                          if(snapShot.hasData){
                            return Column(
                              children:[
                                midView(snapShot),
                                BottomView(snapshot: snapShot),
                              ],
                            );
                          }else{
                            return Container(
                              child: Center(child: CircularProgressIndicator(),)
                            );
                          }

                        }),
                    )
                  ]
                ),
              );
            }
          
Widget textFieldView() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      child: TextField(
        decoration: InputDecoration(
          hintText:"Enter City Name",
          prefixIcon :Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius:BorderRadius.circular(10)),
            contentPadding: EdgeInsets.all(8)
          ),
          onSubmitted:(value){
            setState(() {
              _cityName = value;
              forecastObject = getWeather(cityName: _cityName);
            });
          } ,
        ),
      ),
  );
}

Future<WeatherForecastModel> getWeather({ String cityName}) => 
new Network().getWeatherForecat(cityName: _cityName);
}
  