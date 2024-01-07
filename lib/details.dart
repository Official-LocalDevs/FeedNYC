import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodnyc/constants.dart';
import 'package:heroicons/heroicons.dart';

class Details extends StatefulWidget {
  Details({Key? key, required this.datum}) : super(key: key);

  Map<String, dynamic> datum;
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    var paddingSize = MediaQuery.of(context).size.width * 0.05;
    var containerHeight = 150.0;

    var containerImage = Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 210,
          child: ClipRRect(
            child: Image.network(
                fit: BoxFit.cover, widget.datum["image"].toString()),
          ),
        ),
        SafeArea(
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context); // This will go back to the previous page
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: paddingSize),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: green4,
                ),
                padding: EdgeInsets.all(10),
                child: HeroIcon(
                  color: Colors.white,
                  HeroIcons.arrowLeft,
                  size: 25.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      body: Column(
        children: [
          containerImage,
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: paddingSize),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.datum['name'],
                    style: TextStyle(
                      color: green4,
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    widget.datum['address'],
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      child: Text(
                        widget.datum['borough'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: green4,
                          fontSize: tagSize,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: green1,
                      border: Border.all(
                        style: BorderStyle.solid,
                        color: green4,
                        width: 1.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      child: Text(
                        widget.datum['type'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: green4,
                          fontSize: tagSize,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: green1,
                      border: Border.all(
                        style: BorderStyle.solid,
                        color: green4,
                        width: 1.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Hours of Operation",
                    style: TextStyle(
                      fontSize: labelSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 2.0),
                      shrinkWrap: true,
                      itemCount: widget.datum['hours'].length,
                      itemBuilder: (context, index) {
                        List<dynamic> workDay = widget.datum["hours"][index];
                        return Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(workDay[0]),
                              Text(workDay[1]),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
