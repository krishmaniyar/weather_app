import 'package:http/http.dart';
import 'dart:convert';

class SunriseSunset {

  String lat;
  String lon;
  Map results = {};

  SunriseSunset(this.lat,this.lon);

  Future<void> getSunrise() async {

    Response response = await get(Uri.parse('https://api.sunrisesunset.io/json?lat=$lat&lng=$lon'));
    Map data = jsonDecode(response.body);
    results = data['results'];
  }

}