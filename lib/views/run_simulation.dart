import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/UserApp.dart';
import '../provider/organizations.dart';

import '../models/Organization.dart';

class RunSimulationForm extends StatefulWidget {
  var organization;

  RunSimulationForm(this.organization, {Key? key}) : super(key: key);

  @override
  State<RunSimulationForm> createState() => _FormState();
}

class _FormState extends State<RunSimulationForm> {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  String method = 'Not simulated';
  String sector = '';
  bool hasExperienceWithAgile = false;

  void _loadFormData(Organization organization) {
    if (organization != null) {
      _formData['id'] = organization.id;
      _formData['name'] = organization.name;
      _formData['email'] = organization.email;
      _formData['cnpj'] = organization.cnpj;
      _formData['description'] = organization.description;
      _formData['avatarUrl'] = organization.avatarUrl;
      _formData['method'] = organization.method;
      sector = organization.sector;
      hasExperienceWithAgile = organization.hasExperienceWithAgile;
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserApp?>(context);
    final Organization organization = widget.organization;

    if (_formData.isEmpty) {
      _loadFormData(organization);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[900],
        title: const Text(
          'Scaled Guide',
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Run Agile Framework simulation for your organization?",
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
                        initialValue: _formData['name'],
                        decoration: const InputDecoration(labelText: 'Name'),
                        showCursor: true,
                        enabled: false,
                      ),
                      TextFormField(
                        initialValue: _formData['email'],
                        decoration: const InputDecoration(labelText: 'Email'),
                        showCursor: true,
                        enabled: false,
                      ),
                      TextFormField(
                        initialValue: _formData['cnpj'],
                        decoration: const InputDecoration(labelText: 'CNPJ'),
                        showCursor: true,
                        enabled: false,
                      ),
                      TextFormField(
                        initialValue: _formData['description'],
                        decoration:
                            const InputDecoration(labelText: 'Description'),
                        showCursor: true,
                        enabled: false,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: const [
                          Text(
                            "Sector",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
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
                          height: 0.5,
                          color: Colors.grey,
                        ),
                        onChanged: null,
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
                        initialValue: _formData['avatarUrl'],
                        decoration:
                            const InputDecoration(labelText: 'Your avatar URL'),
                        showCursor: true,
                        enabled: false,
                      ),
                      TextFormField(
                        initialValue: _formData['method'],
                        decoration: const InputDecoration(
                            labelText: 'Agile Framework/Method in use'),
                        showCursor: true,
                        enabled: false,
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                            'The organization has experience with agile?'),
                        value: hasExperienceWithAgile,
                        onChanged: null,
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
                  _form.currentState!.save();

                  method = 'Scrum-at-Scale';

                  Provider.of<Organizations>(context, listen: false).put(
                    Organization(
                      id: _formData['id']!,
                      userId: user!.id,
                      name: _formData['name']!,
                      email: _formData['email']!,
                      cnpj: _formData['cnpj']!,
                      description: _formData['description']!,
                      sector: sector,
                      avatarUrl: _formData['avatarUrl']!,
                      method: method,
                      hasExperienceWithAgile: hasExperienceWithAgile,
                    ),
                  );

                  await showDialog(
                    context: context,
                    builder: (cxt) => AlertDialog(
                      backgroundColor: Colors.grey[50],
                      title: const Text(
                        'Done!',
                        style: TextStyle(
                          color: Colors.orange,
                        ),
                      ),
                      content: Text(
                        'The suggested Agile Framework at scale for you to use in your organization is the ' +
                            method +
                            '!\n\n' +
                            'To know more information about Frameworks, see "Frameworks" tab.',
                        textAlign: TextAlign.justify,
                      ),
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

                  Navigator.of(context).pop();
                },
                child: const Text('Run'),
              ),
            ],
        ),
      ),
    );
  }
}
