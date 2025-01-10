import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  Map day1 = {};
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
  Map<String, dynamic> wind = {};
  Map<String, dynamic> cloud = {};
  Map results = {};
  List id = [];
  List name = [];

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>? ?? {};
    day1 = day1.isNotEmpty ? day1 : data['day1'];
    day2 = day2.isNotEmpty ? day2 : data['day2'];
    day3 = day3.isNotEmpty ? day3 : data['day3'];
    day4 = day4.isNotEmpty ? day4 : data['day4'];
    day5 = day5.isNotEmpty ? day5 : data['day5'];
    day6 = day6.isNotEmpty ? day6 : data['day6'];
    day7 = day7.isNotEmpty ? day7 : data['day7'];
    day8 = day8.isNotEmpty ? day8 : data['day8'];
    day9 = day9.isNotEmpty ? day9 : data['day9'];
    day10 = day10.isNotEmpty ? day10 : data['day10'];
    id = id.isNotEmpty ? id : data['id'];
    name = name.isNotEmpty ? name : data['name'];
    weather = weather.isNotEmpty ? weather : data['weather'];
    wind = wind.isNotEmpty ? wind : data['wind'];
    cloud = cloud.isNotEmpty ? cloud : data['cloud'];
    results = results.isNotEmpty ? results : data['results'];
    Color? boxColor = Colors.transparent;
    Color? fontColor = Colors.white;
    Color? iconColor = Colors.white;
    Color? boxfont = Colors.white;
    Color? contColor = Colors.black38;
    double fontsize = 30.0;
    double fsize = 22.0;
    double infosize = 35.0;
    String font = 'RobotoMono';
    String photo = 'sun-flare.jpg';
    Color? background = Colors.blue[500];

    IconData getIcon(index) {
      IconData? icon = id[index]>=200 && id[index]<=232?Icons.thunderstorm:(id[index]>=300 && id[index]<=531?CupertinoIcons.cloud_rain_fill:(id[index]>=600 && id[index]<=622?Icons.snowing:(id[index]>=701 && id[index]<=781?Icons.foggy:(id[index]>=801 && id[index]<=804?Icons.cloud:(id[index]==800?Icons.sunny:Icons.sunny)))));
      return icon;
    }

    if (data['isDayTime']) {
      photo = 'sun-flare.jpg';
      contColor = Colors.black38;
      background = Colors.blue[500];
    } else {
      photo = 'night.jpeg';
      contColor = Colors.white10;
      background = Colors.black54;
    }

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$photo'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 5.0, 5.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          size: fontsize,
                          color: iconColor,
                        ),
                        Text(
                          data['location'],
                          style: TextStyle(
                            fontSize: fontsize,
                            color: iconColor,
                            fontFamily: font,
                          ),
                        ),
                      ],
                    ),
                    TextButton.icon(
                      onPressed: (() async {
                        dynamic result =
                            await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'location': result["location"],
                            'temp': result["temp"],
                            'lat': result["lat"],
                            'lon': result["lon"],
                            'url': result['url'],
                            'isDayTime': result['isDayTime'],
                          };
                          day1 = result["day1"];
                          day2 = result["day2"];
                          day3 = result["day3"];
                          day4 = result["day4"];
                          day5 = result["day5"];
                          day6 = result["day6"];
                          day7 = result["day7"];
                          day8 = result["day8"];
                          day9 = result["day9"];
                          day10 = result["day10"];
                          weather = result["weather"];
                          wind = result["wind"];
                          cloud = result["cloud"];
                          results = result["results"];
                          id = result['id'];
                          name = result['name'];
                        });
                      }),
                      label: Icon(
                        Icons.format_list_bulleted_rounded,
                        color: iconColor,
                        size: fontsize,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  '${day1['temp']}°C',
                  style: TextStyle(
                    fontSize: 120.0,
                    letterSpacing: -10.0,
                    color: fontColor,
                    fontFamily: font,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                  child: Column(
                    children: [
                      Text(
                        '${weather['description']}',
                        style: TextStyle(
                          fontSize: fontsize,
                          color: fontColor,
                          fontFamily: font,
                        ),
                      ),
                      Text(
                        'H:${day1['temp_max']} L:${day1['temp_min']}',
                        style: TextStyle(
                          fontSize: fontsize - 4.0,
                          color: fontColor,
                          fontFamily: font,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: contColor,
                            ),
                            child: Card(
                              elevation: 0.0,
                              color: boxColor,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.thermostat,
                                          size: fsize,
                                          color: iconColor,
                                        ),
                                        SizedBox(
                                          width: 3.0,
                                        ),
                                        Text(
                                          'FEELS LIKE',
                                          style: TextStyle(
                                            fontSize: fsize,
                                            color: boxfont,
                                            fontFamily: font,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '${day1['feels_like']}°C',
                                        style: TextStyle(
                                          fontSize: infosize,
                                          color: boxfont,
                                          fontFamily: font,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.cloud,
                                          size: fsize,
                                          color: iconColor,
                                        ),
                                        SizedBox(
                                          width: 3.0,
                                        ),
                                        Text(
                                          'CLOUDS',
                                          style: TextStyle(
                                            fontSize: fsize,
                                            color: boxfont,
                                            fontFamily: font,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '${cloud['all']}',
                                        style: TextStyle(
                                          fontSize: infosize,
                                          color: boxfont,
                                          fontFamily: font,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: contColor,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Card(
                              elevation: 0,
                              color: boxColor,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.water,
                                          size: fsize,
                                          color: iconColor,
                                        ),
                                        SizedBox(
                                          width: 3.0,
                                        ),
                                        Text(
                                          'HUMIDITY',
                                          style: TextStyle(
                                            fontSize: fsize,
                                            color: boxfont,
                                            fontFamily: font,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '${day1['humidity']}%',
                                        style: TextStyle(
                                          fontSize: infosize,
                                          color: boxfont,
                                          fontFamily: font,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.monitor_weight,
                                          size: fsize,
                                          color: iconColor,
                                        ),
                                        SizedBox(
                                          width: 3.0,
                                        ),
                                        Text(
                                          'PRESSURE',
                                          style: TextStyle(
                                            fontSize: fsize,
                                            color: boxfont,
                                            fontFamily: font,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '${day1['pressure']} hPa',
                                        style: TextStyle(
                                          fontSize: infosize,
                                          color: boxfont,
                                          fontFamily: font,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: contColor,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Card(
                              elevation: 0.0,
                              color: boxColor,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.wind_power,
                                          size: fsize,
                                          color: iconColor,
                                        ),
                                        SizedBox(
                                          width: 3.0,
                                        ),
                                        Text(
                                          'WIND SPEED',
                                          style: TextStyle(
                                            fontSize: fsize,
                                            color: boxfont,
                                            fontFamily: font,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '${wind['speed']}m/s',
                                        style: TextStyle(
                                          fontSize: infosize,
                                          fontFamily: font,
                                          letterSpacing: 1.0,
                                          color: boxfont,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.rotate_90_degrees_ccw,
                                          size: fsize,
                                          color: iconColor,
                                        ),
                                        SizedBox(
                                          width: 3.0,
                                        ),
                                        Text(
                                          'WIND DEGREE',
                                          style: TextStyle(
                                            fontSize: fsize,
                                            color: boxfont,
                                            fontFamily: font,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '${wind['deg']}',
                                        style: TextStyle(
                                          fontSize: infosize,
                                          color: boxfont,
                                          fontFamily: font,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: contColor,
                            ),
                            child: Card(
                              elevation: 0.0,
                              color: boxColor,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.water_drop_rounded,
                                          size: fsize,
                                          color: iconColor,
                                        ),
                                        SizedBox(
                                          width: 3.0,
                                        ),
                                        Text(
                                          'SEA LEVEL',
                                          style: TextStyle(
                                            fontSize: fsize,
                                            color: boxfont,
                                            fontFamily: font,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '${day1['sea_level']}',
                                        style: TextStyle(
                                          fontSize: infosize,
                                          color: boxfont,
                                          fontFamily: font,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.landscape,
                                          size: fsize,
                                          color: iconColor,
                                        ),
                                        SizedBox(
                                          width: 1.0,
                                        ),
                                        Text(
                                          'GROUND LEVEL',
                                          style: TextStyle(
                                            fontSize: fsize,
                                            color: boxfont,
                                            fontFamily: font,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '${day1['grnd_level']}',
                                        style: TextStyle(
                                          fontSize: infosize,
                                          color: boxfont,
                                          fontFamily: font,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: contColor,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Card(
                              color: boxColor,
                              elevation: 0.0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          CupertinoIcons.calendar,
                                          size: fsize,
                                          color: iconColor,
                                        ),
                                        SizedBox(
                                          width: 8.0,
                                        ),
                                        Text(
                                          '10-DAY FORECAST',
                                          style: TextStyle(
                                            fontSize: fsize,
                                            color: boxfont,
                                            fontFamily: font,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      height: 20,
                                      thickness: 1,
                                      color: fontColor,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Today  ',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: font,
                                            color: boxfont,
                                          ),
                                        ),
                                        Icon(
                                          getIcon(0),
                                          size: 18.0,
                                          color: iconColor,
                                        ),
                                        Text(
                                          '${day1['temp']}°C',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: font,
                                            color: boxfont,
                                          ),
                                        ),
                                        Text(
                                          '${day1['pressure']}hPa',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: font,
                                            color: boxfont,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      height: 20,
                                      thickness: 1,
                                      indent: 0,
                                      endIndent: 0,
                                      color: fontColor,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${name[0]}    ',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: font,
                                            color: boxfont,
                                          ),
                                        ),
                                        Icon(
                                          getIcon(1),
                                          size: 18.0,
                                          color: iconColor,
                                        ),
                                        Text(
                                          '${day2['temp']}°C',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: font,
                                            color: boxfont,
                                          ),
                                        ),
                                        Text(
                                          '${day2['pressure']}hPa',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: font,
                                            color: boxfont,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      height: 20,
                                      thickness: 1,
                                      indent: 0,
                                      endIndent: 0,
                                      color: fontColor,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${name[1]}    ',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: font,
                                            color: boxfont,
                                          ),
                                        ),
                                        Icon(
                                          getIcon(2),
                                          size: 18.0,
                                          color: iconColor,
                                        ),
                                        Text(
                                          '${day3['temp']}°C',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: font,
                                            color: boxfont,
                                          ),
                                        ),
                                        Text(
                                          '${day3['pressure']}hPa',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: font,
                                            color: boxfont,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      height: 20,
                                      thickness: 1,
                                      indent: 0,
                                      endIndent: 0,
                                      color: fontColor,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${name[2]}    ',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: font,
                                            color: boxfont,
                                          ),
                                        ),
                                        Icon(
                                          getIcon(3),
                                          size: 18.0,
                                          color: iconColor,
                                        ),
                                        Text(
                                          '${day4['temp']}°C',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: font,
                                            color: boxfont,
                                          ),
                                        ),
                                        Text(
                                          '${day4['pressure']}hPa',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: font,
                                            color: boxfont,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      height: 20,
                                      thickness: 1,
                                      indent: 0,
                                      endIndent: 0,
                                      color: fontColor,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${name[3]}    ',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: font,
                                            color: boxfont,
                                          ),
                                        ),
                                        Icon(
                                          getIcon(4),
                                          size: 18.0,
                                          color: iconColor,
                                        ),
                                        Text(
                                          '${day5['temp']}°C',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: font,
                                            color: boxfont,
                                          ),
                                        ),
                                        Text(
                                          '${day5['pressure']}hPa',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: font,
                                            color: boxfont,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      height: 20,
                                      thickness: 1,
                                      indent: 0,
                                      endIndent: 0,
                                      color: fontColor,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${name[4]}    ',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: font,
                                            color: boxfont,
                                          ),
                                        ),
                                        Icon(
                                          getIcon(5),
                                          size: 18.0,
                                          color: iconColor,
                                        ),
                                        Text(
                                          '${day6['temp']}°C',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: font,
                                            color: boxfont,
                                          ),
                                        ),
                                        Text(
                                          '${day6['pressure']}hPa',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: font,
                                            color: boxfont,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      height: 20,
                                      thickness: 1,
                                      indent: 0,
                                      endIndent: 0,
                                      color: fontColor,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${name[5]}    ',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: font,
                                            color: boxfont,
                                          ),
                                        ),
                                        Icon(
                                          getIcon(6),
                                          size: 18.0,
                                          color: iconColor,
                                        ),
                                        Text(
                                          '${day7['temp']}°C',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: font,
                                            color: boxfont,
                                          ),
                                        ),
                                        Text(
                                          '${day7['pressure']}hPa',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: font,
                                            color: boxfont,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      height: 20,
                                      thickness: 1,
                                      indent: 0,
                                      endIndent: 0,
                                      color: fontColor,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${name[6]}    ',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: font,
                                            color: boxfont,
                                          ),
                                        ),
                                        Icon(
                                          getIcon(7),
                                          size: 18.0,
                                          color: iconColor,
                                        ),
                                        Text(
                                          '${day8['temp']}°C',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: font,
                                            color: boxfont,
                                          ),
                                        ),
                                        Text(
                                          '${day8['pressure']}hPa',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: font,
                                            color: boxfont,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      height: 20,
                                      thickness: 1,
                                      indent: 0,
                                      endIndent: 0,
                                      color: fontColor,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${name[7]}    ',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: font,
                                            color: boxfont,
                                          ),
                                        ),
                                        Icon(
                                          getIcon(8),
                                          size: 18.0,
                                          color: iconColor,
                                        ),
                                        Text(
                                          '${day9['temp']}°C',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: font,
                                            color: boxfont,
                                          ),
                                        ),
                                        Text(
                                          '${day9['pressure']}hPa',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: font,
                                            color: boxfont,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      height: 20,
                                      thickness: 1,
                                      indent: 0,
                                      endIndent: 0,
                                      color: fontColor,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${name[8]}    ',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: font,
                                            color: boxfont,
                                          ),
                                        ),
                                        Icon(
                                          getIcon(9),
                                          size: 18.0,
                                          color: iconColor,
                                        ),
                                        Text(
                                          '${day10['temp']}°C',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: font,
                                            color: boxfont,
                                          ),
                                        ),
                                        Text(
                                          '${day10['pressure']}hPa',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: font,
                                            color: boxfont,
                                          ),
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: contColor,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Card(
                              color: boxColor,
                              elevation: 0.0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          CupertinoIcons.sunrise_fill,
                                          size: fsize,
                                          color: iconColor,
                                        ),
                                        SizedBox(
                                          width: 3.0,
                                        ),
                                        Text(
                                          'SUNRISE',
                                          style: TextStyle(
                                            fontSize: fsize,
                                            color: boxfont,
                                            fontFamily: font,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 40.0,
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '${results['sunrise']}',
                                        style: TextStyle(
                                          fontSize: infosize,
                                          fontFamily: font,
                                          color: boxfont,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: contColor,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Card(
                              color: boxColor,
                              elevation: 0.0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          CupertinoIcons.sunset_fill,
                                          size: fsize,
                                          color: iconColor,
                                        ),
                                        SizedBox(
                                          width: 3.0,
                                        ),
                                        Text(
                                          'SUNSET',
                                          style: TextStyle(
                                            fontSize: fsize,
                                            color: boxfont,
                                            fontFamily: font,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 40.0,
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '${results['sunset']}',
                                        style: TextStyle(
                                          fontSize: infosize,
                                          fontFamily: font,
                                          color: boxfont,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
