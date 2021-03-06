import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:helpy/modules/posting_creation.dart';
import 'package:helpy/pages/index.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:helpy/providers/index.dart';
import 'package:provider/provider.dart';

part 'app.g.dart';


@hwidget
Widget app() {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  return MultiProvider(
    providers: [
      Provider<AuthenticationProvider>(
          create: (context) => AuthenticationProvider(FirebaseAuth.instance)),
      StreamProvider(
          create: (context) => context.read<AuthenticationProvider>().authState,
          initialData: null),
      ChangeNotifierProvider<PostingCreation>.value(value: PostingCreation()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => HomePage(),
        '/auth': (context) => AuthPage(),
        '/createPosting': (context) => CreatePostingPage(),
      },
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('An error occured'),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return AuthWrapper();
          }
          return Text('Loading...');
        },
      ),
    ),
  );
}

@hwidget
Widget authWrapper() {
  final context = useContext();
  final user = Provider.of<User?>(context);
  if (user == null) {
    return AuthPage();
  } else {
    return HomePage();
  }
}
