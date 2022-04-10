import 'dart:io';

import 'package:flutter/material.dart';

import '../routes/app_routes.dart';

class myLogin extends StatefulWidget {
  const myLogin({Key? key}) : super(key: key);

  @override
  _myLoginState createState() => _myLoginState();
}

class _myLoginState extends State<myLogin> {
  final _formFields = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Scaled Guide'),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (cxt) => AlertDialog(
                    title: const Text('Close app'),
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
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: 260.0,

                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40.0),
                    child: Image.asset(
                      'assets/logo.png',
                      width: 180.0,
                      height: 180.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 50.0),
                      padding: EdgeInsets.only(
                        top: 250.0,
                      ),
                      child: Text(
                        'Sing in',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 26.0,
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
                                return 'Password enter a valid email';
                              }
                            },
                            decoration: InputDecoration(
                              labelText: 'Email',
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 30.0),
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
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              // hintText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 30.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    maximumSize: Size(120.0, 60.0),
                                    minimumSize: Size(120.0, 60.0),
                                    primary: Colors.orange,
                                    shape: StadiumBorder(),
                                  ),
                                  onPressed: () {
                                    final isValid =
                                        _formFields.currentState!.validate();
                                    if (isValid)
                                      Navigator.pushNamed(
                                          context, AppRoutes.HOME_TAB);
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
                                  Navigator.pushNamed(context, 'register');
                                },
                                child: Text(
                                  'Register',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
