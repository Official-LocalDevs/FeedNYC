import 'package:flutter/material.dart';
import 'package:foodnyc/borough_picker.dart';
import 'package:foodnyc/constants.dart';
import 'package:foodnyc/helper_functions.dart';
import 'package:foodnyc/item_container.dart';
import 'package:heroicons/heroicons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var paddingSize = MediaQuery.of(context).size.width * 0.05;
    Future<List<Map<String, dynamic>>> data = fetchDataAndUseMap();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingSize),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Feed NYC",
                style: TextStyle(
                  color: green4,
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                ),
              ),
              HeroIcon(
                HeroIcons.magnifyingGlass,
                style: HeroIconStyle
                    .outline, // Outlined icons are used by default.
                color: green4,
                size: 30,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          TagPicker(
            label: "Borough",
            boroughs: [
              "Bronx",
              "Queens",
              "Brooklyn",
              "Manhattan",
              "Staten Island"
            ],
            selected: [false, false, false, false, false],
          ),
          SizedBox(
            height: 10,
          ),
          TagPicker(
            label: "Type",
            boroughs: [
              "Free Groceries",
              "Food Pantry",
              "Food Bank",
              "Soup Kitchen"
            ],
            selected: [false, false, false, false],
          ),
          SizedBox(
            height: 20,
          ),
          FutureBuilder(
            future: data,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(); // Show a loader while fetching data
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Text(
                    'Hmm, No data available at the moment. Check back in a few!');
              } else {
                return Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ItemContainer(
                          datum: snapshot.data![index],
                        );
                      }),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
