import 'package:flutter/material.dart';

import '../components/simulator_tile.dart';
import '../provider/organizations.dart';

class SimulatorList {
  Widget buildListSimulator(Organizations organizations) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text("Which organization do you want to simulate the Agile Method?",
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
            itemCount: organizations.count,
            itemBuilder: (ctx, i) => SimulatorTile(organizations.byIndex(i)),
          ),
        ),
      ],
    );
  }
}
