import 'package:http/http.dart';
import 'dart:convert';
import 'package:weather_app/services/sunrisesunset.dart';

class Weather {

  String location;
  String temp = '';
  String lat;
  String lon;
  String units = 'metric';
  String appid = '2529cf3d16455f9d343908b369abb18c';
  String count = '10';
  String url;
  bool isDayTime = true;
  Map<String, dynamic> day1 = {};
  Map<String, dynamic> day2 = {};
  Map<String, dynamic> day3 = {};
  Map<String, dynamic> day4 = {};
  Map<String, dynamic> day5 = {};
  Map<String, dynamic> day6 = {};
  Map<String, dynamic> day7 = {};
  Map<String, dynamic> day8 = {};
  Map<String, dynamic> day9 = {};
  Map<String, dynamic> day10 = {};
  Map<String, dynamic> weather = {};
  Map<String, dynamic> cloud = {};
  Map<String, dynamic> wind = {};
  List id = [];
  List name =[];
  Map results = {};

  Weather(this.location, this.lat, this.lon, this.url);

  Future<void> setSunrise() async {

    SunriseSunset time = SunriseSunset(lat,lon);
    await time.getSunrise();
    results = time.results;
  }

  Future<void> getWeather() async {

    try {
      Response response = await get(Uri.parse('http://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&cnt=$count&units=$units&appid=$appid'));
      Map data = jsonDecode(response.body);
      weather = data['list'][0]['weather'][0];
      cloud = data['list'][0]['clouds'];
      wind = data['list'][0]['wind'];

      id.add(data['list'][0]['weather'][0]['id']);
      day1 = data['list'][0]['main'];
      id.add(data['list'][1]['weather'][0]['id']);
      day2 = data['list'][1]['main'];
      id.add(data['list'][2]['weather'][0]['id']);
      day3 = data['list'][2]['main'];
      id.add(data['list'][3]['weather'][0]['id']);
      day4 = data['list'][3]['main'];
      id.add(data['list'][4]['weather'][0]['id']);
      day5 = data['list'][4]['main'];
      id.add(data['list'][5]['weather'][0]['id']);
      day6 = data['list'][5]['main'];
      id.add(data['list'][6]['weather'][0]['id']);
      day7 = data['list'][6]['main'];
      id.add(data['list'][7]['weather'][0]['id']);
      day8 = data['list'][7]['main'];
      id.add(data['list'][8]['weather'][0]['id']);
      day9 = data['list'][8]['main'];
      id.add(data['list'][9]['weather'][0]['id']);
      day10 = data['list'][9]['main'];

      day1['temp'] = day1['temp'].round();
      day2['temp'] = day2['temp'].round();
      day3['temp'] = day3['temp'].round();
      day4['temp'] = day4['temp'].round();
      day5['temp'] = day5['temp'].round();
      day6['temp'] = day6['temp'].round();
      day7['temp'] = day7['temp'].round();
      day8['temp'] = day8['temp'].round();
      day9['temp'] = day9['temp'].round();
      day10['temp'] = day10['temp'].round();

      await setSunrise();
    }

    catch(e) {
      print('caught error: $e');
      temp = 'could not get temp data:';
    }

  }

}