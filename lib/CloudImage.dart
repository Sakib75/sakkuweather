import 'package:flutter/material.dart';

class CloudImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(image: AssetImage('assets/clouds.png'),fit: BoxFit.contain,width: MediaQuery.of(context).size.width * 0.5,),
          SizedBox(height: 30,),
          Image(image: AssetImage('assets/Rain.png'),fit: BoxFit.contain,width: MediaQuery.of(context).size.width * 0.5,),
        ],
      ),
    );
  }
}