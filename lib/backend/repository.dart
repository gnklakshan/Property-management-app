import 'package:cloud_firestore/cloud_firestore.dart';

void retrieveSubcollection() {
  FirebaseFirestore.instance.collection("users").get().then((value) {
    value.docs.forEach((result) {
      FirebaseFirestore.instance
          .collection("users")
          .doc(result.id) // Using result.id to get the document ID
          .collection("subcollection") // Reference to the subcollection
          .get()
          .then((subCollectionSnapshot) {
        subCollectionSnapshot.docs.forEach((subDocument) {
          // Access subcollection documents here
          print(subDocument.data());
        });
      });
    });
  });
}

void main() {
  retrieveSubcollection();
}
