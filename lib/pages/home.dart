import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:world_time/services/world_time.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   WorldTime? data;
   
  @override
  Widget build(BuildContext context) {
    /* inside the build method we can receive the Map
     of data that was sent to use but we need the build
     context reason why we place it inside */

    data = data?? ModalRoute.of(context)?.settings.arguments as WorldTime;

    print(
        "### This is data value : $data , and instance run state : ${data!.location}, time: ${data!.time}");

    // set background image
    String bgImage = data!.isDayTime ? 'daytime.jpeg' : 'nighttime.jpeg';
    Color? bgColor = data!.isDayTime ? Colors.blue : Colors.indigo[700];
    /**
      * we don't use setState to update the data variable here be
      */

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/${bgImage}'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(children: <Widget>[
              FlatButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    Navigator.pushNamed(context, '/location');
                    print('result: $result');

                    final newData = WorldTime(
                        location: result.location,
                        flag: result.flag,
                        url: result.url,
                        time: result.time,
                        // pass whatever time data we get back from the g
                        isDayTime: result.isDayTime);

                    print('newData : $newData');

                    setState(() {
                      data = newData;
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),
                  )),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '${data!.location}',
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      // color: Colors
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                '${data!.time}',
                style: TextStyle(fontSize: 66.0),
              ),
              SizedBox(
                height: 20.0,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
