import 'package:flutter/material.dart';
import 'package:weatherapp/screens/location_screen.dart';
import 'package:weatherapp/services/location.dart';
import 'package:weatherapp/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apikey = '8fe452ac9386c1c1f0a5cbf2f2b94c4b';


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
      Location location = Location();
      await location.getCurrentLocation();
      NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric'); 
        var weatherData = await networkHelper.getData();
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