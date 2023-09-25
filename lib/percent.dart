import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'dart:convert';


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
          backgroundColor: Colors.blue.shade200,
          progressColor: Colors.blue.shade700,
          circularStrokeCap: CircularStrokeCap.round,
          center: Text( widget.title , style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          )
      ),
    ],);
  }
}
