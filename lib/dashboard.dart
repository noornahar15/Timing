import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/logInScreen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});


  @override
  State<Dashboard> createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  late Stopwatch stopwatch;
  late Timer t;
  int number = 0;
  bool isButtonClickable = true;


  void handleStartStop(){
    if (stopwatch.isRunning){
      stopwatch.stop();
    } else {
      stopwatch.start();
    }
  }

  void ButtonFunction() async {
    Duration hours = Duration(hours: 7);
    setState(() {
      isButtonClickable = false;
      number = number + 2;
    });

    Future.delayed(hours, (){
      setState(() {
        isButtonClickable = true;
      });
    });
  }

  String returnFormattedText(){
    var milli = stopwatch.elapsed.inSeconds;
    String seconds = (milli % 60).toString().padLeft(2, "0");
    String minute = ((milli ~/ 60) %60).toString().padLeft(2, "0");
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black26,
        elevation: 0.0,
        title: Text('Count point',
        style: TextStyle(
          fontSize: 20,
          color: Colors.orange
        ),),
      ),
      body: SafeArea(
          child: Container(
            color: Colors.black,
            child: Center(
        child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: Text(number.toString(),
                        style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 20,
                        ),),
                    ),
                    CupertinoButton(
                      onPressed: () {
                        handleStartStop();
                      },
                      padding: EdgeInsets.all(10),
                      child: Container(
                        height: 150,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.amber,
                            width: 4,
                          ),
                        ),
                        child: Text(returnFormattedText() ,
                          style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.amber,
                          width: 4,
                        ),
                      ),
                      child: CupertinoButton(
                        onPressed: () {},
                        borderRadius: BorderRadius.all(Radius.circular(90),),
                        child: Text("Gift",
                          style: TextStyle(
                            color: Colors.lightBlue,
                            fontSize: 20,
                          ),),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.amber,
                          width: 4,
                        ),
                      ),

                      child: Opacity(
                        opacity: isButtonClickable ? 1.0 : 0.0,
                        child: GestureDetector(
                          onTap: () {
                            if (isButtonClickable) {
                              ButtonFunction();
                            }
                          },

                          child: Text("Bonus",
                            style: TextStyle(
                              color: Colors.lightBlue,
                              fontSize: 20,
                            ),),
                        ),
                      ),
                    ),
                  ],
                ),

              ),

              ColoredBox(
                color: Colors.orange,
                child: SizedBox( height: 2,
                  width: 500,
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.all(10),
                child: Text("Refer friends.",
                  style: TextStyle(
                    color: Colors.lightBlue,
                  fontSize: 20,
                  ),),

              ),
              ColoredBox(
                color: Colors.orange,
                child: SizedBox( height: 2,
                  width: 500,
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.all(10),
                child: CupertinoButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder:
                            (context) => LogInScreen()));
                  },
                  child: Text("Refer friends.",
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 20,
                    ),),
                ),

              ),
              ColoredBox(
                color: Colors.orange,
                child: SizedBox( height: 2,
                  width: 500,
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.all(10),
                child: Text("Refer friends.",
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 20,
                  ),),

              ),
            ],
        ),
      ),
      ),
      ),
    );
  }
}
