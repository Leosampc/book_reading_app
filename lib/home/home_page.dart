import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = ["Android", "IOS", "Java", "Math", "Science", "Drama", "Horror"];

  int _selectedIndex = 0;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(top: 42, left: 24),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    right: 24
                  ),
                  child: Text('Browse',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Text('Recommended',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[400]
                  )
                )
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 6, right: 6
                    ),
                    child: GestureDetector(
                      onTap: () {
                        _selectedIndex = index;
                        setState(() {});
                      },
                      child: Chip(
                        padding: EdgeInsets.only(
                          left: 8, right: 8
                        ),
                        backgroundColor: index == _selectedIndex ? Colors.blue : null,
                        label: Text(categories.elementAt(index),
                          style: TextStyle(
                            color:  index == _selectedIndex ? Colors.white : null,
                          )
                        )
                      ),
                    )
                  );
                },
              ),
            )
          ],
        ),
      )
    );
  }
}