import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5,
      child: Container(
        color: Colors.amber,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10,5,10,5),
              child: ListTile(
                leading: Icon(Icons.house),
                title: Text('HOME', style: TextStyle(),),
                trailing: Icon(Icons.navigate_next),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10,0,10,0),
              child: Container(
                width: double.maxFinite,
                height: 1,
                color: Colors.indigo,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10,5,10,5),
              child: ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Locations'),
                trailing: Icon(Icons.navigate_next),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10,0,10,0),
              child: Container(
                width: double.maxFinite,
                height: 1,
                color: Colors.indigo,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10,5,10,5),
              child: ListTile(
                leading: Icon(Icons.account_box_rounded),
                title: Text('About'),
                trailing: Icon(Icons.navigate_next),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10,0,10,0),
              child: Container(
                width: double.maxFinite,
                height: 1,
                color: Colors.indigo,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10,5,10,5),
              child: ListTile(
                leading: Icon(Icons.call),
                title: Text('Contact us'),
                trailing: Icon(Icons.navigate_next),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10,0,10,0),
              child: Container(
                width: double.maxFinite,
                height: 1,
                color: Colors.indigo,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
