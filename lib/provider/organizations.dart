import 'dart:math';

import 'package:flutter/cupertino.dart';
import '../data/dummy_organizations.dart';

import '../models/Organization.dart';

class Organizations with ChangeNotifier {
  final Map<String, Organization> _itens = {...DUMMY_ORGANIZATIONS};

  List<Organization> get all {
    return [..._itens.values];
  }

  int get count {
    return _itens.length;
  }

  Organization byIndex(int i) {
    return _itens.values.elementAt(i);
  }

  void put(Organization org) {
    if (org == null) {
      return;
    }

    // alterar
    if (org.id != null &&
        org.id.trim().isNotEmpty &&
        _itens.containsKey(org.id)) {
      _itens.update(
        org.id,
        (_) => Organization(
            id: org.id,
            name: org.name,
            email: org.email,
            cnpj: org.cnpj,
            description: org.description,
            sector: org.sector,
            avatarUrl: org.avatarUrl,
            method: org.method,
            hasExperienceWithAgile: org.hasExperienceWithAgile),
      );
    } else {
      // adicionar
      final id = Random().nextDouble().toString();
      _itens.putIfAbsent(
        id,
        () => Organization(
          id: id,
          name: org.name,
          email: org.email,
          cnpj: org.cnpj,
          description: org.description,
          sector: org.sector,
          avatarUrl: org.avatarUrl,
          method: org.method,
          hasExperienceWithAgile: org.hasExperienceWithAgile,
        ),
      );
    }
    notifyListeners();
  }

  void remove(Organization org) {
    if (org != null && org.id != null) {
      _itens.remove(org.id);
      notifyListeners();
    }
  }
}
