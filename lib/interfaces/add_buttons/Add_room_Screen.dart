import 'package:flutter/material.dart';
import 'package:property_management_app/interfaces/HomeScreenTenant.dart';

final formKey = GlobalKey<FormState>();

class Add_room_Screen extends StatelessWidget {
  const Add_room_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Add Room',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 13, 43, 68),
          leading: IconButton(
            onPressed: () {},
            icon: IconButton(
              icon: const Icon(Icons.cancel),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeScreenTenant()));
              },
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Color(0xFF19173d),
        body: Container(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Form(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 600 * 0.02),
              Text(
                "Add Room",
                style: TextStyle(fontSize: 24, color: Colors.amber),
              ),
              SizedBox(height: 600 * 0.04),
              TextFormField(
                style: TextStyle(fontSize: 14, color: Color(0xFFffffff)),
                decoration: InputDecoration(
                    labelText: 'Address line 1',
                    labelStyle: TextStyle(
                        fontSize: 14,
                        color: const Color.fromARGB(255, 255, 255, 255))),
              ),
              SizedBox(height: 600 * 0.03),
              TextFormField(
                style: TextStyle(fontSize: 14, color: Color(0xFFffffff)),
                decoration: InputDecoration(
                    labelText: 'Address line 2',
                    labelStyle: TextStyle(
                        fontSize: 14,
                        color: const Color.fromARGB(255, 255, 255, 255))),
              ),
              SizedBox(height: 600 * 0.03),
              TextFormField(
                style: TextStyle(fontSize: 14, color: Color(0xFFffffff)),
                decoration: InputDecoration(
                    labelText: 'City',
                    labelStyle: TextStyle(
                        fontSize: 14,
                        color: const Color.fromARGB(255, 255, 255, 255))),
              ),
              SizedBox(height: 600 * 0.03),
              TextFormField(
                style: TextStyle(fontSize: 14, color: Color(0xFFffffff)),
                decoration: InputDecoration(
                    labelText: 'Post code',
                    labelStyle: TextStyle(
                        fontSize: 14,
                        color: const Color.fromARGB(255, 255, 255, 255))),
              ),
              SizedBox(height: 600 * 0.03),
              TextFormField(
                style: TextStyle(fontSize: 14, color: Color(0xFFffffff)),
                decoration: InputDecoration(
                    labelText: 'Area (sq ft/m)',
                    labelStyle: TextStyle(
                        fontSize: 14,
                        color: const Color.fromARGB(255, 255, 255, 255))),
              ),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      minimumSize: Size(80, 30),
                      primary: Color.fromARGB(255, 255, 255, 255),
                      side: BorderSide(width: 3, color: Colors.white)),
                  child: Text(
                    'Save',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 252, 252, 252)),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => const CustomDialogWidget());
                  })
            ],
          )),
        ));
  }
}

class CustomDialogWidget extends StatelessWidget {
  const CustomDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Details Saved successfully!",
                style: TextStyle(fontSize: 20, color: Color(0xFF19173d))),
            Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/icon.jpg'), fit: BoxFit.cover)),
            ),
          ],
        ),
      ),
    );
  }
}
