import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
part 'homePage.g.dart';

final List<Map> articles = [
  {
    "title": "Need help with my ugly lawn in Montreal, QC",
    "author": "Hamza Lakrati",
    "price": "10.00",
    "image":
        "https://images.unsplash.com/photo-1559702971-54d4089fc5a5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"
  },
];

@hwidget
Widget homePage() {
  final Color primaryColor = Colors.green;
  final Color bgColor = Color(0xffF9E0E3);
  final Color secondaryColor = Color(0xff324558);

  Widget _buildArticleItem(int index) {
    Map article = articles[index];
    // final String sample = images[2];
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Container(
            width: 90,
            height: 90,
            color: bgColor,
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Container(
                  height: 100,
                  color: Colors.blue,
                  width: 80.0,
                  child: Image.network(
                    article["image"],
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 20.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        article["title"],
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: secondaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: article["author"],
                                style: TextStyle(fontSize: 16.0)),
                          ],
                        ),
                        style: TextStyle(height: 2.0),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  final context = useContext();

  return DefaultTabController(
    initialIndex: 0,
    length: 2,
    child: Theme(
      data: ThemeData(
        primaryColor: primaryColor,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          textTheme: TextTheme(
            title: TextStyle(
              color: secondaryColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: IconThemeData(color: secondaryColor),
          actionsIconTheme: IconThemeData(
            color: secondaryColor,
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).buttonColor,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          child: Icon(Icons.add),
          onPressed: () => print('hellow orld'),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text('Postings'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                FontAwesomeIcons.snowflake,
                size: 20,
              ),
              onPressed: () {},
            )
          ],
          bottom: TabBar(
            isScrollable: true,
            labelColor: primaryColor,
            indicatorColor: primaryColor,
            unselectedLabelColor: secondaryColor,
            tabs: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Lawn Mowing"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Snow Clearing"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView.separated(
              padding: const EdgeInsets.all(16.0),
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return _buildArticleItem(index);
              },
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 16.0),
            ),
            Container(
              child: Text("Tab 2"),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(""),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              title: Text(""),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text(""),
            ),
          ],
        ),
      ),
    ),
  );
}
