import 'dart:convert';

import 'package:connexis_demo/http/request.dart';
import 'package:connexis_demo/pojo/Firstpage.dart';
import 'package:connexis_demo/util/common.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class first extends StatefulWidget {
  @override
  _firstState createState() => _firstState();
}

class _firstState extends State<first> {

  List<Data> firstpage = [];
  final List<String> _locations = ['Select Option','Team 1', 'Team 2'];
  String _selectedLocation = "";

  @override
  void initState() {
    // TODO: implement initState
    getList();
    super.initState();
  }

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
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            child: DropdownButton (
              isExpanded: true,
              hint: Text('Select Options'),
              value: _selectedLocation == "" ? _locations[0] : _selectedLocation ,
              onChanged: (newValue) {
                setState(() {
                  _selectedLocation = newValue;
                  getList();
                });
              },
              items: _locations.map((location){
                return DropdownMenuItem(
                  child: Text(location),
                  value: location,
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: ListView.separated(
                itemCount: firstpage.length,
                itemBuilder: (context, index){
                  return Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 9),
                    child: GestureDetector(
                      child: Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 50.0,
                              backgroundImage:
                              NetworkImage(firstpage[index].avatar,),
                              backgroundColor: Colors.transparent,
                            ),
                            SizedBox(width: 20,),
                            Column(
                              children: [
                                Container(
                                  width: 200,
                                  child: Text("ID: ${firstpage[index].id}", textAlign: TextAlign.start, overflow: TextOverflow.ellipsis,),
                                ),
                                Container(
                                  width: 200,
                                  child: Text("First Name: ${firstpage[index].firstName}",textAlign: TextAlign.left,),
                                ),
                                Container(
                                  width: 200,
                                  child: Text("Last Name: ${firstpage[index].lastName}",textAlign: TextAlign.left,),
                                ),
                                Container(
                                  width: 200,
                                  child: Text("Email: ${firstpage[index].email}",textAlign: TextAlign.left,),
                                ),



                              ],
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainCategoryList()));
                      },
                    ),
                  );
                },
                separatorBuilder: (BuildContext context,int index) => Divider(),
              ),
            ),
          )
        ],
      ),
    );
  }

  void getList() async{

    if(_selectedLocation == 'Team 1'){
      if(await Common.isNetworkAvailable()){
        Future.delayed(Duration.zero, () => Common.dialogLoader(context));
        var data = {

        };
        Request request = Request('1', data);
        request.getone().then((result){
          Navigator.pop(context);
          var rest = result.data['data'] as List;
          //print("Data : ${rest}");
          setState(() {
            firstpage = rest.map<Data>((json) => Data.fromJson(json)).toList();
          });
        }).catchError((error){
          Navigator.pop(context);
          print(error);
          Common.toast(context, "Wrong ${error}");
        });
      } else {
        Navigator.pop(context);
        Common.toast(context, "noInternetMsg");
      };
    } else if(_selectedLocation == 'Team 2') {
      if (await Common.isNetworkAvailable()) {
        Future.delayed(Duration.zero, () => Common.dialogLoader(context));
        var data = {
        };
        Request request = Request('2', data);
        request.getone().then((result) {
          Navigator.pop(context);
          var rest = result.data['data'] as List;
          //print("Data : ${rest}");
          setState(() {
            firstpage = rest.map<Data>((json) => Data.fromJson(json)).toList();
          });
        }).catchError((error) {
          Navigator.pop(context);
          print(error);
          Common.toast(context, "Wrong ${error}");
        });
      } else {
        Navigator.pop(context);
        Common.toast(context, "noInternetMsg");
      }
    }
  }
}
