import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {

  late String location; //location name for the UI
  late String time; //time in that location
  late String flag; //url to assets flag icon
  late String url;  //location url for api endpoint
  late bool isDayTime; //true or false if daytime or not

  WorldTime({ required this.location, required this.flag, required this.url });

  Future<void> getTime() async {
    try {
      //make the request
      Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      //get properties from data
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].toString().substring(1,3);

      //create DateTime object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(
          Duration(hours: int.parse(offset))
      );

      //set the time property
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (ex) {
      print('caught error: $ex');
      time = 'could not get time data';
    }
  }
}
