import 'package:farm_minds/main.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
    splash: Text("SIH - FARM MINDS", style: TextStyle(color: Colors.blue.shade700, fontSize: 30),),
    backgroundColor: Colors.black12,
    duration: 3000,
    splashTransition: SplashTransition.fadeTransition,
    nextScreen: const MyHomePage(title: "Farm Minds", )
    
    );
  }
}