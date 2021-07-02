import 'package:flutter/material.dart';
import 'package:meals_app/mealdetails.dart';
import 'package:meals_app/meals.dart';

class mealItem extends StatelessWidget {
  final String id;
  final String myImage;
  final String title;
  final int duration;
  final affordability;
  final complexity;
  mealItem(
      {this.id = '1',
      this.myImage = '1',
      this.title = '3',
      this.duration = 1,
      this.affordability = Affordability.Affordable,
      this.complexity = Complexity.Hard});

  void onClick() {}

  String get affor {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Luxurious';
      case Affordability.Pricey:
        return 'Pricey';
      default:
        return 'Unknown';
    }
  }

  String get comp {
    switch (complexity) {
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      case Complexity.Simple:
        return 'Simple';
      default:
        return 'Unknown';
    }
  }

  void goonit(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: InkWell(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => mealDetails(id))).then((value){
              print("$value");
        }),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          margin: EdgeInsets.all(15.0),
          elevation: 4.0,
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                      child: Image.network(myImage,
                          height: 250.0,
                          width: double.infinity,
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0))),
                  Positioned(
                    bottom: 20.0,
                    right: 10.0,
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      width: 250.0,
                      color: Colors.black54,
                      child: Text(
                        title,
                        style: TextStyle(color: Colors.white, fontSize: 26),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text('${duration.toString()}' + 'min'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.directions_boat_filled_sharp),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text('${comp}'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.monetization_on),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          '${affor}',
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
