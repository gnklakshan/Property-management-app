import 'package:flutter/material.dart';
import 'Add_room_Screen.dart';
import 'Add_Vehicle_screen.dart';
import 'Add_house_screen.dart';
import 'property_list_screen.dart';
import 'buttons.dart';

class Add_property_Screen extends StatelessWidget {
  const Add_property_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Add Property',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF19173d),
          leading: IconButton(
            onPressed: () {},
            icon: IconButton(
              icon: const Icon(Icons.arrow_circle_left_rounded),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => list_Screen()));
              },
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Color(0xFF19173d),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[Text(""), Text("")],
            ),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    minimumSize: Size(300, 71),
                    primary: Color.fromARGB(255, 255, 255, 255),
                    side: BorderSide(width: 3, color: Colors.white)),
                child: Text(
                  'Add Room',
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 252, 252, 252)),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Add_room_Screen()));
                }),
            SizedBox(height: 16),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    minimumSize: Size(300, 71),
                    primary: Color.fromARGB(255, 255, 255, 255),
                    side: BorderSide(width: 3, color: Colors.white)),
                child: Text(
                  'Add House',
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 252, 252, 252)),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Add_house_Screen()));
                }),
            SizedBox(height: 16),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    minimumSize: Size(300, 71),
                    primary: Color.fromARGB(255, 255, 255, 255),
                    side: BorderSide(width: 3, color: Colors.white)),
                child: Text(
                  'Add Vehical',
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 252, 252, 252)),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Add_vehical_Screen()));
                }),
          ],
        ));
  }
}
