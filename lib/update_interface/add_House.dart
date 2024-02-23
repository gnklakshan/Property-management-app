import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:rentpropertymanage/interfaces/owner_dashboard.dart';
import 'package:rentpropertymanage/update_interface/owner_dashboard.dart';
//import 'package:flutter_application_1/Screens/Add_room_Screen.dart';
//import 'package:flutter_application_1/Screens/Add_Vehicle_screen.dart';
//import 'package:flutter_application_1/Screens/Add_house_screen.dart';
//import 'package:flutter_application_1/Screens/property_list_screen.dart';
//import 'package:flutter_application_1/Screens/buttons.dart';

class add_hosue extends StatelessWidget {
  add_hosue({super.key});

  final addressController = TextEditingController();
  final costController = TextEditingController();
  final isRentedController = TextEditingController();
  final uniqueIDController = TextEditingController();
  final imageController = TextEditingController();
  final bathController = TextEditingController();
  final roomController = TextEditingController();
  final areaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Add House',
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
              controller: addressController,
              style: TextStyle(color: Colors.white70),
              decoration: const InputDecoration(
                  labelText: 'Address',
                  labelStyle: TextStyle(fontSize: 18, color: Colors.white)),
            ),
            TextFormField(
              controller: costController,
              style: TextStyle(color: Colors.white70),
              decoration: const InputDecoration(
                  labelText: 'Price',
                  labelStyle: TextStyle(fontSize: 18, color: Colors.white)),
            ),
            TextFormField(
              controller: areaController,
              style: TextStyle(color: Colors.white70),
              decoration: const InputDecoration(
                  labelText: 'Area(sqft)',
                  labelStyle: TextStyle(fontSize: 18, color: Colors.white)),
            ),
            TextFormField(
              controller: bathController,
              style: TextStyle(color: Colors.white70),
              decoration: const InputDecoration(
                  labelText: 'No of bath',
                  labelStyle: TextStyle(fontSize: 18, color: Colors.white)),
            ),
            TextFormField(
              controller: roomController,
              style: TextStyle(color: Colors.white70),
              decoration: const InputDecoration(
                  labelText: 'No of room',
                  labelStyle: TextStyle(fontSize: 18, color: Colors.white)),
            ),
            TextFormField(
              controller: uniqueIDController,
              style: TextStyle(color: Colors.white70),
              decoration: const InputDecoration(
                  labelText: 'Unique ID',
                  labelStyle: TextStyle(fontSize: 18, color: Colors.white)),
            ),
            TextFormField(
              controller: imageController,
              style: TextStyle(color: Colors.white70),
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
                      FirebaseFirestore.instance.collection('Add_house');
                  collRef.add({
                    'Address': addressController.text,
                    'Price': costController.text,
                    'isRented': isRentedController.text,
                    'UniqueID': uniqueIDController.text,
                    'image': imageController.text,
                    'no_of_bath': bathController.text,
                    'no_of_room': roomController.text,
                    'area': areaController.text,
                  });
                },
                child: const Text("Add House"))
          ]),
        ));
  }
}
