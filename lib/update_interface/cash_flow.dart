import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rentpropertymanage/update_interface/owner_dashboard.dart';
import 'package:rentpropertymanage/update_interface/view_property.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter_application_1/Screens/Add_room_Screen.dart';
//import 'package:flutter_application_1/Screens/Add_Vehicle_screen.dart';
//import 'package:flutter_application_1/Screens/Add_house_screen.dart';
//import 'package:flutter_application_1/Screens/property_list_screen.dart';
//import 'package:flutter_application_1/Screens/buttons.dart';

class cash_flow extends StatelessWidget {
  final String buttonText;
  final String image;
  final String bath;
  final String bed;
  final String price;
  const cash_flow({
    Key? key,
    required this.buttonText,
    required this.bed,
    required this.bath,
    required this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                      width: 425,
                      height: 350,
                      color: Colors.lightBlue,
                      child: FittedBox(
                        child: Image(image: NetworkImage(image)),
                        fit: BoxFit.fill,
                      ) //Image(image: NetworkImage("https://thearchitectsdiary.com/wp-content/uploads/2020/06/Property-.jpg")),

                      ),
                  Positioned(
                      bottom: -60,
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(15),
                        height: 100,
                        width: 363,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFFe8e8e8),
                                blurRadius: 5.0,
                                offset: Offset(0, 5)),
                          ],
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                                top: 20,
                                left: 20,
                                child: Text(buttonText,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17))),
                            Positioned(
                                top: 55,
                                left: 20,
                                child: Text("$bed Bed Rooms,$bath Bath Rooms",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15))),
                            Positioned(
                                top: 30,
                                left: 240,
                                child: Text(price,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 23))),
                          ],
                        ),
                        //color: Colors.black,
                      ))
                ],
              ),
            ),
            Positioned(
                top: 20,
                left: 10,
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => view_properties()));
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ))),
            Positioned(
                top: 20,
                left: 350,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.dehaze,
                      color: Colors.white,
                    ))),
            Positioned(
                top: 400,
                child: Container(
                  margin: EdgeInsets.all(15),
                  height: 300,
                  width: 363,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFFe8e8e8),
                          blurRadius: 5.0,
                          offset: Offset(5, 5)),
                      BoxShadow(
                          color: Color(0xFFe8e8e8),
                          blurRadius: 5.0,
                          offset: Offset(-5, -5))
                    ],
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                          top: 30,
                          left: 20,
                          child: Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add_circle,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Special Features",
                                ),
                              ],
                            ),
                          )),
                      Positioned(
                          top: 70,
                          left: 20,
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    color: Colors.white),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: FittedBox(
                                    child: Image(
                                        image: NetworkImage(
                                            "https://backyardpoolpatio.com/wp-content/uploads/2022/08/Leisure-Pools-Supreme-Graphite-Grey-leisure-pools-inside.webp")),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          )),
                      Positioned(
                          top: 70,
                          left: 183,
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    color: Colors.white),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: FittedBox(
                                    child: Image(
                                        image: NetworkImage(
                                            "https://www.premierbuiltgarages.ca/wp-content/uploads/2021/05/Detached-Garage-with-open-door-and-unfinished-interior.jpg")),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          )),
                      Positioned(
                          top: 235,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              Icon(Icons.pool),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Pool"),
                              SizedBox(
                                width: 93,
                              ),
                              Icon(Icons.garage),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Garage"),
                            ],
                          ))
                    ],
                  ),
                )),
            Positioned(
                top: 730,
                child: Row(children: [
                  SizedBox(
                    width: 125,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Current Tenant",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ))
                ]))
          ],
        ),
      ),
    );
  }
}
