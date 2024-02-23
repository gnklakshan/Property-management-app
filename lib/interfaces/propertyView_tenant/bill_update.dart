import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart'; // Add this import for DateFormat
import 'package:quickalert/quickalert.dart';

Future<void> billadded(BuildContext context) async {
  String? heading;
  late String uid;
  String details = ''; // Initialize PIN as empty string
  String billMonth = '';
  TextEditingController detailsController = TextEditingController();
  TextEditingController headingController = TextEditingController();
  TextEditingController billMonthController = TextEditingController();

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

  final picker = ImagePicker();
  XFile? image;
  bool isImagePickerOpen = false;

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: SingleChildScrollView(
          child: AlertDialog(
            backgroundColor: Color.fromARGB(255, 199, 175, 244),
            title: Text('Upload Bill Details'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: headingController,
                  decoration: InputDecoration(
                    labelText: 'Type  Of Bill',
                  ),
                  onChanged: (value) {
                    heading = value;
                  },
                ),
                SizedBox(height: 10),
                TextField(
                  controller: detailsController,
                  decoration: InputDecoration(
                    labelText: 'Description(If any)',
                  ),
                  onChanged: (value) {
                    details = value;
                  },
                ),
                SizedBox(height: 10),
                TextField(
                  controller: billMonthController,
                  decoration: InputDecoration(
                    labelText: 'Bill Month',
                    hintText: 'Eg : January',
                  ),
                  onChanged: (value) {
                    billMonth = value;
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    if (!isImagePickerOpen) {
                      isImagePickerOpen = true;
                      final pickedImage =
                          await picker.pickImage(source: ImageSource.gallery);
                      isImagePickerOpen = false;
                      if (pickedImage != null) {
                        image = XFile(pickedImage.path);
                      }
                    }
                  },
                  child: Text('Upload Bill Image'),
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
                      .collection('Bill')
                      .doc(ran_DocId)
                      .set({
                    'Type': heading,
                    'note': details,
                    'billMonth': billMonth,
                    'imageURL': image != null ? image!.path : null,
                  });
                  Navigator.of(context).pop();

                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.success,
                    text: 'complain added Successfully!',
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
