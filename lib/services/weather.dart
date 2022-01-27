import 'package:weatherapp/services/location.dart';
import 'package:weatherapp/services/networking.dart';

const apikey = '8fe452ac9386c1c1f0a5cbf2f2b94c4b';
const openweathermapurl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future <dynamic> getCityWeather(String cityname) async{
    var url = '$openweathermapurl?q=$cityname&appid=$apikey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  Future<dynamic> getLocationWeather() async{
     Location location = Location();
      await location.getCurrentLocation();
      NetworkHelper networkHelper = NetworkHelper(
        '$openweathermapurl?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric'); 
        var weatherData = await networkHelper.getData();
        return weatherData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}