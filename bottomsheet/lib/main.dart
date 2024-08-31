import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Scrollable Bottom Sheet"),
          centerTitle: true,
        ),
        body: const Center(
          child:
              ElevatedButton(onPressed: showSheet, child: Text("Open Sheet")),
        ),
      ),
    );
  }
}

// show sheet:
Future showSheet() {

  
}
