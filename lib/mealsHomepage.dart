import 'package:flutter/material.dart';
import 'package:meals_app/categoriesScree.dart';
import 'package:meals_app/settings.dart';

import 'dummy_data.dart';
import 'meals.dart';

class mealsHomePage extends StatefulWidget {
  const mealsHomePage({Key? key}) : super(key: key);

  @override
  _mealsHomePageState createState() => _mealsHomePageState();
}

class _mealsHomePageState extends State<mealsHomePage> {

  Iterable<Meal> mylist = dunny_names;
  void newList(Map<String,bool> mapp){

    setState(() {
      mylist = dunny_names.where((element){
        if(element.isGlutenFree && mapp['glutenFree'] == false){
          return false;
        }
        if(element.isLactoseFree && mapp['_lactoseFree'] == false){
          return false;
        }
        if(element.isVegetarian && mapp['_isVegetarian'] == false){
          return false;
        }
        if(element.isVegan && mapp['_isVegan'] == false){
          return false;
        }
        return true;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('MealsApp'),
      ),
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
                ListTile(onTap: ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>settings(newList))),leading: Icon(Icons.settings, size: 30,), title: Text("Settings", style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),),
              ]
          )
      ),
      body: categoriesScreen(mylist),
    );
  }
}
