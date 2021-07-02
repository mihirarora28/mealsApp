import 'package:flutter/material.dart';
import 'package:meals_app/settings.dart';

import 'categoriesScree.dart';
import 'favouritesScreen.dart';
import 'mealsHomepage.dart';

class tabsScreen extends StatefulWidget {
  @override
  _tabsScreenState createState() => _tabsScreenState();
}

class _tabsScreenState extends State<tabsScreen> {

  final List abc = [mealsHomePage(), favouritesScreen()];
  var _selectedindex = 0 ;

  void _selectindex(int index){
    setState(() {
      _selectedindex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: _selectedindex == 0 ? Text('Meals App'): Text('Favourites Screen'),
        ),
        body: abc[_selectedindex],
        drawer: Drawer(
          child: Column(
            children:[
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 130,
                color: Theme.of(context).accentColor,
                padding: EdgeInsets.all(35),
                child: Text("Cooking !!!!", softWrap: true, style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold,color: Colors.black),),
              ),
              SizedBox(height: 20.0,),
              ListTile(onTap: ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>mealsHomePage())), leading: Icon(Icons.no_meals, size: 30,), title: Text("Meals", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),),
              SizedBox(height: 5.0,),
              // ListTile(onTap: ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>settings(newList))),leading: Icon(Icons.settings, size: 30,), title: Text("Settings", style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),),
            ]
          )
        ),
        bottomNavigationBar:
            BottomNavigationBar(
              selectedItemColor: Colors.amberAccent,
              unselectedItemColor: Colors.white,
              // type: BottomNavigationBarType.shifting,
              currentIndex: _selectedindex,
              onTap: _selectindex,
                backgroundColor: Theme.of(context).primaryColor, items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.pink,
            icon: Icon(Icons.access_alarm),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.pink,
            icon: Icon(Icons.favorite),
            label: 'Favourites',
          )
        ]));
  }
}
