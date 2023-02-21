import 'package:dictionary/DatabaseOperations/database.dart';
import 'package:flutter/material.dart';

class SearchResultScreen extends StatefulWidget {
  SearchResultScreen({Key? key}) : super(key: key);

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  bool _isSearch = false;

  TextEditingController _wordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _wordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: _wordController,
              decoration: const InputDecoration(
                  hintText: "Enter Word", labelText: "Search Word"),
            ),
          ),
          RaisedButton(
            onPressed: () async {
              if (_wordController.text != "") {
                setState(() {
                  _isSearch = true;
                });
              }
            },
            child: const Text("Search Word"),
          ),
          if (_isSearch)
            FutureBuilder<List>(
              future: ApiCall().translateWord(_wordController.text),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasData) {
                  final data = snapshot.data!;
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(14),
                        child: Text("${data[0]}"),
                      ),
                      Padding(
                        padding: EdgeInsets.all(14),
                        child: Text("${data[1]}"),
                      ),
                      Padding(
                        padding: EdgeInsets.all(14),
                        child: Text("${data[2]}"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RaisedButton(
                        onPressed: () {
                          DataBase().submitWord(
                              word: _wordController.text,
                              meaning1: data[0],
                              meaning2: data[1],
                              meaning3: data[2]);
                          },
                        child: Text("Save word to database"),
                      )
                    ],
                  );
                }
                return const Text("Data Not Found");
              },
            )
        ],
      ),
    );
  }
}
