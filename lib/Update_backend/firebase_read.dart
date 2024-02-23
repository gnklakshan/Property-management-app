import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Readlistview extends StatefulWidget {
  const Readlistview({super.key});

  @override
  State<Readlistview> createState() => _ReadlistviewState();
}

class _ReadlistviewState extends State<Readlistview> {
  final _userStream =
      FirebaseFirestore.instance.collection('test_collection').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('READ DATA FORM FIREBASE'),
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
                  leading: Icon(Icons.person),
                  title: Text(docs[index]['name']),
                  subtitle: Text('${docs[index]['age']} years old'),
                );
              });
        },
      ),
    );
  }
}
