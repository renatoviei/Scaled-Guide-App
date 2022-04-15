import 'package:ScaledGuideApp/models/UserApp.dart';
import 'package:ScaledGuideApp/services/auth.dart';
import 'package:ScaledGuideApp/views/create_account_form.dart';
import 'package:ScaledGuideApp/views/detail_method.dart';
import 'package:ScaledGuideApp/views/login_screen.dart';
import 'package:ScaledGuideApp/views/run_simulation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/methods.dart';
import '../provider/organizations.dart';
import '../routes/app_routes.dart';
import '../tabBar/main_tabbar.dart';
import '../views/organization_edit_form.dart';
import '../views/organization_form.dart';
import 'models/Method.dart';
import 'models/Organization.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore.instance;
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
        ),
        StreamProvider<UserApp?>.value(
            value: AuthService().user, initialData: null,
        ),
        StreamProvider<List<Organization>>.value(
          value: Organizations().organizations, initialData: [],
        ),
        StreamProvider<List<Method>>.value(
          value: Methods().methods, initialData: [],
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          AppRoutes.HOME: (_) => myLogin(),
          AppRoutes.CREATE_ACCOUNT: (_) => accountForm(),
          AppRoutes.HOME_TAB: (_) => TabBarMain(),
          AppRoutes.ORGANIZATION_FORM: (_) => OrganizationForm(),
          AppRoutes.ORGANIZATION_EDIT_FORM: (_) => OrganizationEditForm(null),
          AppRoutes.RUN_SIMULATION: (_) => RunSimulationForm(null),
          AppRoutes.DETAIL_METHOD: (_) => DetailMethod(null),
        },
      ),
    );
  }
}
