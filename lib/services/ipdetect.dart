import 'dart:io';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:network_info_plus/network_info_plus.dart';

class Ip {

  String city = '';
  String lat = '';
  String lon = '';
  String ip = '';
  String accesskey = 'ef56d9019397b69add8fbd47e1a9ab8a';

  Future printIps() async {
    for (var interface in await NetworkInterface.list()) {
      for (var addr in interface.addresses) {
        ip = addr.host;
        // print('${addr.address} ${addr.host} ${addr.isLoopback} ${addr.rawAddress} ${addr.type.name}');
      }
    }
  }

  Future<void> getdata() async{

    try {
      await printIps();
      print(ip);
      ip = '172.69.129.138';
      Response response = await get(Uri.parse('https://api.ipstack.com/$ip?access_key=$accesskey'));
      Map data = jsonDecode(response.body);
      city = data['city'];
      lat = data['latitude'].toString();
      lon = data['longitude'].toString();

    }
    catch(e) {
      ip = '172.69.129.138';
      print('ip detect Error');
    }

  }

}