import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/services/weather.dart';
import 'package:weather_app/services/is_day_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}


bool isDayTime = true;

void getisDay() async {
  WorldTime worldTime = WorldTime('Asia%2FKolkata');
  await worldTime.getTime();
  isDayTime = worldTime.isDayTime;
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<Weather> locations = [
    Weather('Kolkata', '22.5744', '22.5744', 'Asia%2FKolkata'),
    Weather('Delhi','28.7041', '77.1025', 'Asia%2FKolkata'),
    Weather('Mumbai','19.0760', '72.8777', 'Asia%2FKolkata'),
    Weather('Rajkot','22.3039', '70.8022', 'Asia%2FKolkata'),
    Weather('Ahmedabad','23.0225', '72.5714', 'Asia%2FKolkata'),
    Weather('Chennai','13.0843', '80.2705', 'Asia%2FKolkata'),
    Weather('Bengaluru', '12.9716', '77.5946', 'Asia%2FKolkata'),
    Weather('Vadodara','22.3072', '73.1812', 'Asia%2FKolkata'),
    Weather('Aurangabad', '19.8758', '75.3393', 'Asia%2FKolkata'),
    Weather('Pune', '18.5204', '73.8567', 'Asia%2FKolkata'),
    Weather('Thiruvananthapuram', '8.5241', '76.9366', 'Asia%2FKolkata'),
    Weather('Chandigarh', '30.7333', '76.7794', 'Asia%2FKolkata'),
    Weather('New York', '40.752655', '-73.935242', 'America%2FNew_york'),
    Weather('Chicago', '41.8781', '87.6298', 'America%2FChicago'),
    Weather('London', '51.5072', '0.1276', 'Europe%2FLondon'),
    Weather('Berlin', '52.5200', '13.4050', 'Europe%2FBerlin'),
    Weather('Cairo', '30.0444', '31.2357', 'Africa%2FCairo'),
    Weather('Nairobi', '11.2921', '36.8219', 'Africa%2FNairobi'),
    Weather('Seoul', '37.5503', '126.9971', 'Asia%2FSeoul'),
    Weather('Jakarta', '6.1944', '106.8229', 'Asia%2FJakarta'),
  ];
  String font = 'RobotoMono';

  void updateWeather(index) async {
    Weather instance = _foundUsers[index];
    await instance.getWeather();
    WorldTime worldTime = WorldTime(instance.url);
    await worldTime.getTime();
    instance.isDayTime = worldTime.isDayTime;
    isDayTime = instance.isDayTime;
    instance.name = worldTime.name;
    Navigator.pop(context, {
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

  void _runFilter(String enteredKeyword) {
    List<Weather> results = [];
    if (enteredKeyword.isEmpty) {
      results = locations;
    } else {
      results = locations
          .where((user) =>
          user.location.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundUsers = results;
    });
  }

  List<Weather> _foundUsers = [];
  @override
  initState() {
    _foundUsers = locations;
    super.initState();
  }

  Color?boxColor = Colors.grey[500];
  Color?iconColor = Colors.white;
  Color?fontColor = Colors.white;
  Color?background = Colors.grey[800];

  double fontsize = 28.0;

  @override
  Widget build(BuildContext context) {
    if(isDayTime) {
      boxColor = Colors.blue[200];
      iconColor = Colors.black;
      fontColor = Colors.black;
      background = Colors.white;
    }
    else {
      boxColor = Colors.grey[500];
      iconColor = Colors.white;
      fontColor = Colors.white;
      background = Colors.grey[800];
    }
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: boxColor,
        title: Text(
          'Choose a location',
          style: TextStyle(
            fontSize: 20.0,
            color: fontColor,
            fontFamily: font,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    onChanged: (value) => _runFilter(value),
                    decoration: InputDecoration(
                      labelText: 'Search',
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: _foundUsers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
                    child: Card(
                      color: boxColor,
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: ListTile(
                          onTap: () async {
                            updateWeather(index);
                          },
                          title: Text(
                            _foundUsers[index].location,
                            style: TextStyle(
                              fontSize: fontsize,
                              fontFamily: font,
                              color: fontColor,
                            ),
                          ),
                          leading: Icon(
                            CupertinoIcons.thermometer_sun,
                            color: iconColor,
                            size: fontsize,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
