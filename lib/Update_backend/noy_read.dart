import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rentpropertymanage/update_interface/owner_dashboard.dart';

class Notificationlistview extends StatefulWidget {
  const Notificationlistview({super.key});

  @override
  State<Notificationlistview> createState() => _Not_ReadlistviewState();
}

class _Not_ReadlistviewState extends State<Notificationlistview> {
  final _userStream =
      FirebaseFirestore.instance.collection('notifications').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000025c),
      appBar: AppBar(
        title: const Text(
          'Tenant Note',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF000025c),
        leading: IconButton(
          onPressed: () {},
          icon: IconButton(
            icon: const Icon(Icons.arrow_circle_left_rounded),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => owner_dashboard()));
            },
            color: Colors.white,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: _userStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Connection Error');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading...');
          }
          var docs = snapshot.data!.docs;
          //return Text('${docs.length}');
          return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  tileColor: Color.fromARGB(255, 18, 11, 154),
                  contentPadding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.white, width: 0.5)),
                  onTap: () {},
                  title: Text(
                    docs[index]['heading'],
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 0, 251, 255),
                    ),
                  ),
                  subtitle: Text(
                    '${docs[index]['note']} \n\n                                                                   Date: ${docs[index]['date']}\n                                                                   Time: ${docs[index]['time']}',
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                );
              });
        },
      ),
    );
  }
}
