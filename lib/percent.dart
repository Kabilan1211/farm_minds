import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'dart:convert';

double moisture1 = 0;
double temperature1 = 0;
double humidity1 = 0;

class percent extends StatefulWidget {
  const percent({super.key, required this.title, required this.value});
final String title;
final double value;

  @override
  State<percent> createState() => _percentState();
}

class _percentState extends State<percent> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Center(
        child: CircularPercentIndicator(
          radius: 90,
          lineWidth: 20,
          percent: widget.value,
          backgroundColor: Colors.yellow.shade200,
          progressColor: Colors.yellow.shade700,
          circularStrokeCap: CircularStrokeCap.round,
          center: Text( widget.title , style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          )
      ),
    ],);
  }
}
Future<void> getVal1() async {
  String moisture = "https://blynk.cloud/external/api/get?token=gqxmMCa7tPvjm7EUHynYSl_YJWI8ttDk&V1";

  Response response = await get(Uri.parse(moisture));
  dynamic data = jsonDecode(response.body);

  // Check if the response is a map and contains the 'V6' key
  if (data is Map<String, dynamic> && data.containsKey('V1')) {
    // Access the 'V6' value and update the pH variable
    moisture1 = data['V1']; // Convert double to int
  } else {
    // If the response is not as expected or 'V6' key is missing, set a default value
    moisture1 = 0;
  }
  print(moisture1);
}
Future<void> getVal2() async {
  
  String temp = "https://blynk.cloud/external/api/get?token=gqxmMCa7tPvjm7EUHynYSl_YJWI8ttDk&V2";

  Response response = await get(Uri.parse(temp));
  dynamic data = jsonDecode(response.body);

  // Check if the response is a map and contains the 'V6' key
  if (data is Map<String, dynamic> && data.containsKey('V2')) {
    // Access the 'V6' value and update the pH variable
    temperature1 = data['V2']; // Convert double to int
  } else {
    // If the response is not as expected or 'V6' key is missing, set a default value
    temperature1 = 0;
  }
  print(temperature1);
}
Future<void> getVal3() async {
  
  String hum = "https://blynk.cloud/external/api/get?token=gqxmMCa7tPvjm7EUHynYSl_YJWI8ttDk&V0";

  Response response = await get(Uri.parse(hum));
  dynamic data = jsonDecode(response.body);

  // Check if the response is a map and contains the 'V6' key
  if (data is Map<String, dynamic> && data.containsKey('V0')) {
    // Access the 'V6' value and update the pH variable
    humidity1 = data['V0']; // Convert double to int
  } else {
    // If the response is not as expected or 'V6' key is missing, set a default value
    humidity1 = 0;
  }
  print(humidity1);
}
