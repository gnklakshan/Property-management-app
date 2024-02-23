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

class add_property extends StatelessWidget {
  add_property({super.key});

  final addressController = TextEditingController();
  final costController = TextEditingController();
  final isRentedController = TextEditingController();
  final uniqueIDController = TextEditingController();
  final imageController = TextEditingController();
  final isbathController = TextEditingController();
  final areaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Add Room',
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
              controller: addressController,
              decoration: const InputDecoration(
                  labelText: 'Address',
                  labelStyle: TextStyle(fontSize: 18, color: Colors.white)),
            ),
            TextFormField(
              style: TextStyle(color: Colors.white70),
              controller: costController,
              decoration: const InputDecoration(
                  labelText: 'Monthly Cost',
                  labelStyle: TextStyle(fontSize: 18, color: Colors.white)),
            ),
            TextFormField(
              style: TextStyle(color: Colors.white70),
              controller: areaController,
              decoration: const InputDecoration(
                  labelText: 'Area (sqft)',
                  labelStyle: TextStyle(fontSize: 18, color: Colors.white)),
            ),
            TextFormField(
              style: TextStyle(color: Colors.white70),
              controller: isbathController,
              decoration: const InputDecoration(
                  labelText: 'Is there are attach Bathroom',
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
            TextFormField(
              style: TextStyle(color: Colors.white70),
              controller: imageController,
              decoration: const InputDecoration(
                  labelText: 'Image',
                  labelStyle: TextStyle(fontSize: 18, color: Colors.white)),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  CollectionReference collRef =
                      FirebaseFirestore.instance.collection('Add_room');
                  collRef.add({
                    'Address': addressController.text,
                    'Cost': costController.text,
                    'isRented': isRentedController.text,
                    'isAttachedBath': addressController.text,
                    'Area': costController.text,
                    'UniqueID': isRentedController.text,
                    'image': isRentedController.text,
                  });
                },
                child: const Text("Add Room"))
          ]),
        ));
  }
}
