import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

class Location{
  late double latitude;
  late double longitude;
  Future<void> getCurrentLocation()async{
      try{
        Position myposition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
        latitude = myposition.latitude;
        longitude = myposition.longitude;
        }catch(e){
          debugPrint(e.toString());
        }

  }


}