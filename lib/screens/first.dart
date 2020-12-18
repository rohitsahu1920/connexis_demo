import 'dart:convert';

import 'package:connexis_demo/http/request.dart';
import 'package:connexis_demo/pojo/first_page.dart';
import 'package:connexis_demo/util/common.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class first extends StatefulWidget {
  @override
  _firstState createState() => _firstState();
}

class _firstState extends State<first> {

  List<first_page> first_page_out = [];
  List<String> _locations = ['Team 1', 'Team 2'];
  String _selectedLocation = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      bottomNavigationBar: BottomNavigationBar(

        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF6200EE),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          // Respond to item press.
        },
        items: [
          BottomNavigationBarItem(
            title: Text('Favorites'),
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            title: Text('Music'),
            icon: Icon(Icons.music_note),
          ),
          BottomNavigationBarItem(
            title: Text('Places'),
            icon: Icon(Icons.location_on),
          ),
          BottomNavigationBarItem(
            title: Text('News'),
            icon: Icon(Icons.library_books),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              child: DropdownButton (
                isExpanded: true,
                hint: Text('Select Options'),
                value: _selectedLocation,
                items: _locations.map((location){
                  return DropdownMenuItem(
                    child: new Text(location),
                    value: location,
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedLocation = newValue;
                  });
                },
              ),
            ),
            Container(
              child: ListView.separated(
                itemCount: first_page_out.length,
                itemBuilder: (context, index){
                  return Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage:
                          NetworkImage(first_page_out[index].data[index].avatar,),
                          backgroundColor: Colors.transparent,
                        ),
                        Column(
                          children: [

                          ],
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context,int index) => Divider(),
              ),
            )
          ],
        ),
      ),
    );
  }

  void getList() async{
    if(await Common.isNetworkAvailable()){
      Future.delayed(Duration.zero, () => Common.dialogLoader(context));
      var data = {

      };
      Request request = Request('1', data);
      request.get().then((result){
        Navigator.pop(context);
        var rest = result.data['first_page'] as List;
        setState(() {
          first_page_out = rest.map<first_page>((json) => first_page.fromJson(json)).toList();
        });
      }).catchError((error){
        Navigator.pop(context);
        Common.toast(context, "Wrong");
      });
    } else {
      Navigator.pop(context);
      Common.toast(context, "noInternetMsg");
    };
  }

}
