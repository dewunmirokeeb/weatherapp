import 'package:flutter/material.dart';
import 'package:weatherapp/utilities/constants.dart';
import 'package:weatherapp/services/weather.dart';
import 'package:weatherapp/screens/city_screen.dart';

class LocationScreen extends StatefulWidget {
   const LocationScreen(this.locationweather,{ Key? key }) : super(key: key);
  final dynamic locationweather;
  @override
  _LocationScreenState createState() => _LocationScreenState ();
}

class _LocationScreenState extends State<LocationScreen> {
  late int temperature;
  late String weathericon;
  late String cityName;
  late String message;
  WeatherModel weatherModel = WeatherModel();

  @override
  void initState(){
    super.initState();
    updateUi(widget.locationweather);
  }

  void updateUi(dynamic weatherData){
    setState(() {

      if(weatherData == null){
        temperature = 0;
        weathericon = 'Error';
        message = 'Unable to get weather data';
        cityName = '';

        return;
      }

    double temp = weatherData['main']['temp'];
    temperature = temp.round();
    int condition = weatherData['weather'][0]['id'];
    weathericon = weatherModel.getWeatherIcon(condition);
    message = weatherModel.getMessage(temperature);
    cityName = weatherData['name']; 
      
    });
    
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),

        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () async{
                        var weatherData = await weatherModel.getLocationWeather();
                        updateUi(weatherData);
                      }, 
                      child: const Icon(Icons.near_me,
                      size: 50,
                      color: Colors.blue,
                      ),
                    ),

                    TextButton(
                      onPressed: () async{
                        var typedName = await Navigator.push(context, MaterialPageRoute(builder: (context){
                        return const CityScreen();
                      },
                    ),
                  );
                  if(typedName != null){
                    var weatherData = await weatherModel.getCityWeather(typedName);
                    updateUi(weatherData);

                  }
                }, 
                      child: const Icon(Icons.location_city,
                      color: Colors.blue,
                      size: 50,
                      ),
                    ),

                    
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left:15.0),
                child: Row(
                  children: [
                     Expanded(
                       child: Text(
                        '$temperature°C',
                        style: kTempTextStyle,
                                         ),
                     ),

                     Text(
                        weathericon,
                        style: kConditionTextStyle,
                      ),
                  ],
                ),
              ),

             Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  '$message in $cityName',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,

                  ),
              ),

              




          ],
          ),
          
          ),

      ),
      
    );
  }
}