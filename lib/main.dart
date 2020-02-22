import 'package:flutter/material.dart';

import 'package:flutter_application/cat_pictures_list.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Networking",
      home: CatPicturesList()
    );
  }
}
