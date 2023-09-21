import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/Api%20Response/response.dart';
import 'package:weatherapp/Home_Screen3.dart';
import 'package:weatherapp/utils/AppImages.dart';
import 'package:weatherapp/utils/appconstant.dart';

import 'Home_Screen.dart';

class Home_Screen2 extends StatefulWidget {
  const Home_Screen2({super.key});

  @override
  State<Home_Screen2> createState() => _Home_Screen2State();
}

class _Home_Screen2State extends State<Home_Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:FutureBuilder(
        future: getapidata(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return   Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                Color(0xff492BA1).withOpacity(1),
                Color(0xff3E2D8F).withOpacity(1),

              ]
              )
              ),
              child: Column(
                children: [
                  Container(
                    height: 228,
                    width: 228,
                    child: Image(image: NetworkImage('https:${snapshot.data!.current!.condition!.icon.toString()}')),
                  ),

                  Text(snapshot.data!.current!.tempC.toString() , style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold),),


                  Text('Precipitations ' , style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.normal),),
                  Text('Max: ${snapshot.data!.forecast!.forecastday![0].day!.maxtempC}°   Min: ${snapshot.data!.forecast!.forecastday![0].day!.mintempC} ' , style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.normal),),
                  Container(
                    height: 228,
                    width: 228,
                    child: Image(image: AssetImage(AppImages.house)),
                  ),
                  SizedBox(height: 100,),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home_Screen3(hourlyForecast: snapshot.data),
                            ),
                          ),

                          child: Icon(Icons.location_on, color: Colors.white, size: 40,)),
                      SizedBox(width: 110,),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home_Screen(),
                          ),
                        ),
                        child: Icon(Icons.add_circle_outline, color: Colors.white, size: 40),
                      ),

                      SizedBox(width: 110,),
                      GestureDetector(
                          onTap: ()
                          {
                            showModalBottomSheet(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))), context: context,builder: (BuildContext context) {
                              return Container(
                                height: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xff3E2D8F).withOpacity(1),
                                        Color(0xff492BA1).withOpacity(1),
                                      ]),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30, left: 30, right: 30),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Today',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          Spacer(),
                                          Text(snapshot.data!.forecast!.forecastday![0]!.date!.toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Divider(
                                      color: Colors.white,
                                      thickness: 1.5,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 24,
                                          itemBuilder:
                                              (BuildContext context, int index) {
                                            return Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 20),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    snapshot.data!.forecast!.forecastday![0].hour![index].tempC.toString(),
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white),
                                                  ),
                                                  Container(
                                                    width: 66,
                                                    height: 66,
                                                    child: Image(
                                                        image: NetworkImage('https:${snapshot.data!.forecast!.forecastday![0].hour![index].condition!.icon}')),
                                                  ),

                                                  Text(
                                                    Appconstants.hours[index],
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                              );
                            }
                            );
                          },

                          child: Icon(Icons.menu, color: Colors.white, size: 40,)),

                    ],
                  )



                ],
              ),
            );
          }
          else{
            return Text('');
          }
        },
      )





    );
  }
}
