// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:rentpropertymanage/backend/databaseservices.dart';
// import 'package:rentpropertymanage/models/card_model.dart';
// import 'package:rentpropertymanage/interfaces/notification_interface.dart';

// class tenantHome extends StatefulWidget {
//   const tenantHome({super.key});

//   @override
//   State<tenantHome> createState() => _tenantHomeState();
// }

// class _tenantHomeState extends State<tenantHome> {
//   List<Property> properties = [];
//   late String uid;
//   int no_properties = 0;

//   @override
//   void initState() {
//     super.initState();
//     FirebaseAuth auth = FirebaseAuth.instance;
//     User? user = auth.currentUser;

//     if (user != null) {
//       uid = user.uid;
//       print('The UID of the current user is: $uid');
//     } else {
//       print('No user currently signed in.');
//     }

//     fetchProperties(uid).then((fetchedProperties) {
//       setState(() {
//         properties = fetchedProperties;
//       });
//       no_properties = properties.length;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<DocumentSnapshot>(
//       future: FirebaseFirestore.instance.collection('users').doc(uid).get(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator();
//         } else if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         } else {
//           String userName = snapshot.data!['name'];
//           return Scaffold(
//             backgroundColor: Color.fromRGBO(25, 23, 61, 1),
//             appBar: AppBar(
//               backgroundColor: Color.fromARGB(255, 25, 23, 61),
//               leading: const Padding(
//                 padding: EdgeInsets.all(2.0),
//                 child: Column(
//                   children: <Widget>[
//                     CircleAvatar(
//                       radius: 26,
//                       backgroundColor: Colors.transparent,
//                       backgroundImage: AssetImage('assets/images/new.jpg'),
//                       foregroundColor: Colors.white,
//                     ),
//                   ],
//                 ),
//               ),
//               title: Text(
//                 'Welcome back!\n$userName',
//                 style: TextStyle(color: Colors.white),
//               ),
//               actions: <Widget>[
//                 IconButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const notification_interface()),
//                     );
//                   },
//                   icon: const Icon(Icons.add_alert, color: Colors.white),
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     // Add another button function
//                   },
//                   icon: const Icon(Icons.more_vert, color: Colors.white),
//                 ),
//               ],
//             ),
//             body: Stack(
//               children: [
//                 ClipPath(
//                   clipper: CustomClipPath(),
//                   child: Container(
//                     color: Color.fromARGB(146, 29, 29, 77),
//                     height: double.infinity,
//                     width: double.infinity,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(
//                             top: 300,
//                             left: 16,
//                           ),
//                           child: Text(
//                             'Current Subscriptions',
//                             style:
//                                 TextStyle(color: Colors.white60, fontSize: 20),
//                           ),
//                         ),
//                         StreamBuilder<QuerySnapshot>(
//                           stream: FirebaseFirestore.instance
//                               .collection('users')
//                               .doc(uid)
//                               .collection('properties')
//                               .snapshots(),
//                           builder: (BuildContext context,
//                               AsyncSnapshot<QuerySnapshot> snapshot) {
//                             if (snapshot.hasError) {
//                               return Text('Error: ${snapshot.error}');
//                             }

//                             if (snapshot.connectionState ==
//                                 ConnectionState.waiting) {
//                               return CircularProgressIndicator();
//                             }
//                             if (snapshot.hasData &&
//                                 snapshot.data!.docs.length > 1) {
//                               return Expanded(
//                                 child: ListView.builder(
//                                   itemCount: snapshot.data!.docs.length,
//                                   itemBuilder:
//                                       (BuildContext context, int index) {
//                                     var property = snapshot.data!.docs[index];
//                                     String start = property['startDate'];
//                                     String end = property['endDate'];
//                                     if (start.isEmpty) {
//                                       return null;
//                                     }
//                                     return propertycard(
//                                       date:
//                                           '$start              |          $end',
//                                       Name: property['name'],
//                                       ispaid: property['ispaid'],
//                                       startdate: property['startDate'],
//                                       enddate: property['endDate'],
//                                     );
//                                   },
//                                 ),
//                               );
//                             } else {
//                               // Return a placeholder widget or a message when there's no data
//                               return Center(
//                                 child: Text(
//                                   "No data available",
//                                   style: TextStyle(color: Colors.white54),
//                                 ),
//                               );
//                             }

