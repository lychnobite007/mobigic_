import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int cols = 2;
int rows = 3;

TextEditingController row = TextEditingController();
TextEditingController column = TextEditingController();
TextEditingController alphabet = TextEditingController();
TextEditingController search = TextEditingController();

Set<String> tempList = {'a', 'b', 'c', 'd', 'e', 'f'};

List<String> list = tempList.toList();

List matchQuery = [];
Set<String> matchData = {};

List<bool> bools = [false, false, false, false, false, false];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridGame'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10.0),
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: TextField(
                controller: search,
                onChanged: (value) {
                  matchData = {};
                  searchAlphabet(search.text);

                  for (int i = 0; i < search.text.length; i++) {
                    if (list.contains(search.text[i]))
                      matchData.add(search.text[i]);
                  }
                },
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          searchAlphabet(search.text);
                        },
                        icon: Icon(Icons.search)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70, width: 1.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70, width: 1.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70, width: 1.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    contentPadding: EdgeInsets.all(10.0),
                    label: Text('Search alphabet...')),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 400,
              child: search.text.isEmpty
                  ? GridView.builder(
                      itemCount: cols * rows,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: cols,
                          childAspectRatio: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      itemBuilder: (context, index) => Container(
                            color: Colors.lightBlueAccent,
                            child: Center(
                              child: list.length < rows * cols
                                  ? Text(
                                      'Enter more than ${rows * cols} or ${rows * cols}  letters')
                                  : bools[index]
                                      ? Text(list[index].toString(),
                                          style: TextStyle(color: Colors.white))
                                      : Text(list[index].toString(),
                                          style: TextStyle(color: Colors.white)),
                            ),
                          ))
                  : GridView.count(
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      crossAxisCount: 3,
                      children: List.generate(
                          search.text.length,
                          (index) => Container(
                              color: Colors.lightBlueAccent,
                              padding: EdgeInsets.all(16.0),
                              margin: EdgeInsets.all(16.0),
                              child: Center(
                                  child: ListTile(
                                      title: Center(
                                          child: Container(
                                              height: 30,
                                              width: 30,
                                              color: Colors.blueGrey,
                                              child: Center(
                                                  child: Text(matchData.isEmpty ? 'Alphabet does not exist' : matchData
                                                      .elementAt(index))))))))),
                    ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text(
                    'Rows',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                      height: 40,
                      width: 50,
                      child: TextField(
                        controller: row,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white70)),
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text(
                    'Columns',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                      height: 40,
                      width: 50,
                      child: TextField(
                        controller: column,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white70)),
                        ),
                      )),
                  SizedBox(
                    width: 170,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        rows = int.parse(row.text);
                        cols = int.parse(column.text);
                        setState(() {});
                        row.clear();
                        column.clear();
                      },
                      child: Text('Update')),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Enter Alphabet',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(
                    height: 40,
                    width: 50,
                    child: TextField(
                      controller: alphabet,
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white70)),
                      ),
                    )),
                SizedBox(
                  width: 130,
                ),
                ElevatedButton(
                    onPressed: () {
                      list.add(alphabet.text);
                      setState(() {});
                      alphabet.clear();
                    },
                    child: Text('Add'))
              ],
            ),
          ],
        ),
      ),
    );
  }

  void searchAlphabet(String query) {
    final suggestions = list.where((e) {
      final input = query.toLowerCase();

      return list.contains(input);
    }).toList();
    setState(() {
      matchQuery = suggestions;
    });
  }
}
