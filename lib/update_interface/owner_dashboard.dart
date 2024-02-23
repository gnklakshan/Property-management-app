// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:percent_indicator/percent_indicator.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:quickalert/models/quickalert_type.dart';
// import 'package:quickalert/widgets/quickalert_dialog.dart';
// import 'package:rentpropertymanage/interfaces/logging_interface.dart';
// import 'package:rentpropertymanage/update_interface/Maintains_nortification.dart';
// import 'package:rentpropertymanage/update_interface/add_House.dart';
// import 'package:rentpropertymanage/update_interface/add_car.dart';
// import 'package:rentpropertymanage/update_interface/add_property.dart';
// import 'package:rentpropertymanage/update_interface/more_property%20details_button.dart';
// import 'package:rentpropertymanage/update_interface/view_property.dart';

// //import 'package:flutter_application_1/Screens/Add_room_Screen.dart';
// //import 'package:flutter_application_1/Screens/Add_Vehicle_screen.dart';
// //import 'package:flutter_application_1/Screens/Add_house_screen.dart';
// //import 'package:flutter_application_1/Screens/property_list_screen.dart';
// //import 'package:flutter_application_1/Screens/buttons.dart';

// class owner_dashboard extends StatelessWidget {
//   owner_dashboard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF000025c),
//       body: Container(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 CircleAvatar(
//                   radius: 26,
//                   backgroundImage: AssetImage('assets/images/profile_1.jpg'),
//                 ),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Text(
//                   'Hi Amy',
//                   style: TextStyle(
//                     color: Color(0xFFe1f5fe),
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                 ),
//                 SizedBox(
//                   width: 160,
//                 ),
//                 IconButton(
//                   icon: const Icon(
//                     Icons.logout_rounded,
//                     color: Colors.white70,
//                   ),
//                   onPressed: () {
//                     QuickAlert.show(
//                       context: context,
//                       type: QuickAlertType.confirm,
//                       text: 'Do you want to logout',
//                       confirmBtnText: 'Yes',
//                       cancelBtnText: 'No',
//                       confirmBtnColor: Colors.green,
//                       onConfirmBtnTap: () {
//                         FirebaseAuth.instance.signOut();
//                         Navigator.of(context).pushReplacement(MaterialPageRoute(
//                           builder: (context) => const logging_interface(),
//                         ));
//                       },
//                     );
//                   },
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 25,
//             ),
//             CupertinoSearchTextField(
//               decoration: BoxDecoration(
//                 color: Color(0xFF000025c),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//             SizedBox(
//               height: 25,
//             ),
//             Container(
//               width: 340,
//               height: 240,
//               padding:
//                   EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
//               decoration: BoxDecoration(
//                   //color: Color(0xFF4fc3f7),
//                   borderRadius: BorderRadius.circular(20),
//                   gradient: LinearGradient(
//                     colors: [
//                       Color(0xFF000076),
//                       Color(0xFF0000a4),
//                     ],
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                   )),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Text(
//                         'Rent',
//                         style: TextStyle(
//                           color: Color(0xFFffffff),
//                           fontWeight: FontWeight.normal,
//                           fontSize: 20,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 170,
//                       ),
//                       Container(
//                         padding: EdgeInsets.only(left: 5, right: 5),
//                         width: 80,
//                         height: 20,
//                         decoration: BoxDecoration(
//                             color: Color(0xFF000076),
//                             borderRadius: BorderRadius.circular(7),
//                             border:
//                                 Border.all(color: Colors.white, width: 1.0)),
//                         child: Text(
//                           '12, Feb',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.white,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     'Total rent for February',
//                     textAlign: TextAlign.left,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.normal,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     'Rs 185000',
//                     textAlign: TextAlign.left,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.normal,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   LinearPercentIndicator(
//                     width: 300.0,
//                     lineHeight: 20.0,
//                     percent: 0.72,
//                     backgroundColor: Color.fromARGB(255, 98, 116, 238),
//                     progressColor: Color.fromARGB(255, 0, 251, 255),
//                   ),
//                   SizedBox(
//                     height: 8,
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         'Collected',
//                         style: TextStyle(
//                           color: Color.fromARGB(255, 0, 251, 255),
//                           fontWeight: FontWeight.normal,
//                           fontSize: 16,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 170,
//                       ),
//                       Text(
//                         'Pending',
//                         style: TextStyle(
//                           color: Color.fromARGB(255, 98, 116, 238),
//                           fontWeight: FontWeight.normal,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 4,
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         'Rs 133200',
//                         style: TextStyle(
//                           color: Color(0xFFffffff),
//                           fontWeight: FontWeight.normal,
//                           fontSize: 16,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 145,
//                       ),
//                       Text(
//                         'RS. 51800',
//                         style: TextStyle(
//                           color: Color(0xFFffffff),
//                           fontWeight: FontWeight.normal,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Text(
//               'Add Property',
//               style: TextStyle(
//                 color: Color.fromARGB(255, 255, 255, 255),
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20,
//               ),
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 MPD_button(
//                   iconImagePath: 'assets/images/home_add.png',
//                   buttonText: 'home',
//                   onTapvar: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => add_hosue()));
//                   },
//                 ),
//                 MPD_button(
//                   iconImagePath: 'assets/images/car_add.png',
//                   buttonText: 'Vehicle',
//                   onTapvar: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => add_car()));
//                   },
//                 ),
//                 MPD_button(
//                   iconImagePath: 'assets/images/room_add.png',
//                   buttonText: 'Room',
//                   onTapvar: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => add_property()));
//                   },
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 InkWell(
//                     splashColor: Color.fromARGB(255, 211, 204, 204),
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => view_properties()));
//                     },
//                     child: Stack(
//                       children: [
//                         Ink.image(
//                           image: AssetImage('assets/images/new_pro.jpg'),
//                           width: 140,
//                           height: 140,
//                           fit: BoxFit.cover,
//                         ),
//                         Positioned(
//                           bottom: 2,
//                           left: 2,
//                           child: Text(
//                             'View Property',
//                             style: TextStyle(
//                               fontSize: 20,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     )),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 InkWell(
//                     splashColor: Color.fromARGB(255, 211, 204, 204),
//                     onTap: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => maintain()));
//                     },
//                     child: Stack(
//                       children: [
//                         Ink.image(
//                           image: AssetImage('assets/images/read_letter.jpg'),
//                           width: 140,
//                           height: 140,
//                           fit: BoxFit.cover,
//                         ),
//                         Positioned(
//                           bottom: 2,
//                           left: 15,
//                           child: Text(
//                             'View Alerts',
//                             style: TextStyle(
//                               fontSize: 20,
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     )),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
//import 'package:quick_alert/quick_alert.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:rentpropertymanage/interfaces/logging_interface.dart';
import 'package:rentpropertymanage/update_interface/Maintains_nortification.dart';
import 'package:rentpropertymanage/update_interface/add_House.dart';
import 'package:rentpropertymanage/update_interface/add_car.dart';
import 'package:rentpropertymanage/update_interface/add_property.dart';
import 'package:rentpropertymanage/update_interface/more_property%20details_button.dart';
import 'package:rentpropertymanage/update_interface/view_property.dart';

