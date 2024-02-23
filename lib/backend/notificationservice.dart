import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Add this import for DateFormat
import 'package:quickalert/quickalert.dart';

Future<void> opendialognotifi(BuildContext context) async {
  String? heading;
  late String uid;
  String details = ''; // Initialize PIN as empty string
  String owner = '';
  String date = '';
  String time = '';
  TextEditingController ownerController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController headingController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  User? user = auth.currentUser;
  // get random document ID
  String ran_DocId = FirebaseFirestore.instance
      .collection('users')
      .doc('Location')
      .collection('properties')
      .doc()
      .id;

  if (user != null) {
    uid = user.uid;
    print('The UID of the current user is: $uid');
  } else {
    print('No user currently signed in.');
  }

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: SingleChildScrollView(
          child: AlertDialog(
            backgroundColor: Color.fromARGB(255, 199, 175, 244),
            title: Text('Complain Details'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: headingController,
                  decoration: InputDecoration(
                    labelText: 'Complain in Brief',
                  ),
                  onChanged: (value) {
                    heading = value;
                  },
                ),
                SizedBox(height: 10),
                TextField(
                  controller: detailsController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                  ),
                  onChanged: (value) {
                    details = value;
                  },
                ),
                SizedBox(height: 10),
                TextField(
                  controller: ownerController,
                  decoration: InputDecoration(
                    labelText: 'Owner Name',
                  ),
                  onChanged: (value) {
                    owner = value;
                  },
                ),
                SizedBox(height: 10),
                TextField(
                  controller: dateController,
                  decoration: InputDecoration(
                    labelText: 'Date',
                    hintText: 'DD/MM/YYYY',
                  ),
                  onChanged: (value) {
                    date = value;
                  },
                ),
                SizedBox(height: 10),
                TextField(
                  controller: timeController,
                  decoration: InputDecoration(
                    labelText: 'time',
                    hintText: 'hh:mm',
                  ),
                  onChanged: (value) {
                    time = value;
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
                  String name1 = headingController.text;
                  FirebaseFirestore.instance
                      .collection('notifications')
                      .doc(ran_DocId)
                      .set({
                    'heading': heading,
                    'note': details,
                    'owner': owner,
                    'date': date,
                    'time': time,
                  });
                  Navigator.of(context).pop();

                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.success,
                    text: ' complain added Successfully!',
                  );
                },
                child: Text('ADD'),
              ),
            ],
          ),
        ),
      );
    },
  );
}