//                             // return Expanded(
//                             //   child: ListView.builder(
//                             //     itemCount: snapshot.data!.docs.length,
//                             //     itemBuilder:
//                             //         (BuildContext context, int index) {
//                             //       var property = snapshot.data!.docs[index];
//                             //       String start = property['startDate'];
//                             //       String end = property['endDate'];
//                             //       return propertycard(
//                             //         date:
//                             //             '$start              |          $end',
//                             //         Name: property['name'],
//                             //         ispaid: property['ispaid'],
//                             //         startdate: property['startDate'],
//                             //         enddate: property['endDate'],
//                             //       );
//                             //     },
//                             //   ),
//                             // );
//                           },
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: 25,
//                   left: 0,
//                   right: 0,
//                   child: Container(
//                     height: 240,
//                     child: Stack(
//                       children: [
//                         PieChart(
//                           PieChartData(
//                             sectionsSpace: 10,
//                             centerSpaceRadius: 80,
//                             sections: [
//                               PieChartSectionData(
//                                 color: const Color(0xff0293ee),
//                                 value: 40,
//                                 title: '40%',
//                                 radius: 55,
//                                 titleStyle: const TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                   color: Color(0xffffffff),
//                                 ),
//                               ),
//                               PieChartSectionData(
//                                 color: const Color(0xfff8b250),
//                                 value: 30,
//                                 title: '30%',
//                                 radius: 55,
//                                 titleStyle: const TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                   color: Color(0xffffffff),
//                                 ),
//                               ),
//                               PieChartSectionData(
//                                 color: const Color(0xff845bef),
//                                 value: 30,
//                                 title: '30%',
//                                 radius: 55,
//                                 titleStyle: const TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                   color: Color(0xffffffff),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const Positioned.fill(
//                           child: Center(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   'Rs 55,450.00', // Your text here
//                                   style: TextStyle(
//                                     fontSize: 19,
//                                     fontWeight: FontWeight.w900,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 SizedBox(height: 1),
//                                 Text(
//                                   'Total Payable', // Your text here
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w400,
//                                     color: Color.fromARGB(175, 255, 255, 255),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//       },
//     );
//   }
// }

// class CustomClipPath extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.moveTo(size.width * 0.0010000, size.height * 0.2521667);
//     path.lineTo(size.width * 0.0010000, size.height * 1.0046667);
//     path.lineTo(size.width * 1.0043333, size.height * 1.0071667);
//     path.lineTo(size.width * 1.0076667, size.height * 0.2530000);
//     path.quadraticBezierTo(size.width * 0.9530000, size.height * 0.2534750,
//         size.width * 0.9276333, size.height * 0.2536333);
//     path.cubicTo(
//         size.width * 0.8293500,
//         size.height * 0.3054667,
//         size.width * 0.8899667,
//         size.height * 0.4184000,
//         size.width * 0.5059833,
//         size.height * 0.4502917);
//     path.cubicTo(
//         size.width * 0.0666000,
//         size.height * 0.4173833,
//         size.width * 0.1705833,
//         size.height * 0.2894667,
//         size.width * 0.0606167,
//         size.height * 0.2527833);
//     path.quadraticBezierTo(size.width * 0.0372667, size.height * 0.2530417,
//         size.width * 0.0010000, size.height * 0.2521667);
//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:rentpropertymanage/backend/databaseservices.dart';
import 'package:rentpropertymanage/interfaces/notification_interface.dart';
import 'package:rentpropertymanage/models/card_model.dart';

class tenantHome extends StatefulWidget {
  const tenantHome({Key? key}) : super(key: key);

  @override
  State<tenantHome> createState() => _tenantHomeState();
}

