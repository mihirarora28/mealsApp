import 'package:flutter/material.dart';
import 'meals.dart';
import 'meals_screen.dart';

class myContainer extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  final Iterable<Meal> lists;

  myContainer({this.id = '1', this.title = 'mihir', this.color = Colors.blue, this.lists = const[]});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).accentColor,
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => mealsScreen(id, title,lists))),
      child: Container(
        padding: EdgeInsets.all(12.0),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color.withOpacity(0.6), color],
            )),
      ),
    );
  }
}
