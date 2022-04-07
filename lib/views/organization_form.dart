import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/Organization.dart';
import '../provider/organizations.dart';

class OrganizationForm extends StatefulWidget {
  @override
  State<OrganizationForm> createState() => _FormState();
}

class _FormState extends State<OrganizationForm> {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  String sector = 'IT';
  String method = 'Not simulated';
  bool hasExperienceWithAgile = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scaled Guide'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Fill in the following fields and analyse all question check topics about your organization",
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
                        },
                        onSaved: (value) => _formData['name'] = value!,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Email'),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty)
                            return 'Inform the email';
                        },
                        onSaved: (value) => _formData['email'] = value!,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'CNPJ'),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty)
                            return 'Inform CNPJ of the organization';
                          if (value
                                  .replaceAll('.', '')
                                  .replaceAll('/', '')
                                  .replaceAll('-', '')
                                  .length !=
                              14) return 'CNPJ is invalid';
                        },
                        onSaved: (value) => _formData['cnpj'] = value!,
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Description'),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty)
                            return 'Inform the description';
                          if (value.length > 100)
                            return 'Your description must be less than 100 characters';
                        },
                        onSaved: (value) => _formData['description'] = value!,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: const [
                          Text(
                            "Sector",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blueGrey,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      DropdownButton<String>(
                        isExpanded: true,
                        value: sector,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.blue),
                        underline: Container(
                          height: 2,
                          color: Colors.blue,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            sector = newValue!;
                          });
                        },
                        items: <String>[
                          'IT',
                          'Energy',
                          'Food',
                          'Civil Construction',
                          'Warfare',
                          'Agribusiness',
                          'Consumer Things',
                          'Retail',
                          'Financial Services',
                          'Automotive'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Your avatar URL'),
                        onSaved: (value) => _formData['avatarUrl'] = value!,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Any Agile Method in use?'),
                        onSaved: (value) => _formData['method'] = value!,
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'The organization has experience with agile?'),
                        value: hasExperienceWithAgile,
                        onChanged: (bool? value) {
                          setState(() {
                            hasExperienceWithAgile = value!;
                          });
                        },
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

                    if (_formData['method'] != '') {
                      method = _formData['method']!;
                    }

                    Provider.of<Organizations>(context, listen: false).put(
                      Organization(
                          id: '',
                          name: _formData['name']!,
                          email: _formData['email']!,
                          cnpj: _formData['cnpj']!,
                          description: _formData['description']!,
                          sector: sector,
                          avatarUrl: _formData['avatarUrl']!,
                          method: method,
                          hasExperienceWithAgile: hasExperienceWithAgile),
                    );

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