import 'package:code/HelpAndSupport.dart';
import 'package:code/dashboard.dart';
import 'package:code/homepage.dart';
import 'package:flutter/material.dart';

class viewbottom extends StatefulWidget {
  const viewbottom({Key? key}) : super(key: key);

  @override
  State<viewbottom> createState() => _viewbottomState();
}

class _viewbottomState extends State<viewbottom> {
  // final formkey = GlobalKey<FormState>();
  int _currentindex = 1;
  List pages = [dashbord(), Homepage(), HelpandSupport()];

  void onTap(int index) {
    setState(() {
      _currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        backgroundColor: Colors.indigo[800],
        onTap: onTap,
        selectedFontSize: 14,
        unselectedFontSize: 10,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.help), label: 'Help & Support'),
        ],
      ),
    );
  }
}
