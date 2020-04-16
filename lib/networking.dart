import 'package:http/http.dart';
import 'package:geolocator/geolocator.dart';
var dates = [];
var o_dates = [];
var o_months = [];
var top_temps = [];
var min_temps = [];
var latitude ;
var longitude ;
List<String> n_months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
String current_temp;

class NetworkHelper {
  Networking () async {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    latitude = position.latitude;
    longitude = position.longitude;
    print(position);
    var url = 'https://api.openweathermap.org/data/2.5/onecall?lat=${latitude}&lon=${longitude}&appid=a911432c92329f4da336e8de68042ef2&units=metric';
    var response = await get(url);
    String weatherData = response.body;
    return weatherData;
  }

}

