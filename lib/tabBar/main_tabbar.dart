import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../routes/app_routes.dart';

import '../provider/methods.dart';
import '../provider/organizations.dart';
import '../views/methods_list.dart';
import '../views/organizations_list.dart';
import '../views/simulator_list.dart';

class TabBarMain extends StatefulWidget {
  @override
  State<TabBarMain> createState() => _TabBarMainState();
}

class _TabBarMainState extends State<TabBarMain> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final Organizations organizations = Provider.of(context);
    final Methods methods = Provider.of(context);

    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: TabBarView(
            children: [
              OrganizationsList().buildListOrganizations(organizations),
              SimulatorList().buildListSimulator(organizations),
              MethodsList().buildListAgileMethods(methods),
            ],
          ),
          appBar: AppBar(
              title: const Text('Scaled Guide'),
              centerTitle: true,
              bottom: TabBar(
                labelPadding: const EdgeInsets.symmetric(vertical: 15.0),
                tabs: const [
                  Text("Organizations"),
                  Text("Simulator"),
                  Text("Agile Methods"),
                ],
                onTap: _onTabTapped,
              )),
          bottomSheet: _bottomSheetSwitch(index),
        ),
      ),
    );
  }

  void _onTabTapped(int tappedIndex) {
    setState(() {
      index = tappedIndex;
    });
  }

  Widget? _bottomSheetSwitch(int index) {
    if (index == 0) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  backgroundColor: Colors.orange,
                  primary: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.ORGANIZATION_FORM);
                },
                child: const Text('Register'),
              ),
            ]),
      );
    }
    return null;
  }
}
