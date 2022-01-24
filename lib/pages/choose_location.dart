// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:worldtime/services/worldtime.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(queryUrl: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(
        queryUrl: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    WorldTime(queryUrl: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(
        queryUrl: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(
        queryUrl: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(
        queryUrl: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(
        queryUrl: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(
        queryUrl: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(int index) async {
    WorldTime instance = locations[index];
    String time_string = await instance.getData();

    // navigate to the homescreen and pass the data there
    Navigator.pop(context, {
      "timeString": time_string,
      "flag": instance.flag,
      "location": instance.location,
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build function ran");
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.red,
        title: Text("Choose Location"),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://raw.githubusercontent.com/iamshaunjp/flutter-beginners-tutorial/lesson-34/world_time_app/assets/${locations[index].flag}"),
              ),
              onTap: () {
                // when the user tapps the listtitle we send em to the right page
                print("index $index tapped");
                updateTime(index);
              },
            ),
          );
        },
      ),
    );
  }
}
