import 'package:code/UI/ManagementDashboard/Dashboard.dart';
import 'package:flutter/material.dart';
import '../ProductionDashboard/DashboardProduction.dart';
import '../ProductionDashboard/ProductionDashboard.dart';
import 'ManagementPlanvsActualScreen.dart';

class Menupage extends StatefulWidget {
  const Menupage({Key? key}) : super(key: key);

  @override
  State<Menupage> createState() => _MenupageState();
}

class _MenupageState extends State<Menupage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NADI'),
        backgroundColor: Colors.indigo.shade900,
      ),
      drawer: Padding(
        padding: const EdgeInsets.only(top: 40, left: 8, right: 8, bottom: 8),
        child: Drawer(
          backgroundColor: Colors.indigo.shade100,
          width: MediaQuery.of(context).size.width * 0.6,
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Image(
                image: AssetImage('asset/nadi1.png'),
                height: 130,
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      title: Text(
                        'Management Dashboard',
                        style: TextStyle(color: Colors.indigo.shade900),
                      ),
                      leading: Icon(
                        Icons.insert_chart_rounded,
                        color: Colors.indigo.shade900,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DashBoard()),
                        );
                      },
                    ),
                    Divider(
                      height: 10,
                      thickness: 2,
                    ),
                    ListTile(
                      title: Text(
                        'Production Dashboard',
                        style: TextStyle(color: Colors.indigo.shade900),
                      ),
                      leading: Icon(
                        Icons.add_chart,
                        color: Colors.indigo.shade900,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DashBoardProduction()),
                        );
                      },
                    ),
                    Divider(
                      height: 10,
                      thickness: 2,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
