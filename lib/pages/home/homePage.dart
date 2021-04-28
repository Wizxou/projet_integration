import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:helpy/components/forms/createPostingForm.dart';
import 'package:helpy/models/index.dart';
import 'package:helpy/services/database.dart';
part 'homePage.g.dart';

@hwidget
Widget homePage() {
  final context = useContext();
  final formVisible = useState(false);
  final Color primaryColor = Colors.green;
  final Color bgColor = Color(0xffF9E0E3);
  final Color secondaryColor = Color(0xff324558);

  Widget _buildArticleItem(Posting? posting) {
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
                    posting?.image ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 20.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        posting?.title ?? '',
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
                                text: '${posting?.price ?? ''}',
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          child: Icon(Icons.add),
          onPressed: () => Navigator.pushNamed(context, '/createPosting'),
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
        body: Stack(
          children: [
            TabBarView(
              children: [
                StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: DatabaseService().postings,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    }

                    if (snapshot.hasData) {
                      List<QueryDocumentSnapshot<Map<String, dynamic>>>
                          elements = snapshot.data!.docs;

                      if (elements.isNotEmpty) {
                        return new ListView.separated(
                          itemCount: elements.length,
                          itemBuilder: (context, index) {
                            final elementData = elements[index].data();
                            final posting = Posting(
                              title: elementData['title'],
                              description: elementData['description'],
                              price: elementData['price'].toDouble(),
                              image: elementData['image'],
                              creatorUID: elementData['creatorUID'],
                              employeeUID: elementData['employeeUID'],
                              category: PostingCategory.LawnMowing,
                            );
                            return _buildArticleItem(posting);
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 16.0),
                        );
                      }
                    }
                    return Text('hello');
                  },
                ),
                Text('hello')
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: BottomNavigationBar(
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
            ],
          ),
        ),
      ),
    ),
  );
}
