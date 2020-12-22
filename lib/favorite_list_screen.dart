import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoriteListScreen extends StatefulWidget {
  const FavoriteListScreen();
  @override
  _FavoriteListScreenState createState() => _FavoriteListScreenState();
}

class _FavoriteListScreenState extends State<FavoriteListScreen> {
  static Stream<QuerySnapshot> getStream() => FirebaseFirestore.instance
      .collection('languages')
      .orderBy('likes', descending: true)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite languages'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: getStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('An error occured'),
            );
          }

          if (snapshot.hasData) {
            final data = snapshot.data;
            if (data != null) {
              return ListView.builder(
                itemExtent: 80.0,
                itemCount: data.docs.length,
                itemBuilder: (context, index) => LanguageItem(data.docs[index]),
              );
            } else {
              return Center(
                child: Text('An error occured'),
              );
            }
          }

          return const Center(
            child: Text('An error occured'),
          );
        },
      ),
    );
  }
}

class LanguageItem extends StatelessWidget {
  final String name;
  final int likes;
  final String asset;
  final QueryDocumentSnapshot _snapshot;
  LanguageItem(this._snapshot)
      : asset = _snapshot.get("image") as String,
        likes = _snapshot.get("likes") as int,
        name = _snapshot.get("name") as String;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        "images/$asset",
        height: 40,
      ),
      title: Text(name),
      subtitle: Text("Total likes: $likes"),
      trailing: IconButton(
        icon: const Icon(Icons.thumb_up),
        onPressed: () {},
      ),
    );
  }
}
