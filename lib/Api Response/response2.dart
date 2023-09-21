import 'dart:convert';
import 'package:weatherapp/Models/model2.dart';

import '../Models/model1.dart';
import 'package:http/http.dart'as http;

Future<weather>getapidata2()async{
  weather dailyforcast=weather();
  var url='https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/33.6517829%2C73.0823911?unitGroup=metric&key=MAHCYFPGDWPMZ8T8DRG3H6AED&contentType=json';
  try{
    var response=await http.get(Uri.parse(url));
    if(response.statusCode==200){
      var data=jsonDecode(response.body);
      
      dailyforcast=weather.fromJson(data);

      return dailyforcast;
    }
    else{
      return dailyforcast;
    }
  }catch(e){
    print(e.toString());
    return dailyforcast;
  }

}