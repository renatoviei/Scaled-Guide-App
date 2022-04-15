import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/Organization.dart';
import '../routes/app_routes.dart';

import '../provider/methods.dart';
import '../services/auth.dart';
import '../views/login_screen.dart';
import '../views/methods_list.dart';
import '../views/organizations_list.dart';
import '../views/simulator_list.dart';

class TabBarMain extends StatefulWidget {
  @override
  State<TabBarMain> createState() => _TabBarMainState();
}

class _TabBarMainState extends State<TabBarMain> {
  final AuthService _auth = AuthService();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final organizations = Provider.of<List<Organization>>(context);
    final Methods methods = Provider.of(context);

    return DefaultTabController(
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
          automaticallyImplyLeading: false,
          backgroundColor: Colors.lightBlue[900],
          title: const Text('Scaled Guide'),
          centerTitle: true,
          bottom: TabBar(
            labelPadding: const EdgeInsets.symmetric(vertical: 15.0),
            tabs: const [
              Text("Organizations"),
              Text("Simulator"),
              Text("Frameworks"),
            ],
            onTap: _onTabTapped,
          ),
          actions: <Widget>[
            TextButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (cxt) => AlertDialog(
                    title: const Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.orange,
                      ),
                    ),
                    content: const Text('Are you sure you want to logout?'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('No'),
                        onPressed: () {
                          Navigator.of(cxt).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Yes'),
                        onPressed: () async {
                          await _auth.signOut();
                          Navigator.of(cxt).pop();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const myLogin()),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        bottomSheet: _bottomSheetSwitch(index),
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
