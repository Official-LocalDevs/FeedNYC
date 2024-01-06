import 'dart:convert' show json;
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

Future<List<Map<String, dynamic>>> fetchData() async {
  try {
    String jsonData = await rootBundle.loadString('assets/data.json');

    List<dynamic> jsonList = json.decode(jsonData);

    List<Map<String, dynamic>> listOfMaps =
        jsonList.cast<Map<String, dynamic>>();

    return listOfMaps;
  } catch (e) {
    print('Error reading JSON file: $e');
    return <Map<String, dynamic>>[]; // Return an empty list in case of an error
  }
}

// Usage:
Future<List<Map<String, dynamic>>> fetchDataAndUseMap() async {
  List<Map<String, dynamic>> data = await fetchData();
  return data;
}
