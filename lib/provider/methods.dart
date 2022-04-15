import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../models/Method.dart';

class Methods with ChangeNotifier {
  final CollectionReference methodsCollection =
  FirebaseFirestore.instance.collection('methods');

  List<Method> _methodsListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Method(
        id: doc.id,
        name: doc['name'] ?? ' ',
        shortDescription: doc['shortDescription'] ?? ' ',
        description: doc['description'] ?? ' ',
      );
    }).toList();
  }

  Stream<List<Method>> get methods {
    return methodsCollection.snapshots().map(_methodsListFromSnapshot);
  }
}
