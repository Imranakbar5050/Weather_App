import 'dart:convert';
import '../Models/model1.dart';
import 'package:http/http.dart'as http;

Future<HourlyForecast>getapidata()async{
  HourlyForecast hourlyForecast=HourlyForecast();
  var url='http://api.weatherapi.com/v1/forecast.json?key=c536af482cf84fffaaf61700230709&q=33.6517829,73.0823911';
  try{
    var response=await http.get(Uri.parse(url));
    if(response.statusCode==200){
      var data=jsonDecode(response.body);
      hourlyForecast=HourlyForecast.fromJson(data);
      return hourlyForecast;
    }
    else{
      return hourlyForecast;
    }
  }catch(e){
    print(e.toString());
    return hourlyForecast;
  }

}