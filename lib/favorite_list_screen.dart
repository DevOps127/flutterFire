import 'package:flutter/material.dart';

class FavoriteListScreen extends StatefulWidget {
  const FavoriteListScreen();
  @override
  _FavoriteListScreenState createState() => _FavoriteListScreenState();
}

class _FavoriteListScreenState extends State<FavoriteListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite languages'),
      ),
      body: Center(
        child: Text('List of my favorites languages'),
      ),
    );
  }
}
