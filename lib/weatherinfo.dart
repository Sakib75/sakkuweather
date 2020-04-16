import 'dart:convert';
import 'package:flutter/material.dart';
import 'networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class WeatherInfo extends StatefulWidget {
  @override
  _WeatherInfoState createState() => _WeatherInfoState();
}

class _WeatherInfoState extends State<WeatherInfo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    getDate();

  }

  void getLocation() async {

  }

  void getData () async{
    NetworkHelper networkHelper = await NetworkHelper();
    var weatherData = await networkHelper.Networking();
    var decodedData = jsonDecode(weatherData);


    setState(() {
      current_temp = decodedData['current']['temp'].toString();
      print(current_temp);

      for(var i = 0 ;  i <= 7 ; i++) {
        min_temps.add(decodedData['daily'][i]['temp']['min']);
      }
      print(min_temps);
      for(var i = 0 ;  i <= 7 ; i++) {
        top_temps.add(decodedData['daily'][i]['temp']['max']);
      }
      print(top_temps);



      
    });

  }

  void getDate()  {

    var now = DateTime.now();
    print(now);
    for(var i = 0;i<=7;i++) {
      dates.add(now.add(Duration(days: i)));
    }
    print(dates);
    for(var i = 0;i<=7;i++) {
      o_dates.add(dates[i].day);
    }
    print(o_dates);

    for(var i = 0;i<=7;i++) {
      o_months.add(dates[i].month);
    }
    print(o_months);


  }

  @override
  Widget build(BuildContext context) {
    if(top_temps.length == 8) {
      return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: top_temps.length,
          itemBuilder: (context, index) {
            return Container(
              color: index % 2 == 0 ? Color(0xff181A24) : Color(0xff3C3E46),
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image(image: AssetImage('assets/Colud_s.png',),
                    width: 30,
                    height: 30,),
                  Text('${o_dates[index]} ${n_months[o_months[index] - 1]}',
                    style: TextStyle(fontSize: 15, color: Colors.white),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('max', style: TextStyle(color: Colors.white),),
                      Text('min', style: TextStyle(color: Colors.white))
                    ],),
                  Text('${top_temps[index]} / ${min_temps[index]}',
                    style: TextStyle(fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),)
                ],
              ),
            );
          });
    } else {
      return  Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        child: SpinKitWave(
          color: Colors.white,
          size: 50.0,
        ));
    }
  }
}
