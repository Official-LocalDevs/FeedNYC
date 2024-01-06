import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodnyc/constants.dart';
import 'package:foodnyc/details.dart';
import 'package:heroicons/heroicons.dart';

class ItemContainer extends StatelessWidget {
  ItemContainer({super.key, required this.datum});

  Map<String, dynamic> datum;
  @override
  Widget build(BuildContext context) {
    //height
    var containerHeight = 100.0;

    // the right arrow
    var containerIcon = GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(
              datum: datum,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: HeroIcon(
          HeroIcons.arrowRight,
          size: 25.0,
        ),
      ),
    );

    //the name of the place and it's address
    var titleAndLabel = Container(
      width: 220,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              datum['name'],
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: labelSize,
              ),
            ),
            Text(
              datum['address'],
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              maxLines: 2,
              style: TextStyle(
                fontSize: tagSize,
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );

    //image
    var containerImage = Container(
      width: containerHeight,
      height: containerHeight,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: lightGray,
            width: 2.0,
          ),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          bottomLeft: Radius.circular(8),
        ),
        child: Image.network(fit: BoxFit.cover, datum['image'].toString()),
      ),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: containerHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2.0,
            color: lightGray,
          ),
        ),
        child: Row(
          children: [
            containerImage,
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  titleAndLabel,
                  containerIcon,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
