import 'package:farm_minds/Splash_screen.dart';
import 'package:farm_minds/Widgets/every_minute_call.dart';
import 'package:farm_minds/percent.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'Theme/dark_theme.dart';
import 'Theme/light_theme.dart';
import 'dart:convert';

import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

int moisture1 = 0;
int temperature1 = 0;
int humidity1 = 0;
double humidity2 = 0;
double temperature2 = 0;
double moisture2 = 0;
bool state = false;


Future<void> getVal3() async {
  
  String hum = "https://blynk.cloud/external/api/get?token=gqxmMCa7tPvjm7EUHynYSl_YJWI8ttDk&V0&v1&v2";

  Response response = await get(Uri.parse(hum));
  dynamic data = jsonDecode(response.body);

  // Check if the response is a map and contains the 'V6' key
  if (data is Map<String, dynamic>) {
    // Access the 'V6' value and update the pH variable
    humidity1 = data['V0']; // Convert double to int
    temperature1 = data['v2'];
    moisture1 = data['v1'];
  } else {
    // If the response is not as expected or 'V6' key is missing, set a default value
    humidity1 = 0;
    temperature1=0;
    moisture1=0;
  }
  humidity2 = humidity1/100;
  temperature2 = temperature1/100;
  moisture2 = moisture1/100;

}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farm Minds',
      debugShowCheckedModeBanner: false,
      theme: state ? darkTheme: lightTheme,
      darkTheme: darkTheme,
      home: const splash(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final Text title;

  Future <void> _handleRefresh() async {
    return await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Farm minds",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple.shade50, fontSize: 25)),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade700,
        elevation: 2,
        toolbarHeight: 60,
      ),
      body: LiquidPullToRefresh(onRefresh: _handleRefresh ,
      color: Colors.deepPurple.shade700,
      backgroundColor: Theme.of(context).colorScheme.background,
      animSpeedFactor: 1,
      showChildOpacityTransition: true,
      height: 100,
       child: ListView(
        padding: EdgeInsets.fromLTRB(0,200,0,30),
         children:<Widget> [Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children:  <Widget>[
               
                Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    percent(title: "Moisture",value: moisture2,),
                    const SizedBox(width: 30,),
                    percent(title: "Humidity", value: humidity2),
                  ],
                ),
               
                const SizedBox(height: 60,),
                Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    percent(title: "Temperature", value: temperature2),
                    const BgCall()
                  ],
                )
             ],
           ),
         ),]
       ),
    )
    );
  }
}
