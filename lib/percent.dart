import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


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
          backgroundColor: Colors.deepPurple.shade200,
          progressColor: Colors.deepPurple.shade600,
          circularStrokeCap: CircularStrokeCap.round,
          center: Text( widget.title , style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),
          ),
          )
      ),
    ],);
  }
}
