import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/services/weather.dart';
import 'package:weather_app/services/ipdetect.dart';
import 'package:weather_app/services/is_day_time.dart';
import 'package:weather_app/pages/choose_location.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void setWeather() async {
    Ip ip = Ip();
    await ip.getdata();
    Weather instance = Weather('Kokalta', '22.5744', '22.5744', 'Asia%2FKolkata');
    await instance.getWeather();
    WorldTime worldTime = WorldTime(instance.url);
    await worldTime.getTime();
    instance.isDayTime = worldTime.isDayTime;
    instance.name = worldTime.name;
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'temp': instance.temp,
      'lat': instance.lat,
      'lon': instance.lon,
      'day1': instance.day1,
      'day2': instance.day2,
      'day3': instance.day3,
      'day4': instance.day4,
      'day5': instance.day5,
      'day6': instance.day6,
      'day7': instance.day7,
      'day8': instance.day8,
      'day9': instance.day9,
      'day10': instance.day10,
      'weather': instance.weather,
      'cloud': instance.cloud,
      'wind': instance.wind,
      'results': instance.results,
      'url': instance.url,
      'isDayTime': instance.isDayTime,
      'id': instance.id,
      'name': instance.name,
    });
  }

  @override
  void initState() {
    setWeather();
    getisDay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[300],
        body: Center(
          child: SpinKitWave(
            color: Colors.white,
            size: 80.0,
          ),
        )
    );
  }
}
