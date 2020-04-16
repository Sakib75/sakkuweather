import 'package:flutter/material.dart';
import 'CloudImage.dart';
import 'weatherinfo.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181A24),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: CloudImage(),

          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            child: WeatherInfo(),

          ),

        ],
      ),
    );
  }
}
