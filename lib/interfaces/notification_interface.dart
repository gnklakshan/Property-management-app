import 'package:flutter/material.dart';

class notification_interface extends StatelessWidget {
  static String routeName = "/profile";

  const notification_interface({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 25, 23, 61),
        title: Text(
          "notifications",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          //  back button
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,
              color: Colors.white), // Use white arrow back icon
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 0),
        child: Column(
          children: [
            Card(
              color: Color.fromARGB(137, 255, 255, 255),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: ListTile(
                leading: Icon(
                  Icons.warning,
                  color: Colors.red,
                ),
                title: Text(
                  'Update Profile details',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Please update your profile details before 10th of March',
                  style: TextStyle(color: Color.fromARGB(255, 11, 36, 134)),
                ),
              ),
            ),
            // Add other cards here...
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(25, 23, 61, 1),
    );
  }
}
