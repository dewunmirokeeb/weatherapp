import 'package:flutter/material.dart';
import 'package:weatherapp/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weatherapp/services/weather.dart';




class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key }) : super(key: key);
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState(){
    super.initState();
    getLocationData();

  }
    void getLocationData() async{
      WeatherModel weatherModel = WeatherModel();
      var weatherData = await weatherModel.getLocationWeather();
           
       Navigator.push(context, MaterialPageRoute(builder: (context){
         return LocationScreen(weatherData);
       }
       ));
  }
  

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.red,
          size: 50,
        ),
        ),
      
    );
      
    
  }
}