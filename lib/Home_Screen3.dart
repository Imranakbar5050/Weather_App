import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/Api%20Response/response2.dart';
import 'package:weatherapp/Models/model1.dart';
import 'package:weatherapp/utils/AppImages.dart';
import 'package:weatherapp/utils/appconstant.dart';

class Home_Screen3 extends StatefulWidget {
  HourlyForecast? hourlyForecast;
  Home_Screen3({super.key, this.hourlyForecast});

  @override
  State<Home_Screen3> createState() => _Home_Screen3State();
}

class _Home_Screen3State extends State<Home_Screen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff492BA1).withOpacity(1),
                Color(0xff3E2D8F).withOpacity(1),
              ]),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 90,
                ),
                Text('Max: ${widget.hourlyForecast!.forecast!.forecastday![0].day!.maxtempC}°   Min: ${widget.hourlyForecast!.forecast!.forecastday![0].day!.mintempC} ',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  '7-Days Forecasts',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 170,
                  child: 
                 FutureBuilder(
                   future: getapidata2(),
                   builder: (context, snapshot) {
                     if(snapshot.hasData){
                       return           ListView.builder(
                         scrollDirection: Axis.horizontal,
                         itemCount: 7,
                         itemBuilder: (BuildContext context, int index) {
                           return Container(
                             width: 82,
                             height: 170,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(50),
                               gradient: LinearGradient(
                                   colors: [Color(0xff3E2D8F), Color(0xff9D52AC)]),
                             ),
                             child: Column(
                               children: [
                                 Text(
                                   snapshot.data!.days![index]!.temp.toString(),
                                   style:
                                   TextStyle(color: Colors.white, fontSize: 20),
                                 ),
                                 Container(
                                   width: 66,
                                   height: 66,
                                   child:
                                   Image(image: AssetImage(AppImages.weather_image1)),
                                 ),
                                 SizedBox(height: 10,),
                                 Text(Appconstants.days[index],
                                   style:
                                   TextStyle(fontSize: 20, color: Colors.white),
                                 ),
                               ],
                             ),
                           );
                         },
                       );

                     }
                     else {
                       return Text('');
                     }
                   }
         )
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff3E2D8F).withOpacity(1),
                          Color(0xff9D52AC).withOpacity(1),
                        ]),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 352,
                  height: 174,
                  child: Padding(
                    padding:
                    const EdgeInsets.only(top: 10, right: 10, left: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              child:
                              Icon(Icons.add_circle_outline,color: Colors.white,)
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'AIR QUALITY',
                              style:
                              TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              '3-Low Health Risk',
                              style:
                              TextStyle(fontSize: 28, color: Colors.white),
                            ),
                          ],
                        ),
                        Divider(
                          color: Color.fromRGBO(128, 91, 202, 0.82),
                          thickness: 5,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'See more',
                              style:
                              TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(colors: [
                            Color(0xff3E2D8F),
                            Color.fromRGBO(0, 0, 0, 0.25)
                          ]),
                          border:
                          Border.all(color: Color(0xffF7CBFD), width: 1)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.sunny,
                                  color: Colors.yellowAccent,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'SUNRISE',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              '5:28 AM',
                              style:
                              TextStyle(color: Colors.white, fontSize: 28),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Sunset: 7.25PM',
                              style:
                              TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(colors: [
                            Color(0xff3E2D8F),
                            Color.fromRGBO(0, 0, 0, 0.25)
                          ]),
                          border:
                          Border.all(color: Color(0xffF7CBFD), width: 1)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.sunny,
                                  color: Colors.yellowAccent,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'UV INDEX',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              '4',
                              style:
                              TextStyle(color: Colors.white, fontSize: 28),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Moderate',
                              style:
                              TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
               SizedBox(height: 10,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}