import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:programming_language/favorite_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _initialization;

  @override
  void initState() {
    super.initState();
    _initialization = Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('An error occured'),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return FavoriteListScreen();
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
