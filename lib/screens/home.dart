import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project/screens/acccount.dart';
import 'package:project/screens/doc_report.dart';
import 'package:project/screens/doctors.dart';
import 'package:project/screens/meetings.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<Widget> home = [
    const doctors(),
    const meetings(),
    const doc_re(),
    const account()
  ];
  int select = 0;
  void _onItemTapped(int index) {
    setState(() {
      select = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: home[select],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.blue.shade50,
        surfaceTintColor: Colors.blue.shade100,
        onDestinationSelected: (int index) {
          setState(() {
            select = index;
          });
        },
        selectedIndex: select,
        destinations: [
          NavigationDestination(icon: Icon(Icons.category), label: "Category"),
          NavigationDestination(icon: Icon(Icons.schedule), label: "Schedule"),
          NavigationDestination(icon: Icon(Icons.reviews), label: "Review"),
          NavigationDestination(icon: Icon(Icons.supervised_user_circle),label: "Account")
        ],

        // items: const <BottomNavigationBarItem>[
        //   BottomNavigationBarItem(
        //       icon: Icon(Icons.category), label: "Category"),
        //   BottomNavigationBarItem(icon: Icon(Icons.schedule), label: "Schedule"),
        //    BottomNavigationBarItem(icon: Icon(Icons.reviews), label: "Review"),
        //   BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle),label: "Account")
        // ],
        // currentIndex: select,
        // onTap: _onItemTapped,
      ),
    );
  }
}
