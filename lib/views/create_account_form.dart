import 'package:flutter/material.dart';

class accountForm extends StatefulWidget {
  @override
  State<accountForm> createState() => _FormState();
}

class _FormState extends State<accountForm> {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        decoration: const InputDecoration(labelText: 'Name'),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty)
                            return 'Inform the name';
                          return null;
                        },
                        onSaved: (value) => _formData['name'] = value!,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Email'),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty)
                            return 'Inform the email';
                          return null;
                        },
                        onSaved: (value) => _formData['email'] = value!,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the password';
                          } else if (value.length <= 6) {
                            return 'Password must be greater than 6 digits';
                          }
                          return null;
                        },
                        onSaved: (value) => _formData['password'] = value!,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                        ),
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
                onPressed: () {
                  final isValid = _form.currentState!.validate();

                  if (isValid) {
                    _form.currentState!.save();

                    /*Provider.of<User>(context, listen: false).put(
                        User(
                          id: '',
                          name: _formData['name']!,
                          email: _formData['email']!,
                          password: _formData['password']!,
                        );*/

                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Create'),
              ),
            ]),
      ),
    );
  }
}
