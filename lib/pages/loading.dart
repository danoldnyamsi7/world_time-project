import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/world_time.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Text('loading page works'),
    ),
  ));
}

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Berlin',
        flag: 'germany.png',
        url: 'Europe/Berlin',
        time: '',
        isDayTime: false);
    await instance.getTime();
    /*
          the third parameter permits you to send a Map of data to the defined route
     */
    Navigator.pushReplacementNamed(context, '/home', arguments: instance);
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
