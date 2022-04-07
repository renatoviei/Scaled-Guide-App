import 'package:ScaledGuideApp/views/run_simulation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/methods.dart';
import '../provider/organizations.dart';
import '../routes/app_routes.dart';
import '../tabBar/main_tabbar.dart';
import '../views/organization_edit_form.dart';
import '../views/organization_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Organizations(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Methods(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          AppRoutes.HOME: (_) => TabBarMain(),
          AppRoutes.ORGANIZATION_FORM: (_) => OrganizationForm(),
          AppRoutes.ORGANIZATION_EDIT_FORM: (_) => OrganizationEditForm(null),
          AppRoutes.RUN_SIMULATION: (_) => RunSimulationForm(null),
        },
      ),
    );
  }
}
