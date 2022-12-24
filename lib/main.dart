import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as https;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late List data = [];


  Future<List> translateWord() async {
    var url = Uri.parse(
        "https://words.bighugelabs.com/api/2/2a262a4f76695374f7b78957bec10cab/groom/json");
    var responce = await https.get(url);
    final extractedData = json.decode(responce.body);
    // print(extractedData["noun"]["syn"]);
    // data = extractedData["noun"]["syn"];
    return extractedData["noun"]["syn"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder<List>(
          future: translateWord(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              final data = snapshot.data!;

              return Column(
                children: [
                  Text("${data[0]}"),
                  Text("${data[1]}"),
                  Text("${data[2]}")
                ],
              );
            }
            
            return const CircularProgressIndicator();
          },
        ));
  }
}
