import 'dart:io';

import 'package:ScaledGuideApp/shared/loading.dart';
import 'package:flutter/material.dart';

import '../routes/app_routes.dart';
import '../services/auth.dart';

class myLogin extends StatefulWidget {
  const myLogin({Key? key}) : super(key: key);

  @override
  _myLoginState createState() => _myLoginState();
}

class _myLoginState extends State<myLogin> {
  final AuthService _auth = AuthService();
  final _formFields = GlobalKey<FormState>();
  bool loading = false;
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {

    return loading ? Loading() : SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Scaled Guide'),
          centerTitle: true,
          backgroundColor: Colors.lightBlue[900],
          leading: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (cxt) => AlertDialog(
                  title: const Text('Close app',
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                  content: const Text('Are you sure you want to exit the app?'),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('No'),
                      onPressed: () {
                        Navigator.of(cxt).pop();
                      },
                    ),
                    TextButton(
                      child: const Text('Yes'),
                      onPressed: () => exit(0),
                    ),
                  ],
                ),
              );
            },
            tooltip: 'Close app',
            icon: Icon(Icons.logout),
          ),
        ),
        backgroundColor: Colors.grey[50],
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: 260.0,
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(),
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/logo.png',
                      width: 220.0,
                      height: 220.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                  decoration: BoxDecoration(
                    //Here goes the same radius, u can put into a var or function
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(250)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x54000000),
                        spreadRadius: 4,
                        blurRadius: 13,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 50.0),
                    padding: EdgeInsets.only(
                      top: 265.0,
                    ),
                    child: Text(
                      'Sing in',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Form(
                key: _formFields,
                child: Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.45,
                    left: 35,
                    right: 35,
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the email';
                          } else if (!value.contains("@")) {
                            return 'Please enter a valid email';
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Email',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      SizedBox(height: 25.0),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the password';
                          } else if (value.length <= 6) {
                            return 'Password must be greater than 6 digits';
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          fillColor: Colors.white,
                          filled: true,
                          // hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      SizedBox(height: 25.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                maximumSize: Size(150.0, 60.0),
                                minimumSize: Size(150.0, 60.0),
                                primary: Colors.orange,
                                shape: StadiumBorder(),
                              ),
                              onPressed: () async {
                                final isValid =
                                    _formFields.currentState!.validate();

                                if (isValid) {
                                  setState(() => loading = true );
                                  dynamic result =
                                      await _auth.signInWithEmailAndPassword(
                                          email, password);
                                  if (result == null) {
                                    setState(() {
                                      error =
                                          'Could not sign in with those credentials';
                                      loading = false;
                                    });
                                  } else {
                                    Navigator.pushNamed(
                                        context, AppRoutes.HOME_TAB);
                                  }
                                }
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('LOG IN'),
                                  Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                  ),
                                ],
                              )),
                        ],
                      ),
                      SizedBox(height: 0.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.CREATE_ACCOUNT);
                            },
                            child: Text(
                              'Create an account',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 0.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
