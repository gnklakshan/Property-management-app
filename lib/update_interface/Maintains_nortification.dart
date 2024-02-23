import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rentpropertymanage/Update_backend/noy_read.dart';
// import 'package:rentpropertymanage/interfaces/owner_dashboard.dart';
// import 'package:rentpropertymanage/interfaces/nortification_message_format.dart';
// import 'package:rentpropertymanage/backend/not_read.dart';
// //import 'package:flutter_application_1/Screens/Add_room_Screen.dart';
//import 'package:flutter_application_1/Screens/Add_Vehicle_screen.dart';
//import 'package:flutter_application_1/Screens/Add_house_screen.dart';
//import 'package:flutter_application_1/Screens/property_list_screen.dart';
//import 'package:flutter_application_1/Screens/buttons.dart';

class maintain extends StatelessWidget {
  maintain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:
            Notificationlistview()); /*Scaffold(
        appBar: AppBar(
          title: const Text(
            'Maintains notification',
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
                    MaterialPageRoute(builder: (context) => owner_dashboard()));
              },
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Color(0xFF19173d),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NM_format(
                  date: 'Feb,14',
                  time: '12.38',
                  tenant_name: 'Rashel',
                  message_type: 'Maintain Request',
                  messsage_note: 'Water damage and leaks from the ceiling'),
              NM_format(
                  date: 'Feb,15',
                  time: '15.04',
                  tenant_name: 'Nisha',
                  message_type: 'Maintain Request',
                  messsage_note: 'Gas leak'),
              NM_format(
                  date: 'Jan,24',
                  time: '7.56',
                  tenant_name: 'Kamal',
                  message_type: ' Complaints',
                  messsage_note: 'Noisy neighbours')
            ],
          ),
        ));*/
  }
}
