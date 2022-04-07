import 'package:flutter/cupertino.dart';
import '../data/dummy_methods.dart';
import '../models/Method.dart';

class Methods with ChangeNotifier {
  final Map<String, Method> _itens = {...DUMMY_METHODS};

  List<Method> get all {
    return [..._itens.values];
  }

  int get count {
    return _itens.length;
  }

  Method byIndex(int i) {
    return _itens.values.elementAt(i);
  }
}
