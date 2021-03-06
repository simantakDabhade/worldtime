// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    // only if the data is empty only then do we change it
    if (data.isEmpty) {
      data = ModalRoute.of(context)?.settings.arguments as Map;
    }

    print(data);

    return Scaffold(
      backgroundColor: Colors.grey[170],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, "/location");
                  setState(() {
                    data = {
                      "timeString": result["timeString"],
                      "flag": result["flag"],
                      "location": result["location"],
                    };
                  });
                },
                child: Text("edit location"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black12),
                    shadowColor: MaterialStateProperty.all(Colors.white)),
              ),
              SizedBox(
                height: 40.0,
              ),

              // this is the country photo
              CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://raw.githubusercontent.com/iamshaunjp/flutter-beginners-tutorial/lesson-34/world_time_app/assets/${data["flag"]}"),
                radius: 60.0,
              ),

              SizedBox(
                height: 40.0,
              ),

              // This is the row for the location name
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data["location"],
                    style: TextStyle(fontSize: 28.0, letterSpacing: 2.0),
                  )
                ],
              ),

              SizedBox(
                height: 25.0,
              ),

              Text(
                data["timeString"],
                style: TextStyle(
                    fontSize: 88.0,
                    letterSpacing: 8,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
