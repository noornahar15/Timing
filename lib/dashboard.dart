import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  late Stopwatch stopwatch;
  late Timer t;

  void handleStartStop(){
    if (stopwatch.isRunning){
      stopwatch.stop();
    } else {
      stopwatch.start();
    }
  }

  String returnFormattedText(){
    var milli = stopwatch.elapsed.inSeconds;
    String seconds = (milli % 60).toString().padLeft(2, "0");
    String minute = ((milli ~/ 60) %100).toString().padLeft(2, "0");
    String hour = ((milli ~/ 60)~/ 60).toString().padLeft(2, "0");

    return "$hour:$minute:$seconds";
  }

  @override
  void initState(){
    super.initState();
    stopwatch = Stopwatch();
    t = Timer.periodic(Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton(
              onPressed: () {
                handleStartStop();
              },
              padding: EdgeInsets.all(0),
              child: Container(
                height: 250,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.amber,
                    width: 4,
                  ),
                ),
                child: Text(returnFormattedText() , style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
                ),
              ),
            ),
          ],
        ),
      )
      ),
    );
  }
}
