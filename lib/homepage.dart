import 'package:code/Customeshapeappbar.dart';
import 'package:code/dashboard.dart';
import 'package:code/qrscanner.dart';
import 'package:flutter/material.dart';

import 'jobscreeen.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 120,
        elevation: 0,
        flexibleSpace: ClipPath(
          clipper: CustomeShapeappbar(),
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            color: Colors.indigo[800],
            child: Container(
              child: Center(
                child: Text(
                  "NADI",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        child: Stack(children: [
          // Container(
          //   padding: EdgeInsets.only(top: 20),
          //   alignment: AlignmentDirectional.topCenter,
          //   child: Image.asset(
          //     'asset/nadilogo.jpg',
          //     width: 200,
          //     height: 100,
          //   ),
          // ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: GridView(
              children: <Widget>[
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  shadowColor: Colors.black,
                  elevation: 20,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [
                              Colors.deepOrangeAccent,
                              Colors.amberAccent,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight)),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => dashbord(),
                            ));
                      },
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(
                              Icons.dashboard,
                              size: 40,
                              color: Colors.black,
                            ),
                            Text(
                              "Dashboard",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  shadowColor: Colors.black,
                  elevation: 20,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [
                              Colors.greenAccent,
                              Colors.lightGreenAccent,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight)),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => qrscanner(
                                title: '',
                              ),
                            ));
                      },
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(
                              Icons.store,
                              size: 40,
                            ),
                            Text(
                              "Store",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 20,
                  shadowColor: Colors.black,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [
                              Colors.pinkAccent,
                              Colors.deepPurpleAccent.shade100,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight)),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => jobscreen(),
                            ));
                      },
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(
                              Icons.store,
                              size: 40,
                            ),
                            Text(
                              "PMS",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 20,
                  shadowColor: Colors.black,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [
                              Colors.amber,
                              Colors.limeAccent,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight)),
                    child: InkWell(
                      onTap: () {},
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(
                              Icons.store,
                              size: 40,
                            ),
                            Text(
                              "Machine",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  shadowColor: Colors.black,
                  elevation: 30,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [
                              Colors.grey,
                              Colors.white70,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight)),
                    child: InkWell(
                      onTap: () {},
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(
                              Icons.store,
                              size: 40,
                            ),
                            Text(
                              "Support",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
            ),
          ),
        ]),
      ),
    );
  }
}
