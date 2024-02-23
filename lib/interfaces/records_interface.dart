import 'package:flutter/material.dart';

class record_interface extends StatelessWidget {
  static String routeName = "/profile";

  const record_interface({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 25, 23, 61),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Financial Records",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Column(
          children: [
            Card(
              color: Color.fromARGB(137, 255, 255, 255),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: ListTile(
                title: Text(
                  'Paid Rs:45000.00 to home1',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'You have successfully paid to the home1\nAmount    : Rs.45000.00\nDate          : 2024/02/23',
                  style: TextStyle(color: Color.fromARGB(255, 11, 36, 134)),
                ),
              ),
            ),
            // to Add other cards copy above card block and chnge strings
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(25, 23, 61, 1),
    );
  }
}
