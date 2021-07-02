import 'package:flutter/cupertino.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:flutter/material.dart';
import 'meals.dart';

class mealDetails extends StatelessWidget {
  final String id;
  mealDetails(this.id);

  @override
  Widget build(BuildContext context) {
    final aBc = dunny_names.firstWhere((element) => element.id == id);
    // print(aBc);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(aBc.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              aBc.imageUrl,
              height: 300.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Text(
                "Ingredients",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: 200,
              height: 100,
              margin: EdgeInsets.symmetric(vertical: 10.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: Colors.black),
                  borderRadius: BorderRadius.circular(5.0)),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.symmetric(vertical: 2.0),
                      child: Text(aBc.ingredients[index]),
                      color: Theme.of(context).accentColor.withOpacity(0.7));
                },
                itemCount: aBc.ingredients.length,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Text(
                "Steps",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: 300,
              height: 400,
              margin: EdgeInsets.symmetric(vertical: 10.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: Colors.black),
                  borderRadius: BorderRadius.circular(5.0)),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.amberAccent[300],
                        child: Text("# ${index + 1}"),
                      ),
                      title: Column(children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 2.0),
                          child: Text(aBc.steps[index]),
                        ),
                        Divider(
                          thickness: 2.0,
                          color: Colors.black.withOpacity(0.2),
                        )
                      ]));
                },
                itemCount: aBc.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(id);
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}
