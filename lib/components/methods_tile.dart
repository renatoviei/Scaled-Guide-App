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
      contentPadding: EdgeInsets.only(left: 15.0, right: 15.0, top:6.0 ,bottom: 2.0),
      title: Text(
        method.name,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.orange,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato',
        ),
      ),
      subtitle: Text(
        method.shortDescription,
        textAlign: TextAlign.justify,
      ),
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