class _tenantHomeState extends State<tenantHome> {
  late List<Property> properties;
  late String uid;
  int no_properties = 0;
  int random_no1 = Random().nextInt(50);
  int random_no2 = Random().nextInt(50);

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
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance.collection('users').doc(uid).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          String userName = snapshot.data!['name'];
          return Scaffold(
            backgroundColor: const Color.fromRGBO(25, 23, 61, 1),
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 25, 23, 61),
              leading: const Padding(
                padding: EdgeInsets.all(2.0),
                child: CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(
                      'assets/images/new.jpg'), //<-------------------profile photo
                  foregroundColor: Colors.white,
                ),
              ),
              title: Text(
                'Welcome back!\n$userName',
                style: const TextStyle(color: Colors.white),
              ),
              actions: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const notification_interface()),
                    );
                  },
                  icon: const Icon(Icons.add_alert, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    // Add another button function
                  },
                  icon: const Icon(Icons.more_vert, color: Colors.white),
                ),
              ],
            ),
            body: Stack(
              children: [
                ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    color: Color.fromARGB(193, 29, 29, 77),
                    height: double.infinity,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 300,
                            left: 16,
                          ),
                          child: Text(
                            'Current Subscriptions',
                            style:
                                TextStyle(color: Colors.white60, fontSize: 20),
                          ),
                        ),
                        StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(uid)
                              .collection('properties')
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            }

                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            }
                            if (snapshot.hasData &&
                                snapshot.data!.docs.length > 0) {
                              return Expanded(
                                child: ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var property = snapshot.data!.docs[index];
                                    String start = property['startDate'];
                                    String end = property['endDate'];
                                    String property_type =
                                        property['property type'];
                                    String images;
                                    if (start.isEmpty) {
                                      return const SizedBox.shrink();
                                    }
                                    if (property_type == 'Room') {
                                      images = 'Room';
                                    } else if (property_type == 'Vehicle') {
                                      images = 'Vehicle';
                                    } else {
                                      images = 'House';
                                    }
                                    return propertycard(
                                      date:
                                          '$start              |          $end',
                                      Name: property['name'],
                                      ispaid: property['ispaid'],
                                      startdate: property['startDate'],
                                      enddate: property['endDate'],
                                      type: images,
                                    );
                                  },
                                ),
                              );
                            } else {
                              // Return a placeholder widget or a message when there's no data
                              return Center(
                                child: Text(
                                  "No data available",
                                  style: const TextStyle(color: Colors.white54),
                                ),
                              );
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 25,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 240,
                    child: Stack(
                      children: [
                        PieChart(
                          PieChartData(
                            sectionsSpace: 10,
                            centerSpaceRadius: 80,
                            sections: [
                              PieChartSectionData(
                                color: const Color(0xff0293ee),
                                value: random_no1.toDouble(),
                                title: 'Houses\n$random_no1%',
                                radius: 55,
                                titleStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffffffff),
                                ),
                              ),
                              PieChartSectionData(
                                color: const Color(0xfff8b250),
                                value: random_no2.toDouble(),
                                title: 'Rooms\n$random_no2%',
                                radius: 55,
                                titleStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffffffff),
                                ),
                              ),
                              PieChartSectionData(
                                color: const Color(0xff845bef),
                                value: (100 - (random_no1 + random_no2))
                                    .toDouble(),
                                title:
                                    'Vehicles\n${(100 - (random_no1 + random_no2))}%',
                                radius: 55,
                                titleStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned.fill(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Rs ${Random().nextInt(200000)}',
                                  style: const TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 1),
                                const Text(
                                  'Total Payable',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(175, 255, 255, 255),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.0010000, size.height * 0.2521667);
    path.lineTo(size.width * 0.0010000, size.height * 1.0046667);
    path.lineTo(size.width * 1.0043333, size.height * 1.0071667);
    path.lineTo(size.width * 1.0076667, size.height * 0.2530000);
    path.quadraticBezierTo(size.width * 0.9530000, size.height * 0.2534750,
        size.width * 0.9276333, size.height * 0.2536333);
    path.cubicTo(
        size.width * 0.8293500,
        size.height * 0.3054667,
        size.width * 0.8899667,
        size.height * 0.4184000,
        size.width * 0.5059833,
        size.height * 0.4502917);
    path.cubicTo(
        size.width * 0.0666000,
        size.height * 0.4173833,
        size.width * 0.1705833,
        size.height * 0.2894667,
        size.width * 0.0606167,
        size.height * 0.2527833);
    path.quadraticBezierTo(size.width * 0.0372667, size.height * 0.2530417,
        size.width * 0.0010000, size.height * 0.2521667);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
