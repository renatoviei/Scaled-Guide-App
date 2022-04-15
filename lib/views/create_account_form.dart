import 'package:ScaledGuideApp/shared/loading.dart';
import 'package:flutter/material.dart';

import '../services/auth.dart';

class accountForm extends StatefulWidget {
  @override
  State<accountForm> createState() => _FormState();
}

class _FormState extends State<accountForm> {
  final AuthService _auth = AuthService();
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  bool loading = false;
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[900],
        title: const Text('Scaled Guide'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Fill in the following fields with your account register informations",
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
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: _form,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 55.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Email'),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Inform the user email';
                          } else if (!value.contains("@")) {
                            return 'Please enter a valid email';
                          }
                        },
                        onSaved: (value) => _formData['email'] = value!,
                      ),
                      SizedBox(height: 1.0),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the user password';
                          } else if (value.length <= 6) {
                            return 'Password must be greater than 6 digits';
                          }
                          return null;
                        },
                        onSaved: (value) => _formData['password'] = value!,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Padding(
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
              onPressed: () async {
                final isValid = _form.currentState!.validate();

                if (isValid) {
                  _form.currentState!.save();
                  setState(() => loading = true );
                  dynamic result = await _auth.registerWithEmailAndPassword(
                      _formData['email']!, _formData['password']!);
                  if (result == null) {
                    setState(() {
                      error = 'Please supply a valid email';
                      loading = false;
                    });
                  } else {
                    await showDialog(
                      context: context,
                      builder: (cxt) => AlertDialog(
                        title: const Text('Your account has been created!',
                          style: TextStyle(
                            color: Colors.orange,
                          ),
                        ),
                        content:
                        const Text('Now, do login.'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Ok'),
                            onPressed: () {
                              Navigator.of(cxt).pop();
                            },
                          ),
                        ],
                      ),
                    );
                  }
                  Navigator.of(context).pop();
                }

              },
              child: const Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}
