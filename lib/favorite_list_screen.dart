import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:programming_language/widgets/error_widget.dart';
import 'package:programming_language/widgets/language_item.dart';
=======
import 'package:flutter_svg/flutter_svg.dart';
>>>>>>> 482867260e0ff2b5050d9cddb6dd23a2c35bfd1d

class FavoriteListScreen extends StatefulWidget {
  const FavoriteListScreen();
  @override
  _FavoriteListScreenState createState() => _FavoriteListScreenState();
}

class _FavoriteListScreenState extends State<FavoriteListScreen> {
  static Stream<QuerySnapshot> getStream() => FirebaseFirestore.instance
<<<<<<< HEAD
      .collection("languages")
      .orderBy("likes", descending: true)
=======
      .collection('languages')
      .orderBy('likes', descending: true)
>>>>>>> 482867260e0ff2b5050d9cddb6dd23a2c35bfd1d
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite languages'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: getStream(),
<<<<<<< HEAD
        builder: (BuildContext context, AsyncSnapshot languages) {
          if (languages.hasError) {
            return const ErrorIconWidget();
          }

          if (languages.hasData) {
            final data = languages.data;

=======
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('An error occured'),
            );
          }

          if (snapshot.hasData) {
            final data = snapshot.data;
>>>>>>> 482867260e0ff2b5050d9cddb6dd23a2c35bfd1d
            if (data != null) {
              return ListView.builder(
                itemExtent: 80.0,
                itemCount: data.docs.length,
                itemBuilder: (context, index) => LanguageItem(data.docs[index]),
              );
            } else {
<<<<<<< HEAD
              return const ErrorIconWidget();
            }
          }

          return const Center(child: CircularProgressIndicator());
        },
=======
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
>>>>>>> 482867260e0ff2b5050d9cddb6dd23a2c35bfd1d
      ),
    );
  }
}
