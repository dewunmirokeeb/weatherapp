import 'package:flutter/material.dart';
import 'package:weatherapp/utilities/constants.dart';


class CityScreen extends StatefulWidget {
  const CityScreen({ Key? key }) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {

  String cityName = '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),

        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            
            children:<Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: (value){
                    cityName = value;
                  },
                  style: const TextStyle(color: Colors.black),
                  decoration: kTextfield, 
                ),
              ),
              TextButton(
                onPressed: () {
                  if(cityName ==''){
                    return;
                  }
                  Navigator.pop(context, cityName);
                },
                child: const Text(
                  'Get Weather',
                  style: kButtonTextStyle, 
                ),

              ),
              
              ],
            
           ),
        ),
      ),
    );
  }
}