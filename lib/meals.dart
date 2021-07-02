import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

enum Complexity { Simple, Challenging, Hard }
enum Affordability { Affordable, Pricey, Luxurious }

class Meal {
  final String id;
  List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  Meal(
      {this.id = '1',
      this.categories = const ['12w'],
      this.title = '1',
      this.imageUrl = 'w',
      this.ingredients = const ['12w'],
      this.steps = const ['12w'],
      this.duration = 1,
      this.complexity = Complexity.Challenging,
      this.affordability = Affordability.Affordable,
      this.isGlutenFree = false,
      this.isLactoseFree = false,
      this.isVegan = false,
      this.isVegetarian = false});
}
