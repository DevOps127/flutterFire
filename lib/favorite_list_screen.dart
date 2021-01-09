import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:programming_language/widgets/error_widget.dart';
import 'package:programming_language/widgets/language_item.dart';

class FavoriteListScreen extends StatefulWidget {
  const FavoriteListScreen();
  @override
  _FavoriteListScreenState createState() => _FavoriteListScreenState();
}

class _FavoriteListScreenState extends State<FavoriteListScreen> {
  static Stream<QuerySnapshot> getStream() => FirebaseFirestore.instance
      .collection("languages")
      .orderBy("likes", descending: true)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite languages'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: getStream(),
        builder: (BuildContext context, AsyncSnapshot languages) {
          if (languages.hasError) {
            return const ErrorIconWidget();
          }

          if (languages.hasData) {
            final data = languages.data;

            if (data != null) {
              return ListView.builder(
                itemExtent: 80.0,
                itemCount: data.docs.length,
                itemBuilder: (context, index) => LanguageItem(data.docs[index]),
              );
            } else {
              return const ErrorIconWidget();
            }
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
