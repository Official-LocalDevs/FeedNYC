import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<ApiData> fetchPokemonData() async {
  final response =
      await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/'));

  if (response.statusCode == 200) {
    return ApiData.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load Pokemon data');
  }
}

class ApiData {
  final List<String> pokemonNames;

  const ApiData({
    required this.pokemonNames,
  });

  factory ApiData.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('results')) {
      final List<dynamic> results = json['results'];
      final List<String> pokemonNames =
          results.map((result) => result['name'].toString()).toList();

      return ApiData(
        pokemonNames: pokemonNames,
      );
    } else {
      throw const FormatException('Failed to load data.');
    }
  }
}

void main() {
  runApp(DataPage());
}

class DataPage extends StatefulWidget {
  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  late Future<ApiData> futurePokemonData;

  @override
  void initState() {
    super.initState();
    futurePokemonData = fetchPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon Data Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pokemon Data'),
        ),
        body: Center(
          child: FutureBuilder<ApiData>(
            future: futurePokemonData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Pokemon Names:',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: snapshot.data!.pokemonNames.map((name) {
                        return Text(name, style: TextStyle(fontSize: 18));
                      }).toList(),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
