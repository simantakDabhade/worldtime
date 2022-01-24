// ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:worldtime/services/worldtime.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time_string = "Loading";

  // function to get the time data
  void setupWorldtime() async {
    //creating the timeEngine instance
    WorldTime timeEngine = WorldTime(
        location: "Singapore",
        flag: "singapore.png",
        queryUrl: "Asia/Singapore");

    time_string = await timeEngine.getData();

    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "timeString": time_string,
      "flag": timeEngine.flag,
      "location": timeEngine.location
    });
    print(time_string);
  }

  // runs when this widget is first created
  @override
  void initState() {
    super.initState();
    setupWorldtime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFoldingCube(
          color: Colors.black,
          size: 50.0,
        ),
      ),
    );
  }
}
