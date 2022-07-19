import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:world_time/services/world_time.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Text('location page works'),
    ),
  ));
}

class ChooseLocation extends StatefulWidget {
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        location: 'Seoul',
        flag: 'indonesia.png',
        url: 'Asia/Seoul',
        time: '',
        isDayTime: false),
    WorldTime(
        location: 'Chicago',
        flag: 'usa.png',
        url: 'America/Chicago',
        time: '',
        isDayTime: false),
    WorldTime(
        location: 'Berlin',
        flag: 'germany.png',
        url: 'Europe/Berlin',
        time: '',
        isDayTime: false),
    WorldTime(
        location: 'Cairo',
        flag: 'egypt.png',
        url: 'Africa/Cairo',
        time: '',
        isDayTime: false),
    WorldTime(
        location: 'New York',
        flag: 'usa.png',
        url: 'America/New_York',
        time: '',
        isDayTime: false),
    WorldTime(
        location: 'London',
        flag: 'uk.png',
        url: 'Europe/London',
        time: '',
        isDayTime: false),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    print(instance);

    
        // print()
    // navigate to home screen
    Navigator.pop(context, instance);
    // pass whatever time data we get back from the getTime function
  }

  @override
  Widget build(BuildContext context) {
    print('build function of chooseLocation ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                    // print(locations[index].location);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
