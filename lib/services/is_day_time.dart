import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String url = '';
  bool isDayTime = true;

  WorldTime(this.url);
  List name = [];

  Future<void> getTime() async {

    try {
      Response response = await get(Uri.parse('https://timeapi.io/api/time/current/zone?timeZone=$url'));
      Map data = jsonDecode(response.body);
      String datetime = data['dateTime'];
      DateTime now = DateTime.parse(datetime);
      DateTime dt=DateTime.now();
      for(int i=0;i<10;i++) {
        DateTime futuredate=dt.add(Duration(days: i+1));
        name.add(DateFormat('EEE').format(futuredate));
      }
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
    }
    catch(e) {
      print('caught errorid Day Time: $e');
    }
  }
}