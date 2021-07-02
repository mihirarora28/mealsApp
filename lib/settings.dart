import 'package:flutter/material.dart';
import 'package:meals_app/tabs_screen.dart';
class settings extends StatefulWidget {
  Function newlist;
  settings(this.newlist);

  @override
  _settingsState createState() => _settingsState();
}

class _settingsState extends State<settings> {


  Map<String,bool> mapp = {
  '_isVegan' : false ,
  '_lactoseFree' : false,
  '_glutenFree' : false,
  '_isVegetarian' : false
  };

  bool _isVegan = false;
  bool _lactosefree = false;
  bool _glutenFree = false;
  bool _isVegetarian = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals App'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(onPressed: (){
            mapp['_isVegan'] = _isVegan;
            mapp['_lactoseFree'] = _lactosefree;
            mapp['_glutenFree'] = _glutenFree;
            mapp['_isVegetarian'] = _isVegetarian;
            print(mapp);

            widget.newlist(mapp);

          }, icon: Icon(Icons.save))
        ],
      ),
      drawer:  Drawer(
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
    ListTile(onTap: ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>tabsScreen())), leading: Icon(Icons.no_meals, size: 30,), title: Text("Meals", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),),
    SizedBox(height: 5.0,),
    // ListTile(onTap: ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>settings())),leading: Icon(Icons.settings, size: 30,), title: Text("Settings", style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),),
    ]
    )
    ),
      body: Column(
        children: [
          Center(child: Container(
            margin: EdgeInsets.all(15.0),
              child: Text("Adjust Your Settings", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),))) ,
          Expanded(child: Column(
            children: [
              SwitchListTile(subtitle:Text("Only include Gluten-Free meals") , title: Text("Gluten-free",style: TextStyle(fontSize: 20.0),), value: _glutenFree, onChanged: (value){
                setState(() {
                   _glutenFree = value;
                });

              }),
              SizedBox(height: 10.0,),
              SwitchListTile(subtitle:Text("Only include Lactose-Free meals") , title: Text("Lactose-Free",style: TextStyle(fontSize: 20.0),), value: _lactosefree, onChanged: (value){
                setState(() {
                  _lactosefree = value;
                });

              }),
              SizedBox(height: 10.0,),
              SwitchListTile(subtitle:Text("Only include Vegetarian meals") , title: Text("Vegetarian",style: TextStyle(fontSize: 20.0),), value: _isVegetarian, onChanged: (value){
                setState(() {
                  _isVegetarian = value;
                });

              }),
              SizedBox(height: 10.0,),
              SwitchListTile(subtitle:Text("Only include Vegan meals") , title: Text("Vegan",style: TextStyle(fontSize: 20.0),), value: _isVegan, onChanged: (value){
                setState(() {
                  _isVegan = value;
                });

              }),
              SizedBox(height: 10.0,),
            ],
          ))
        ],
      ),
    );
  }
}
