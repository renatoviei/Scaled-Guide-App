import 'package:flutter/material.dart';

import '../components/methods_tile.dart';
import '../provider/methods.dart';

class MethodsList {
  Widget buildListAgileMethods(Methods method) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text("Scaled Agile Frameworks",
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lato',
              )),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: method.count,
            itemBuilder: (ctx, i) => MethodsTile(method.byIndex(i)),
          ),
        ),
      ],
    );
  }
}