class owner_dashboard extends StatelessWidget {
  owner_dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    String uid = user!.uid;
    return FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('users').doc(uid).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            String userName = snapshot.data!['name'];
            return SafeArea(
              child: Scaffold(
                backgroundColor: Color(0xFF000025c),
                body: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 26,
                            backgroundImage:
                                AssetImage('assets/images/profile_1.jpg'),
                          ),
                          // SizedBox(
                          //   width: 6,
                          // ),
                          Text(
                            'Hi $userName',
                            style: TextStyle(
                              color: Color(0xFFe1f5fe),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            width: 160,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.logout_rounded,
                              color: Colors.white70,
                            ),
                            onPressed: () {
                              QuickAlert.show(
                                context: context,
                                type: QuickAlertType.confirm,
                                text: 'Do you want to logout',
                                confirmBtnText: 'Yes',
                                cancelBtnText: 'No',
                                confirmBtnColor: Colors.green,
                                onConfirmBtnTap: () {
                                  FirebaseAuth.instance.signOut();
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                    builder: (context) =>
                                        const logging_interface(),
                                  ));
                                },
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      CupertinoSearchTextField(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(195, 25, 26, 86),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        width: 340,
                        height: 240,
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 20, right: 20),
                        decoration: BoxDecoration(
                            //color: Color(0xFF4fc3f7),
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF000076),
                                Color(0xFF0000a4),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            )),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Rent',
                                  style: TextStyle(
                                    color: Color(0xFFffffff),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: 170,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  width: 80,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF000076),
                                      borderRadius: BorderRadius.circular(7),
                                      border: Border.all(
                                          color: Colors.white, width: 1.0)),
                                  child: Text(
                                    '12, Feb',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Total rent for February',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Rs 185000',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            LinearPercentIndicator(
                              width: 300.0,
                              lineHeight: 20.0,
                              percent: 0.72,
                              backgroundColor:
                                  Color.fromARGB(255, 98, 116, 238),
                              progressColor: Color.fromARGB(255, 0, 251, 255),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Collected',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 251, 255),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: 170,
                                ),
                                Text(
                                  'Pending',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 98, 116, 238),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Rs 133200',
                                  style: TextStyle(
                                    color: Color(0xFFffffff),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: 145,
                                ),
                                Text(
                                  'RS. 51800',
                                  style: TextStyle(
                                    color: Color(0xFFffffff),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Add Property',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MPD_button(
                            iconImagePath: 'assets/images/home_add.png',
                            buttonText: 'home',
                            onTapvar: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => add_hosue()));
                            },
                          ),
                          MPD_button(
                            iconImagePath: 'assets/images/car_add.png',
                            buttonText: 'Vehicle',
                            onTapvar: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => add_car()));
                            },
                          ),
                          MPD_button(
                            iconImagePath: 'assets/images/room_add.png',
                            buttonText: 'Room',
                            onTapvar: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => add_property()));
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              splashColor: Color.fromARGB(255, 211, 204, 204),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            view_properties()));
                              },
                              child: Stack(
                                children: [
                                  Ink.image(
                                    image:
                                        AssetImage('assets/images/new_pro.jpg'),
                                    width: 140,
                                    height: 140,
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    bottom: 2,
                                    left: 2,
                                    child: Text(
                                      'View Property',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(
                            width: 30,
                          ),
                          InkWell(
                              splashColor: Color.fromARGB(255, 211, 204, 204),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => maintain()));
                              },
                              child: Stack(
                                children: [
                                  Ink.image(
                                    image: AssetImage(
                                        'assets/images/read_letter.jpg'),
                                    width: 140,
                                    height: 140,
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    bottom: 2,
                                    left: 15,
                                    child: Text(
                                      'View Alerts',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        });
  }
}
