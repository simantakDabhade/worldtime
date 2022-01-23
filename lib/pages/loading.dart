// ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time_string = "Loading";

  // function to get the time data
  void getData() async {
    Response response = await get(
        Uri.parse("http://worldtimeapi.org/api/timezone/Europe/London"));
    Map data = jsonDecode(response.body);
    int unixTime = (data["unixtime"]);

    print(data);

    int singaporeDiff = 8 * 60;
    String locationOffsett = data["utc_offset"];

    DateTime date = DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);
    print(date.timeZoneName);

    time_string = "${date.hour} - ${date.minute}";
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "hours": date.hour,
      "minutes": date.minute,
    });
  }

  // runs when this widget is first created
  @override
  void initState() {
    super.initState();
    try {
      getData();
    } catch (e) {
      print("there was an error $e");
    }
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
