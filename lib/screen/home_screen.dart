import 'package:flutter/material.dart';
import 'package:movie_app/screen/movie_screen.dart';
import 'package:movie_app/screen/profile_screen.dart';
import 'package:movie_app/screen/search_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  double _screenSize = 0;
  static const TextStyle _appBarStyle = TextStyle(
      color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w700);

  List<Widget> appBarTitle = <Text>[
    Text('Movie', style: _appBarStyle),
    Text('Search', style: _appBarStyle),
    Text('Profile', style: _appBarStyle)
  ];

  List<Widget> widgetOptions = <Widget>[
    MovieScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onScreenChanged(double size) {
    setState(() {
      _screenSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    _onScreenChanged(MediaQuery.of(context).size.width);
    print(_screenSize);
    return Scaffold(
      appBar: AppBar(
        title: appBarTitle.elementAt(_selectedIndex),
        backgroundColor: Colors.white,
      ),
      body: widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: "Movie",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
