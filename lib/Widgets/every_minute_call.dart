import 'dart:async';
import 'package:farm_minds/main.dart';
import 'package:flutter/material.dart';

class BgCall extends StatefulWidget {
  const BgCall({super.key});

  @override
  State<BgCall> createState() => _BgCallState();
}

class _BgCallState extends State<BgCall> {
  // ignore: unused_field
  Timer? _timer;
  @override
  void initState(){
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      getVal3();
     });
  @override
  void dispose(){
    _timer?.cancel();
    super.dispose();

  }
  }
  Widget build(BuildContext context) {
    return Container();
  }
}