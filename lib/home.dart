import 'package:flutter/material.dart';
import 'package:foodnyc/tag_picker.dart';
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
  Future<List<Map<String, dynamic>>> data = fetchDataAndUseMap();
  var _boroughs = ["Bronx", "Queens", "Brooklyn", "Manhattan", "Staten Island"];
  var _types = ["Free Groceries", "Food Pantry", "Food Bank", "Soup Kitchen"];
  var _selectedBorough = [true, false, false, false, false];
  var _selectedType = [false, false, false, false];

  _onSelectedType(int index) {
    print(_selectedType[index]);
    setState(() {
      _selectedType[index] = !_selectedType[index];
    });
  }

  _onSelectedBorough(int index) {
    print(_selectedBorough[index]);
    setState(() {
      _selectedBorough[index] = !_selectedBorough[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    var paddingSize = MediaQuery.of(context).size.width * 0.05;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingSize),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
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
            onSelected: _onSelectedBorough,
            boroughs: _boroughs,
            selected: _selectedBorough,
          ),
          SizedBox(
            height: 10,
          ),
          TagPicker(
            label: "Type",
            onSelected: _onSelectedType,
            boroughs: _types,
            selected: _selectedType,
          ),
          SizedBox(
            height: 20,
          ),
          FutureBuilder(
            future: data,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Text(
                    'Hmm, No data available at the moment. Check back in a few!');
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> item = snapshot.data![index];

                      bool boroughSelected =
                          _selectedBorough[_boroughs.indexOf(item['borough'])];
                      bool typeSelected =
                          _selectedType[_types.indexOf(item['type'])];

                      if (boroughSelected || typeSelected) {
                        return ItemContainer(
                          datum: item,
                        );
                      }
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
