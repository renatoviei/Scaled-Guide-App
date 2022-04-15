import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../models/Organization.dart';

class Organizations with ChangeNotifier {
  final CollectionReference organizationsCollection =
      FirebaseFirestore.instance.collection('organizations');

  List<Organization> _orgListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Organization(
        id: doc.id,
        userId: doc['userId'] ?? ' ',
        name: doc['name'] ?? ' ',
        email: doc['email'] ?? ' ',
        cnpj: doc['cnpj'] ?? ' ',
        description: doc['description'] ?? ' ',
        sector: doc['sector'] ?? ' ',
        avatarUrl: doc['avatarUrl'] ?? ' ',
        method: doc['method'] ?? ' ',
        hasExperienceWithAgile: doc['hasExperienceWithAgile'] ?? false,
      );
    }).toList();
  }

  Stream<List<Organization>> get organizations {
    return organizationsCollection.snapshots().map(_orgListFromSnapshot);
  }

  Future put(Organization org) async {
    if (org == null) {
      return;
    }

    if (org.id == ' ') {
      return await organizationsCollection.doc().set({
        'userId': org.userId,
        'name': org.name,
        'email': org.email,
        'cnpj': org.cnpj,
        'description': org.description,
        'sector': org.sector,
        'avatarUrl': org.avatarUrl,
        'method': org.method,
        'hasExperienceWithAgile': org.hasExperienceWithAgile
      });
    } else {
      return await organizationsCollection.doc(org.id).set({
        'userId': org.userId,
        'name': org.name,
        'email': org.email,
        'cnpj': org.cnpj,
        'description': org.description,
        'sector': org.sector,
        'avatarUrl': org.avatarUrl,
        'method': org.method,
        'hasExperienceWithAgile': org.hasExperienceWithAgile
      });
    }
  }

  void remove(Organization org) async {
    if (org != null && org.id != null) {
      return await organizationsCollection.doc(org.id).delete();
    }
  }
}
