import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:helpy/models/posting.dart';
import 'package:helpy/pages/posting/postingPage.dart';
import 'package:helpy/pages/profile/profilePage.dart';
import 'package:helpy/services/database.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
part 'homePage.g.dart';

@hwidget
Widget homePage() {
  final context = useContext();
  final user = Provider.of<User?>(context);
  final currentIndex = useState<int>(0);
  final Color primaryColor = Colors.green;
  final Color bgColor = Color(0xffF9E0E3);
  final Color secondaryColor = Color(0xff324558);

  Widget _buildArticleItem(Posting posting) {
    final postingColor = posting.category == PostingCategory.LawnMowing
        ? primaryColor
        : Colors.blue;
        final formatCurrency = new NumberFormat("#,##0.00", "en_US");
        final formattedPrice = formatCurrency.format(posting.price);
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PostingPage(posting)));
      },
      child: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Container(
              width: 90,
              height: 90,
              color: postingColor,
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
                      posting.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          posting.title,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: postingColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Prix : $formattedPrice \$ ',
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
          title: currentIndex.value == 0 ? Text('Postings') : Text('Profile'),
          bottom: currentIndex.value == 0
              ? TabBar(
                  isScrollable: true,
                  labelColor: primaryColor,
                  indicatorColor: Colors.black26,
                  unselectedLabelColor: secondaryColor,
                  tabs: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Lawn Mowing"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Snow Clearing",
                          style: TextStyle(color: Colors.blue)),
                    ),
                  ],
                )
              : null,
        ),
        body: currentIndex.value == 0
            ? StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
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
                    List<QueryDocumentSnapshot<Map<String, dynamic>>> elements =
                        snapshot.data!.docs;

                    if (elements.isNotEmpty) {
                      return Stack(
                        children: [
                          TabBarView(children: [
                            ListView.separated(
                              itemCount: elements.length,
                              itemBuilder: (context, index) {
                                final elementData = elements[index].data();
                                if (elementData['category'] ==
                                    PostingCategory.LawnMowing.toString()) {
                                  final posting = Posting(
                                    uid: elementData['uid'],
                                    title: elementData['title'],
                                    description: elementData['description'],
                                    price: elementData['price'].toDouble(),
                                    image: elementData['image'],
                                    creatorUID: elementData['creatorUID'],
                                    employeeUID: elementData['employeeUID'],
                                    area: elementData['area'].toDouble(),
                                    phone: elementData['phone'],
                                    address: elementData['address'],
                                    category: PostingCategory.LawnMowing,
                                  );
                                  return _buildArticleItem(posting);
                                }
                                return SizedBox();
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 16.0),
                            ),
                            ListView.separated(
                              itemCount: elements.length,
                              itemBuilder: (context, index) {
                                final elementData = elements[index].data();
                                if (elementData['category'] ==
                                    PostingCategory.SnowClearing.toString()) {
                                  final posting = Posting(
                                    uid: elementData['uid'],
                                    title: elementData['title'],
                                    description: elementData['description'],
                                    price: elementData['price'].toDouble(),
                                    image: elementData['image'],
                                    creatorUID: elementData['creatorUID'],
                                    employeeUID: elementData['employeeUID'],
                                    area: elementData['area'].toDouble(),
                                    phone: elementData['phone'],
                                    address: elementData['address'],
                                    category: PostingCategory.SnowClearing,
                                  );
                                  return _buildArticleItem(posting);
                                }
                                return SizedBox();
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 16.0),
                            ),
                          ])
                        ],
                      );
                    }
                  }
                  return Center(child: Text('No postings found'));
                },
              )
            : ProfilePage(),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: BottomNavigationBar(
            currentIndex: currentIndex.value,
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              print(value);
              currentIndex.value = value;
            },
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
