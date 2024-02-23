import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rentpropertymanage/update_interface/cash_flow.dart';
import 'package:rentpropertymanage/update_interface/owner_dashboard.dart';

class Readlistview_con extends StatefulWidget {
  const Readlistview_con({super.key});

  @override
  State<Readlistview_con> createState() => _Readlistview_conState();
}

class _Readlistview_conState extends State<Readlistview_con> {
  final _userStream =
      FirebaseFirestore.instance.collection('Add_house').snapshots();
  final _roomStream =
      FirebaseFirestore.instance.collection('Add_room').snapshots();
  final _vehicleStream =
      FirebaseFirestore.instance.collection('Add_Vehicle').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000025c),
      appBar: AppBar(
        title: const Text(
          'Property List',
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
                  tileColor: Color.fromARGB(226, 32, 30, 78),
                  contentPadding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.white, width: 0.5)),
                  onTap: () {},
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(docs[index]['image']),
                  ),
                  title: Text(
                    'Address: ${docs[index]['Address']} \nCost: ${docs[index]['Price']}',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  subtitle: Text(
                    'Rented States: ${docs[index]['isRented']}',
                    style: TextStyle(color: Color.fromARGB(255, 12, 240, 38)),
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: IconButton(
                      icon: const Icon(Icons.navigate_next),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => cash_flow(
                                    buttonText: docs[index]['Address'],
                                    bed: docs[index]['no_of_room'],
                                    bath: docs[index]['no_of_bath'],
                                    image: docs[index]['image'],
                                    price: docs[index]['Price'])));
                      },
                      color: Color.fromARGB(255, 251, 251, 251),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
