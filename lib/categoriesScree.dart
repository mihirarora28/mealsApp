import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'elementContainer.dart';
import 'meals.dart';

class categoriesScreen extends StatelessWidget {

  Iterable<Meal> mylist;
  categoriesScreen(this.mylist);

  @override
  Widget build(BuildContext context) {
    print(mylist);
    return GridView(
      padding: EdgeInsets.all(20.0),
      children: DUMMY_CATEGORIES.map((tx) {
        return myContainer(
          id: tx.id,
          title: tx.title,
          color: tx.color,
          lists: mylist,
        );
      }).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 3 / 2),
    );
  }
}
