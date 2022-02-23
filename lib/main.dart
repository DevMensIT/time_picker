// ignore_for_file: prefer_const_constructors

/*
Author:  Kishan Maniar 
main.dart (c) 2022
Created:  2022-02-23T07:36:56.100Z

*/

import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Time Picker Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var fromTime = new TextEditingController(text: "From");
  var toTime = new TextEditingController(text: "To");

  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      color: Colors.amber[200],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.amber[400],
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const Text("Time Picker"),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: TextFormField(
                        controller: fromTime,
                        enabled: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      flex: 4,
                      child: TextFormField(
                        controller: toTime,
                        enabled: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: IconButton(
                            onPressed: () {
                              _funTimePicker();
                            },
                            icon: Icon(Icons.access_time)))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    )));
  }

  _funTimePicker() async {
    final TimeOfDay? result = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        initialEntryMode: TimePickerEntryMode.dial);
    if (i == 0) {
      setState(() {
        if (result != null) {
          fromTime.text = result.format(context);
        }
      });

      i = 1;
      if (result != null) {
        _funTimePicker();
      }
    } else {
      i = 0;
      setState(() {
        if (result != null) {
          toTime.text = result.format(context);
        }
      });
    }
  }
}
