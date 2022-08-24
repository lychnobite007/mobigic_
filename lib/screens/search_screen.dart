import 'package:flutter/material.dart';
import 'package:mobigic_app/screens/home_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: search,
            onChanged: (value) {
              searchAlphabet(search.text);
              print(value);
            },
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {

                  },
                  icon: search.text.isEmpty
                      ? Icon(Icons.search)
                      : Icon(Icons.close),
                ),
                hintText: 'Search alphabet...'),
          ),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          children: List.generate(
              search.text.length,
              (index) => Container(
                  color: Colors.lightBlueAccent,
                  padding: EdgeInsets.all(16.0),
                  margin: EdgeInsets.all(16.0),
                  child: Center(child: ListTile(
                    title: Center(child: Text(search.text))
                  )))),
        ));
  }

  void searchAlphabet(String query) {
    final suggestions = list.where((e) {
      final input = query.toLowerCase();

      return list.contains(input);
    }
    ).toList();
    setState(() {
      matchQuery = suggestions;
    });
  }
}
