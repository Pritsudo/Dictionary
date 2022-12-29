import 'package:dictionary/DatabaseOperations/database.dart';
import 'package:flutter/material.dart';

class searchHistoryScreen extends StatefulWidget {
  searchHistoryScreen({Key? key}) : super(key: key);

  @override
  State<searchHistoryScreen> createState() => _searchHistoryScreenState();
}

class _searchHistoryScreenState extends State<searchHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List>(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child:  CircularProgressIndicator(strokeWidth: 5,color: Color.fromARGB(255, 118, 246, 208),));
            } else if (snapshot.hasData) {
              List data = snapshot.data!;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Color.fromARGB(255, 45, 238, 180),
                    elevation: 10,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Text('${data[index]["id"]})',
                              style: const TextStyle(fontSize: 25.0)),
                          title: Text('Word : ${data[index]["word"]}',
                              style: const TextStyle(fontSize: 25.0)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Meaning 1 : ${data[index]["meaning1"]}',
                                  style: const TextStyle(fontSize: 20.0)),
                              Text('Meaning 2 : ${data[index]["meaning2"]}',
                                  style: const TextStyle(fontSize: 20.0)),
                              Text('Meaning 3 : ${data[index]["meaning3"]}',
                                  style: const TextStyle(fontSize: 20.0)),
                            ],
                          ),
                        ),
                        ButtonBar(
                          children: <Widget>[
                            RaisedButton(
                              child: const Text('Delete'),
                              onPressed: () async{
                              await DataBase().deleteWord(Id: data[index]["id"]);
                                setState(() {
                                  
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                itemCount: data.length,
              );
            }
            return Text("There is no text");
          },
          future: DataBase().getWords(),
        ));
  }
}
