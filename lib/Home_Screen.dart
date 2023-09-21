import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/utils/AppImages.dart';

import 'Home_Screen2.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      body: Container(
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
              height: 428,
              width: 428,
              child: Image(image: AssetImage(AppImages.weather_image1)),

            ),
            Text('Weather' , style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold),),
            Text('ForeCasts' , style: TextStyle(fontSize: 40,color: Colors.yellow,),),
            SizedBox(height: 30,),

            Container(
              width: 200,
              height: 55,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffDDB130),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      )),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home_Screen2(),
                        ));
                  },
                  child: Text(
                        "Get Start",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff362A84),
                            fontWeight: FontWeight.bold),
                      ),


                  )),
          ],
        ),
      ),




    );
  }
}
