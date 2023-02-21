import 'package:dictionary/screens/searched_Words_Screen.dart';
import 'package:dictionary/screens/search_Result_Screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dictionary App',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
      ),
      home: NavigationBar(),
    );
  }
}

class NavigationBar extends StatefulWidget {  
  
  
  @override  
  _NavigationBarState createState() => _NavigationBarState();  
}  
  
class _NavigationBarState extends State<NavigationBar > {  
  int _selectedIndex = 0;  
  static final List<Widget> _widgetOptions = <Widget>[  
    SearchResultScreen() ,
    searchHistoryScreen()
    
  ];  
  
  void _onItemTapped(int index) {  
    setState(() {  
      _selectedIndex = index;  
    });  
  }  
  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(  
        title: const Text('Search Word'),  
          backgroundColor: Color.fromARGB(220, 46, 215, 79)
      ),  
      body: Center(  
        child: _widgetOptions.elementAt(_selectedIndex),  
      ),  
      bottomNavigationBar: BottomNavigationBar(  
        items: const <BottomNavigationBarItem>[  
          BottomNavigationBarItem(  
            label: 'Search',
            icon: Icon(Icons.search),  
              
            backgroundColor: Colors.green  
          ),  
          BottomNavigationBarItem(  
            icon: Icon(Icons.history),  
            label: 'History',  
          ),  
          
        ],  
        type: BottomNavigationBarType.shifting,  
        currentIndex: _selectedIndex,  
        selectedItemColor: Colors.black,  
        iconSize: 40,  
        onTap: _onItemTapped,  
        elevation: 5  
      ),  
    );  
  }  
}  