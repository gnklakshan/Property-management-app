// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:quickalert/quickalert.dart';

// // Future<void> opendialog(BuildContext context, String propertyname) async {
// //   String? name;
// //   late String uid;
// //   String pin = ''; // Initialize PIN as empty string
// //   TextEditingController startDateController = TextEditingController();
// //   TextEditingController endDateController = TextEditingController();
// //   TextEditingController nameController = TextEditingController();

// //   FirebaseAuth auth = FirebaseAuth.instance;
// //   User? user = auth.currentUser;
// //   // getrandom document ID
// //   String ran_DocId = FirebaseFirestore.instance
// //       .collection('users')
// //       .doc('Location')
// //       .collection('properties')
// //       .doc()
// //       .id;

// //   if (user != null) {
// //     uid = user.uid;
// //     print('The UID of the current user is: $uid');
// //   } else {
// //     print('No user currently signed in.');
// //   }

// //   await showDialog(
// //     context: context,
// //     builder: (BuildContext context) {
// //       return Center(
// //         child: SingleChildScrollView(
// //           child: AlertDialog(
// //             backgroundColor: Color.fromARGB(255, 199, 175, 244),
// //             title: Text('Enter $propertyname Details'),
// //             content: Column(
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 TextField(
// //                   controller: nameController,
// //                   decoration: InputDecoration(
// //                     labelText: 'Property Name',
// //                   ),
// //                   onChanged: (value) {
// //                     name = value;
// //                   },
// //                 ),
// //                 SizedBox(height: 10),
// //                 Row(
// //                   children: [
// //                     Expanded(
// //                       child: TextField(
// //                         keyboardType: TextInputType.number,
// //                         maxLength: 4, // Set the maximum length to 4 digits
// //                         decoration: const InputDecoration(
// //                           labelText: 'PIN',
// //                         ),
// //                         onChanged: (value) {
// //                           pin = value; // Update the PIN
// //                         },
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //                 SizedBox(height: 10),
// //                 TextField(
// //                   decoration: InputDecoration(
// //                     labelText: 'Start Date',
// //                     hintText: 'YYYY-MM-DD',
// //                     suffixIcon: IconButton(
// //                       onPressed: () async {
// //                         final selectedDate = await showDatePicker(
// //                           context: context,
// //                           initialDate: DateTime.now(),
// //                           firstDate: DateTime(2022),
// //                           lastDate: DateTime(2025),
// //                         );
// //                         if (selectedDate != null) {
// //                           startDateController.text =
// //                               selectedDate.toString().split(' ')[0];
// //                         }
// //                       },
// //                       icon: Icon(Icons.calendar_today),
// //                     ),
// //                   ),
// //                   controller: startDateController,
// //                 ),
// //                 SizedBox(height: 10),
// //                 TextField(
// //                   decoration: InputDecoration(
// //                     labelText: 'End Date',
// //                     hintText: 'YYYY-MM-DD',
// //                     suffixIcon: IconButton(
// //                       onPressed: () async {
// //                         final selectedDate = await showDatePicker(
// //                           context: context,
// //                           initialDate: DateTime.now(),
// //                           firstDate: DateTime(2022),
// //                           lastDate: DateTime(2025),
// //                         );
// //                         if (selectedDate != null) {
// //                           endDateController.text =
// //                               selectedDate.toString().split(' ')[0];
// //                         }
// //                       },
// //                       icon: Icon(Icons.calendar_today),
// //                     ),
// //                   ),
// //                   controller: endDateController,
// //                 ),
// //               ],
// //             ),
// //             actions: <Widget>[
// //               TextButton(
// //                 onPressed: () {
// //                   Navigator.of(context).pop();
// //                 },
// //                 child: Text('Cancel'),
// //               ),
// //               ElevatedButton(
// //                 onPressed: () async {
// //                   String name1 = nameController.text;
// //                   FirebaseFirestore.instance
// //                       .collection('users')
// //                       .doc(uid)
// //                       .collection('properties')
// //                       .doc(ran_DocId)
// //                       .set({
// //                     'name': name1,
// //                     'endDate': endDateController.text,
// //                     'startDate': startDateController.text,
// //                     'ispaid': true,
// //                   });
// //                   Navigator.of(context).pop();

// //                   QuickAlert.show(
// //                     context: context,
// //                     type: QuickAlertType.success,
// //                     text: ' $name1 added Successfully!',
// //                   );
// //                 },
// //                 child: Text('ADD'),
// //               ),
// //             ],
// //           ),
// //         ),
// //       );
// //     },
// //   );
// // }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart'; // Add this import for DateFormat
// import 'package:quickalert/quickalert.dart';

// Future<void> opendialog(BuildContext context, String propertyname) async {
//   String? name;
//   late String uid;
//   String pin = ''; // Initialize PIN as empty string
//   TextEditingController startDateController = TextEditingController();
//   TextEditingController endDateController = TextEditingController();
//   TextEditingController nameController = TextEditingController();

//   FirebaseAuth auth = FirebaseAuth.instance;
//   User? user = auth.currentUser;
//   // get random document ID
//   String ran_DocId = FirebaseFirestore.instance
//       .collection('users')
//       .doc('Location')
//       .collection('properties')
//       .doc()
//       .id;

//   if (user != null) {
//     uid = user.uid;
//     print('The UID of the current user is: $uid');
//   } else {
//     print('No user currently signed in.');
//   }

//   await showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return Center(
//         child: SingleChildScrollView(
//           child: AlertDialog(
//             backgroundColor: Color.fromARGB(255, 199, 175, 244),
//             title: Text('Enter $propertyname Details'),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextField(
//                   controller: nameController,
//                   decoration: InputDecoration(
//                     labelText: 'Property Name',
//                   ),
//                   onChanged: (value) {
//                     name = value;
//                   },
//                 ),
//                 SizedBox(height: 10),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: TextField(
//                         keyboardType: TextInputType.number,
//                         maxLength: 4, // Set the maximum length to 4 digits
//                         decoration: const InputDecoration(
//                           labelText: 'PIN',
//                         ),
//                         onChanged: (value) {
//                           pin = value; // Update the PIN
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//                 TextField(
//                   decoration: InputDecoration(
//                     labelText: 'Start Date',
//                     hintText: 'DD/MM/YYYY',
//                     suffixIcon: IconButton(
//                       onPressed: () async {
//                         final selectedDate = await showDatePicker(
//                           context: context,
//                           initialDate: DateTime.now(),
//                           firstDate: DateTime(2022),
//                           lastDate: DateTime(2025),
//                         );
//                         if (selectedDate != null) {
//                           startDateController.text =
//                               DateFormat('dd-MM-yyyy').format(selectedDate);
//                         }
//                       },
//                       icon: Icon(Icons.calendar_today),
//                     ),
//                   ),
//                   controller: startDateController,
//                 ),
//                 SizedBox(height: 10),
//                 TextField(
//                   decoration: InputDecoration(
//                     labelText: 'End Date',
//                     hintText: 'DD/MM/YYYY',
//                     suffixIcon: IconButton(
//                       onPressed: () async {
//                         final selectedDate = await showDatePicker(
//                           context: context,
//                           initialDate: DateTime.now(),
//                           firstDate: DateTime(2022),
//                           lastDate: DateTime(2025),
//                         );
//                         if (selectedDate != null) {
//                           endDateController.text =
//                               DateFormat('dd-MM-yyyy').format(selectedDate);
//                         }
//                       },
//                       icon: Icon(Icons.calendar_today),
//                     ),
//                   ),
//                   controller: endDateController,
//                 ),
//               ],
//             ),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('Cancel'),
//               ),
//               ElevatedButton(
//                 onPressed: () async {
//                   String name1 = nameController.text;
//                   FirebaseFirestore.instance
//                       .collection('users')
//                       .doc(uid)
//                       .collection('properties')
//                       .doc(ran_DocId)
//                       .set({
//                     'name': name1,
//                     'endDate': endDateController.text,
//                     'startDate': startDateController.text,
//                     'ispaid': true,
//                   });
//                   Navigator.of(context).pop();

//                   QuickAlert.show(
//                     context: context,
//                     type: QuickAlertType.success,
//                     text: ' $name1 added Successfully!',
//                   );
//                 },
//                 child: Text('ADD'),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Add this import for DateFormat
import 'package:quickalert/quickalert.dart';

class PropertyDetailsDialog extends StatefulWidget {
  final String propertyname;

  PropertyDetailsDialog({required this.propertyname});

  @override
  _PropertyDetailsDialogState createState() => _PropertyDetailsDialogState();
}

class _PropertyDetailsDialogState extends State<PropertyDetailsDialog> {
  late String name;
  late String uid;
  late String pin;
  late TextEditingController startDateController;
  late TextEditingController endDateController;
  late TextEditingController nameController;
  late bool isPaid;

  @override
  void initState() {
    super.initState();
    name = '';
    pin = '';
    startDateController = TextEditingController();
    endDateController = TextEditingController();
    nameController = TextEditingController();
    isPaid = false;

    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user != null) {
      uid = user.uid;
      print('The UID of the current user is: $uid');
    } else {
      print('No user currently signed in.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          backgroundColor: Color.fromARGB(255, 199, 175, 244),
          title: Text('Enter ${widget.propertyname} Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Property Name',
                ),
                onChanged: (value) {
                  name = value;
                },
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      maxLength: 4,
                      decoration: const InputDecoration(
                        labelText: 'PIN',
                      ),
                      onChanged: (value) {
                        pin = value;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Start Date',
                  hintText: 'DD/MM/YYYY',
                  suffixIcon: IconButton(
                    onPressed: () async {
                      final selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2022),
                        lastDate: DateTime(2025),
                      );
                      if (selectedDate != null) {
                        startDateController.text =
                            DateFormat('dd-MM-yyyy').format(selectedDate);
                      }
                    },
                    icon: Icon(Icons.calendar_today),
                  ),
                ),
                controller: startDateController,
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'End Date',
                  hintText: 'DD/MM/YYYY',
                  suffixIcon: IconButton(
                    onPressed: () async {
                      final selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2022),
                        lastDate: DateTime(2025),
                      );
                      if (selectedDate != null) {
                        endDateController.text =
                            DateFormat('dd-MM-yyyy').format(selectedDate);
                      }
                    },
                    icon: Icon(Icons.calendar_today),
                  ),
                ),
                controller: endDateController,
              ),
              SizedBox(height: 10),
              CheckboxListTile(
                title: Text('Is Paid'),
                value: isPaid,
                onChanged: (newValue) {
                  setState(() {
                    isPaid = newValue!;
                  });
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                String name1 = nameController.text;
                FirebaseFirestore.instance
                    .collection('users')
                    .doc(uid)
                    .collection('properties')
                    .doc()
                    .set({
                  'name': name1,
                  'endDate': endDateController.text,
                  'startDate': startDateController.text,
                  'ispaid': isPaid,
                  'property type': widget.propertyname,
                });
                Navigator.of(context).pop();

                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.success,
                  text: ' $name1 added Successfully!',
                );
              },
              child: Text('ADD'),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> opendialog(BuildContext context, String propertyname) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return PropertyDetailsDialog(propertyname: propertyname);
    },
  );
}
