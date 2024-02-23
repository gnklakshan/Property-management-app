// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:rentpropertymanage/interfaces/propertyView_tenant/rentpropertyview.dart';
// import 'interfaces/logging_interface.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'interfaces/appframe.dart';

// // void main() async {
// //   //initialize firebase
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await Firebase.initializeApp();

// //   //Run the application
// //   runApp(const MyApp());
// // }

// void main() async {
//   //initialize firebase
//   WidgetsFlutterBinding.ensureInitialized();
//   Platform.isAndroid
//       ? await Firebase.initializeApp(
//           options: const FirebaseOptions(
//               apiKey: 'AIzaSyBowOU8WxX235W_Yh5a9tNcTRxmbK04uN8',
//               appId: '1:548605842763:android:3a9383d446db2bc60dc4ce',
//               messagingSenderId: '548605842763',
//               projectId: 'rent-property-management-5b72c'))
//       : await Firebase.initializeApp();

//   //Run the application
//   runApp(const MyApp());
// }

// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   try {
// //     await Firebase.initializeApp();
// //     runApp(const MyApp());
// //   } catch (e) {
// //     print('Error initializing Firebase: $e');
// //     // Handle initialization error, e.g., show an error dialog or log the error
// //   }
// // }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//         debugShowCheckedModeBanner: false, home: logging_interface());
//     //home: PropertyDetails());
//     // home: owner_dashboard());
//   }
// }

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rentpropertymanage/interfaces/propertyView_tenant/rentpropertyview_house_room.dart';
import 'interfaces/logging_interface.dart';
import 'package:firebase_core/firebase_core.dart';
import 'interfaces/appframe.dart';

// void main() async {
//   //initialize firebase
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   //Run the application
//   runApp(const MyApp());
// }

void main() async {
  //initialize firebase
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyBowOU8WxX235W_Yh5a9tNcTRxmbK04uN8',
              appId: '1:548605842763:android:3a9383d446db2bc60dc4ce',
              messagingSenderId: '548605842763',
              projectId: 'rent-property-management-5b72c'))
      : await Firebase.initializeApp();

  //Run the application
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: logging_interface());
    //home: PropertyDetails());
    // home: owner_dashboard());
  }
}
