import 'package:cloud_firestore/cloud_firestore.dart';

// class DatabaseService {
//   Future<Map<String, dynamic>> getUserDetails(String userId) async {
//     DocumentSnapshot userSnapshot =
//         await FirebaseFirestore.instance.collection('users').doc(userId).get();
//     return userSnapshot.data() as Map<String, dynamic>;
//   }

//   Future<List<String>> getDocIDsOfUserProperties(String userId) async {
//     QuerySnapshot propertySnapshot = await FirebaseFirestore.instance
//         .collection('users')
//         .doc(userId)
//         .collection('property')
//         .get();
//     return propertySnapshot.docs.map((doc) => doc.id).toList();
//   }

//   Future<Map<String, dynamic>> getPropertyDetailsForUser(
//       String userId, String propertyDocId) async {
//     DocumentSnapshot propertySnapshot = await FirebaseFirestore.instance
//         .collection('users')
//         .doc(userId)
//         .collection('properties')
//         .doc(propertyDocId)
//         .get();
//     return propertySnapshot.data() as Map<String, dynamic>;
//   }
// }

class Property {
  final String name;
  final String address;
  final String endDate;
  final String startDate;
  final bool ispaid;

  Property({
    required this.name,
    required this.address,
    required this.startDate,
    required this.endDate,
    required this.ispaid,
  });

  // tojason() {
  //   return {
  //     'name': this.name,
  //     'address': this.address,
  //     'startDate': this.startDate,
  //     'endDate': this.endDate.codeUnits,
  //     'ispaid': this.ispaid,
  //   };
  // }
}

Future<List<Property>> fetchProperties(String userId) async {
  List<Property> properties = [];

  try {
    QuerySnapshot propertySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('properties')
        .get();

    propertySnapshot.docs.forEach((doc) {
      properties.add(Property(
        name: doc['name'],
        address: doc['address'],
        startDate: doc['startDate'],
        endDate: doc['endDate'],
        ispaid: doc['ispaid'],
      ));
    });
  } catch (e) {
    print('Error fetching properties: $e');
  }

  return properties;
}
