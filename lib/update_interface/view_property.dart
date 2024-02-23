import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rentpropertymanage/Update_backend/firebase_read2.dart';
// import 'package:rentpropertymanage/interfaces/owner_dashboard.dart';
// import 'package:rentpropertymanage/interfaces/more_property details_button.dart';
// import 'package:rentpropertymanage/backend/firebase_read.dart';
// import 'package:rentpropertymanage/backend/firebase_read2.dart';
//import 'package:flutter_application_1/Screens/Add_room_Screen.dart';
//import 'package:flutter_application_1/Screens/Add_Vehicle_screen.dart';
//import 'package:flutter_application_1/Screens/Add_house_screen.dart';
//import 'package:flutter_application_1/Screens/property_list_screen.dart';
//import 'package:flutter_application_1/Screens/buttons.dart';

class view_properties extends StatelessWidget {
  view_properties({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: Readlistview_con());

    /*Scaffold(
        appBar: AppBar(
          title: const Text(
            'View Properties',
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
              MPD_button(
                  iconImagePath: 'assets/images/new_pro.jpg',
                  buttonText: 'Car'),
              MPD_button(
                  iconImagePath: 'assets/images/new_pro.jpg',
                  buttonText: 'House'),
              MPD_button(
                  iconImagePath: 'assets/images/new_pro.jpg',
                  buttonText: 'Room')
            ],
          ),
          /*child: Column(children: [
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('properties').snapshots(),
              builder: (context,snapshot){
                List <Row> propertyWigets = [];
                if (snapshot.hasData) {
                  final property = snapshot.data?.docs.reversed.toList();
                  for (var properties in property!) 
                  {
                    final propertyWigets = Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(properties['Address']),
                        Text(properties['M_cost']),
                        Text(properties['isRented']),
                      ],
                    );
                    propertyWigets.add(propertyWigets);
                  }
                }  


                return Expanded(
                  child: ListView(
                    children: propertyWigets,
                    ),
                    );
              })
          ]),*/
        ));*/
  }
}
