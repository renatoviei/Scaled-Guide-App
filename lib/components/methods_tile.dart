import 'package:flutter/material.dart';

import '../models/Method.dart';

class MethodsTile extends StatelessWidget {
  final Method method;

  const MethodsTile(this.method);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        method.name,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.orange,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato',
        ),
      ),
      subtitle: Text(method.shortDescription),
      onTap: () {},
    );
  }
}
