// ignore_for_file: avoid_print, unused_local_variable

import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location = ""; // the location of the place
  String time = ""; // the time at that place
  String flag = ""; //url to the flag icon of the country
  String queryUrl = ""; //location url for the worldtime api

  WorldTime(
      {required this.location, required this.flag, required this.queryUrl});

  Future<String> getData() async {
    try {
      Response response = await get(
          Uri.parse("http://worldtimeapi.org/api/timezone/$queryUrl"));
      Map data = jsonDecode(response.body);
      int unixTime = (data["unixtime"]);
      print(data);

      int singaporeDiff = 8 * 60;
      String locationOffsett = data["utc_offset"];

      DateTime date = DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);
      print(date.timeZoneName);

      time = "${date.hour}:${date.minute}";
      return time;
    } catch (e) {
      // an error has occured in gettin the data from the api
      print("error occured in getting time data");
      print(e);
      return "Error occured";
    }
  }
}
