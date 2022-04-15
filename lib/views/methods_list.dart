import 'package:flutter/material.dart';

import '../components/methods_tile.dart';
import '../models/Method.dart';
import '../provider/methods.dart';
import '../shared/loading_tabview.dart';

class MethodsList {
  Widget buildListAgileMethods(List<Method> method) {
    return StreamBuilder<List<Method>>(
        stream: Methods().methods,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Method>? methods= snapshot.data;

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
                    itemCount: methods?.length,
                    itemBuilder: (ctx, i) => MethodsTile(methods!.elementAt(i)),
                  ),
                ),
              ],
            );
          } else {
            return LoadingTabView();
          }
        });
  }
}
