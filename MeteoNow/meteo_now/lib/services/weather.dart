import 'package:flutter/cupertino.dart';
import 'package:meteo_now/utilities/random_number.dart';

class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return 'a';
    } else if (condition < 400) {
      return 'b';
    } else {
      return 'c';
    }
  }

  AssetImage getBackgroundImage(int condition) {
    if (condition < 1010) {
      return AssetImage('lib/assets/images/sun/sun${chooseNumber(2)}.jpg');
    } else if (condition < 1150) {
      return AssetImage('lib/assets/images/fog/fog${chooseNumber(3)}.jpg');
    } else if (condition < 1195) {
      return AssetImage('lib/assets/images/rain/rain${chooseNumber(3)}.jpg');
    } else {
      return AssetImage('lib/assets/images/cold/cold${chooseNumber(3)}.jpg');
    }
  }
}
