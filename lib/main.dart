import 'package:farm_minds/Splash_screen.dart';
import 'package:farm_minds/percent.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

int moisture1 = 0;
int temperature1 = 0;
int humidity1 = 0;
double humidity2 = 0;
double temperature2 = 0;
double moisture2 = 0;

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
      theme: ThemeData(
        backgroundColor: Colors.black12
             ),
      home: const splash(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
        elevation: 0,
      ),
      body:
       Center(
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
               ],
             )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => getVal3(),elevation: 1,backgroundColor: Colors.blue.shade700, 
      child: Text("Update"),
      ),
    );
  }
}

Future<void> getVal3() async {
  
  String hum = "https://blynk.cloud/external/api/get?token=gqxmMCa7tPvjm7EUHynYSl_YJWI8ttDk&V0&v1&v2";

  Response response = await get(Uri.parse(hum));
  dynamic data = jsonDecode(response.body);
  print(data);

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
  print(humidity2);
  print(temperature2);
}