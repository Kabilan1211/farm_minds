import 'package:farm_minds/Splash_screen.dart';
import 'package:farm_minds/percent.dart';
import 'package:flutter/material.dart';

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.yellow.shade700,
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
                 percent(title: "Moisture",value: 0.65,),
                 const SizedBox(width: 30,),
                 percent(title: "Humidity", value: 0.30),
               ],
             ),
            
             const SizedBox(height: 60,),
             Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 percent(title: "Temperature", value: 0.32),
               ],
             )
          ],
        ),
      ),
    );
  }
}
