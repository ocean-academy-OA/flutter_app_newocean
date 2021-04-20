import 'package:flutter/material.dart';

class NavigateTest extends StatefulWidget {
  @override
  _NavigateTestState createState() => _NavigateTestState();
}

class _NavigateTestState extends State<NavigateTest> {
  bool isCourseMode = false;
  int current = 0;
  List tabs = [
    Wrap(
      spacing: 30,
      runSpacing: 30,
      children: [
        Container(
          color: Colors.blue,
          width: 200,
          height: 200,
        ),
      ],
    ),
    Container(child: Text("latha")),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 1.5,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return tabs[current];
            },
          ),
        ),
        Column(
          children: [
            Testing(),
            BottomNavigationBar(
              currentIndex:
                  current, // this will be set when a new tab is tapped
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu_book,
                  ),
                  title: Text('View All Course'),
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.collections_bookmark_rounded),
                    title: Text('View My Course'))
              ],
              onTap: (int index) {
                setState(() {
                  current = index;
                });
              },
            ),
          ],
        ),

        // tabs[current]
      ]),
    );
  }
}

class Testing extends StatefulWidget {
  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.green,
    );
  }
}
