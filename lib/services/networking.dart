import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';


class NetworkHelper{
  NetworkHelper(this.url);
  final String url;
  Future getData() async{
   http.Response response = await http.get(Uri.parse(url));
   String data;
   if(response.statusCode == 200){
      data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
   }else{
     debugPrint(response.statusCode.toString());
   }
 }
}

/*var longitude = jsonDecode(data)['coord']['lon'];
       var weatherdescription = jsonDecode(data)['weather'][0]['description'];
       var temperature = jsonDecode(data)['main']['temp'];
       var condition = jsonDecode(data)['weather'][0]['id'];
       var cityname = jsonDecode(data)['name'];
       debugPrint(longitude.toString());
       debugPrint(weatherdescription.toString());
       debugPrint(temperature.toString());
       debugPrint(condition.toString());
       debugPrint(cityname.toString()); */