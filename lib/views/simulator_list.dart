import 'package:flutter/material.dart';

import '../components/simulator_tile.dart';
import '../models/Organization.dart';
import '../provider/organizations.dart';
import '../shared/loading.dart';

class SimulatorList {
  Widget buildListSimulator(List<Organization> organizations) {
    return StreamBuilder<List<Organization>>(
        stream: Organizations().organizations,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Organization>? orgs = snapshot.data;

            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Which organization do you want to simulate the Agile Framework?",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: orgs?.length,
                    itemBuilder: (ctx, i) =>
                        SimulatorTile(orgs!.elementAt(i)),
                  ),
                ),
              ],
            );
          } else {
            return Loading();
          }
        });
  }
}
