import 'package:flutter/material.dart';
import 'package:meals_app/mealItem.dart';
import 'dummy_data.dart';
import 'meals.dart';

class mealsScreen extends StatefulWidget {
  final String id;
  final String title;
  final Iterable<Meal>lsitss;
  mealsScreen(this.id, this.title, this.lsitss);

  @override
  _mealsScreenState createState() => _mealsScreenState();
}

class _mealsScreenState extends State<mealsScreen> {


  @override
  Widget build(BuildContext context) {
    final myList = widget.lsitss.where((meal) {
      return meal.categories.contains(widget.id);
    }).toList();
    return Scaffold(
      body: Center(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return mealItem(
                id: myList[index].id,
                myImage: myList[index].imageUrl,
                title: myList[index].title,
                duration: myList[index].duration,
                affordability: myList[index].affordability,
                complexity: myList[index].complexity,
              );
            },
            itemCount: myList.length,
          )),
    );
  }
}
