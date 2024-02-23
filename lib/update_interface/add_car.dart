import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rentpropertymanage/update_interface/owner_dashboard.dart';
// import 'package:rentpropertymanage/interfaces/owner_dashboard.dart';
//import 'package:flutter_application_1/Screens/Add_room_Screen.dart';
//import 'package:flutter_application_1/Screens/Add_Vehicle_screen.dart';
//import 'package:flutter_application_1/Screens/Add_house_screen.dart';
//import 'package:flutter_application_1/Screens/property_list_screen.dart';
//import 'package:flutter_application_1/Screens/buttons.dart';

class add_car extends StatelessWidget {
  add_car({super.key});

  final modelController = TextEditingController();
  final costController = TextEditingController();
  final isRentedController = TextEditingController();
  final uniqueIDController = TextEditingController();
  final imageController = TextEditingController();
  final seatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Add Vehicle',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF000025c),
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
        backgroundColor: Color(0xFF000025c),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(children: [
            TextFormField(
              style: TextStyle(color: Colors.white70),
              controller: modelController,
              decoration: const InputDecoration(
                  labelText: 'Car Model',
                  labelStyle: TextStyle(fontSize: 18, color: Colors.white)),
            ),
            TextFormField(
              style: TextStyle(color: Colors.white70),
              controller: costController,
              decoration: const InputDecoration(
                  labelText: 'Per day Cost',
                  labelStyle: TextStyle(fontSize: 18, color: Colors.white)),
            ),
            TextFormField(
              style: TextStyle(color: Colors.white70),
              controller: seatController,
              decoration: const InputDecoration(
                  labelText: 'No. of Seats',
                  labelStyle: TextStyle(fontSize: 18, color: Colors.white)),
            ),
            TextFormField(
              style: TextStyle(color: Colors.white70),
              controller: imageController,
              decoration: const InputDecoration(
                  labelText: 'Image',
                  labelStyle: TextStyle(fontSize: 18, color: Colors.white)),
            ),
            TextFormField(
              style: TextStyle(color: Colors.white70),
              controller: isRentedController,
              decoration: const InputDecoration(
                  labelText: 'Rented State',
                  labelStyle: TextStyle(fontSize: 18, color: Colors.white)),
            ),
            TextFormField(
              style: TextStyle(color: Colors.white70),
              controller: uniqueIDController,
              decoration: const InputDecoration(
                  labelText: 'Unique ID',
                  labelStyle: TextStyle(fontSize: 18, color: Colors.white)),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  CollectionReference collRef =
                      FirebaseFirestore.instance.collection('Add_Vehicle');
                  collRef.add({
                    'Car_model': modelController.text,
                    'Cost': costController.text,
                    'isRented': isRentedController.text,
                    'UniqueID': uniqueIDController.text,
                    'image': imageController.text,
                    'no_of_Seats': seatController.text,
                  });
                },
                child: const Text("Add Vehicle"))
          ]),
        ));
  }
}
