import 'package:flutter/material.dart';

import '../models/Method.dart';
import '../routes/app_routes.dart';
import '../views/detail_method.dart';

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
      onTap: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => DetailMethod(method),
          ),
          ModalRoute.withName(AppRoutes.HOME_TAB),
        );
      },
    );
  }
}
