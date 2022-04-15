import 'package:ScaledGuideApp/models/Method.dart';
import 'package:flutter/material.dart';

class DetailMethod extends StatefulWidget {
  var method;

  DetailMethod(this.method, {Key? key}) : super(key: key);

  @override
  State<DetailMethod> createState() => _DetailMethodState();
}

class _DetailMethodState extends State<DetailMethod> {
  @override
  Widget build(BuildContext context) {
    final Method method = widget.method;

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
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              method.name,
              style: TextStyle(
                fontSize: 24,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lato',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical, //.horizontal
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 22, bottom: 20),
                child: Column(
                  children: <Widget>[
                    Text(
                      method.description.replaceAll('\\n', '\n'),
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
