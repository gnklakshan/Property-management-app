import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rentpropertymanage/backend/notificationservice.dart';
import 'package:rentpropertymanage/interfaces/propertyView_tenant/bill_update.dart';
import 'package:rentpropertymanage/interfaces/property_in_details.dart';
import 'package:rentpropertymanage/interfaces/vehicle_in_details.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:rentpropertymanage/backend/databaseservices.dart';
import 'package:url_launcher/url_launcher.dart';

class PropertyDetails_vehicle extends StatefulWidget {
  final String propertyName;
  final String propertyDate;
  final bool propertyIsPaid;
  final String propertystartDate;
  final String propertyendDate;
  //const PropertyDetails({Key? key}) : super(key: key);

  const PropertyDetails_vehicle({
    required this.propertyName,
    required this.propertyDate,
    required this.propertyIsPaid,
    required this.propertystartDate,
    required this.propertyendDate,
  });

  @override
  State<PropertyDetails_vehicle> createState() =>
      _PropertyDetails_vehicleState();
}

class _PropertyDetails_vehicleState extends State<PropertyDetails_vehicle> {
  late List<Property> properties;
  late String uid;
  int noProperties = 0;
  int initialdays = 20;

  @override
  void initState() {
    super.initState();
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      uid = user.uid;
      print('The UID of the current user is: $uid');
    } else {
      print('No user currently signed in.');
    }

    fetchProperties(uid).then((fetchedProperties) {
      setState(() {
        properties = fetchedProperties;
        noProperties = properties.length;
      });
    });
  }

  Widget _buildCircularIconButton(
      IconData icon, String label, Function() onPressed) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(224, 11, 0, 40),
                Color.fromARGB(213, 15, 29, 99),
                Color.fromARGB(220, 10, 3, 41),
              ],
            ),
          ),
          child: IconButton(
            icon: Icon(icon),
            onPressed: onPressed,
            color: Colors.white,
            iconSize: 30,
          ),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 23, 61, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(25, 23, 61, 1),
      ),
      body: Stack(
        children: [
          ClipPath(
            child: Container(
              color: Color.fromARGB(146, 29, 29, 77),
              height: double.infinity,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0), // Outer padding
                    child: Center(
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(224, 11, 0, 40),
                              Color.fromARGB(213, 15, 29, 99),
                              Color.fromARGB(220, 10, 3, 41),
                            ],
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        height: 250,
                        width: double.infinity,
                        child: SleekCircularSlider(
                          appearance: CircularSliderAppearance(
                            size: 300, // Adjust size as needed
                            customColors: CustomSliderColors(
                              trackColor:
                                  const Color.fromARGB(255, 189, 189, 189)!,
                              progressBarColor:
                                  const Color.fromARGB(255, 243, 82, 33),
                              shadowColor:
                                  const Color.fromARGB(255, 59, 56, 56),
                              shadowMaxOpacity: 0.05,
                            ),
                            customWidths: CustomSliderWidths(
                              progressBarWidth: 16,
                              trackWidth: 15,
                              shadowWidth: 15,
                            ),
                            infoProperties: InfoProperties(
                              mainLabelStyle: TextStyle(
                                color: Color.fromARGB(19, 11, 11, 21),
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            startAngle: 270,
                            angleRange: 360,
                          ),
                          min: 0,
                          max: 50,
                          initialValue: initialdays.toDouble(), // Example value
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Circular icon buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCircularIconButton(
                        Icons.comment,
                        'Complains',
                        () => opendialognotifi(context),
                      ),
                      _buildCircularIconButton(
                        Icons.local_gas_station,
                        'Fuel',
                        () => billadded(context),
                      ),
                      _buildCircularIconButton(
                        Icons.car_repair,
                        'services',
                        () => billadded(context),
                      ),
                      _buildCircularIconButton(Icons.payment, 'Pay', () {
                        const url = 'https://inet.boc.lk/epay/';
                        launch(url);
                      }),
                    ],
                  ),
                  SizedBox(height: 14),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors
                          .transparent, // Set the button's background color to transparent
                      padding: EdgeInsets
                          .zero, // Remove padding to make the gradient fill the button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                    onPressed: () {},
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(224, 11, 0, 40),
                            Color.fromARGB(213, 15, 29, 99),
                            Color.fromARGB(220, 10, 3, 41),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: Container(
                        constraints: BoxConstraints(minHeight: 50),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 1.5),
                            Text(
                              'View Vehicle details',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                fontSize: 20,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.navigate_next),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ViewVehicle()),
                                );
                              },
                              color: Colors.white,
                              iconSize: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 18),
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      'Notifications',
                      style: TextStyle(color: Colors.white60, fontSize: 22),
                    ),
                  ),
                  Text(
                    '                           No Notifications',
                    style: TextStyle(
                        color: Color.fromARGB(82, 255, 255, 255), fontSize: 18),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 105,
            left: 145,
            right: 0,
            child: Text(
              "  $initialdays days\nremaining",
              style: TextStyle(
                color: Color.fromARGB(238, 255, 250, 250),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
