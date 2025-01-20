import 'package:detect_it/main.dart';
import 'package:flutter/material.dart';

/*

WIDGET TILES
------------

Widget Tiles that creates widgets with:

=> Icon.
=> A Title.
=> A Description.
=> An Leading Image.




*/

class WidgetTiles extends StatelessWidget {
  final String title, description, imageAddress;

  final IconData iconData;

  final double number;

  const WidgetTiles({
    super.key,
    required this.title,
    required this.description,
    required this.imageAddress,
    required this.iconData,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: mq.width * .035,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black38.withOpacity(.28),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: mq.width * .05,
                horizontal: mq.height * .05,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  imageAddress,
                  height: mq.height * number,
                  width: mq.width * 1,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Icon
                Icon(
                  iconData,
                  size: 24,
                  color: Colors.white,
                ),

                // Column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title Text
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),

                    // Description Text
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
