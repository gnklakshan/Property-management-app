// import 'package:flutter/material.dart';

// class window_screen_test extends StatelessWidget {
//   const window_screen_test({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       backgroundColor: Color.fromARGB(255, 90, 90, 236),
//       body: Text('Owner interface'),
//     );
//   }
// }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:rentpropertymanage/backend/databaseservices.dart';

// class window_screen_test extends StatefulWidget {
//   const window_screen_test({super.key});

//   @override
//   State<window_screen_test> createState() => _window_screen_testState();
// }

// class _window_screen_testState extends State<window_screen_test> {
//   List<Property> properties = [];
//   late String uid;

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
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Color.fromARGB(255, 90, 90, 236),
//         body: Column(
//           children: [
//             Text('Owner interface'),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: properties.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(properties[index].name),
//                     subtitle: Text(properties[index].address),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// // }
// import 'package:flutter/material.dart';

// class window_screen_test extends StatelessWidget {
//   final String propertyName;
//   final String propertyDate;
//   final bool propertyIsPaid;
//   final String propertystartDate;
//   final String propertyendDate;

//   const window_screen_test({
//     required this.propertyName,
//     required this.propertyDate,
//     required this.propertyIsPaid,
//     required this.propertystartDate,
//     required this.propertyendDate,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Property Details')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Name: $propertyName', style: TextStyle(fontSize: 20)),
//             SizedBox(height: 10),
//             Text('Date: $propertyDate', style: TextStyle(fontSize: 20)),
//             SizedBox(height: 10),
//             Text(
//               'Paid: ${propertyIsPaid ? 'Yes' : 'No'}',
//               style: TextStyle(fontSize: 20),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class window_screen_test extends StatefulWidget {
  final String propertyName;
  final String propertyDate;
  final bool propertyIsPaid;
  final String propertystartDate;
  final String propertyendDate;

  const window_screen_test({
    required this.propertyName,
    required this.propertyDate,
    required this.propertyIsPaid,
    required this.propertystartDate,
    required this.propertyendDate,
  });

  @override
  State<StatefulWidget> createState() => _window_screen_testState();
}

class _window_screen_testState extends State<window_screen_test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Property Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${widget.propertyName}',
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Date: ${widget.propertyDate}',
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text(
              'Paid: ${widget.propertyIsPaid ? 'Yes' : 'No'}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
