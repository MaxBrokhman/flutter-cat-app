import 'package:flutter/material.dart';

import 'package:flutter_application/cat_picture.dart';
import 'package:flutter_application/web_service.dart';

class CatPicturesList extends StatefulWidget {
  @override
  createState() => CatPictureState(); 
}

class CatPictureState extends State<CatPicturesList> {
  List<CatPicture> _catsPictures = List<CatPicture>(); 

  @override
  void initState() {
    super.initState();
    this._populateCatPictures();
  }

  void _populateCatPictures() {
    Webservice().load(CatPicture.all).then((catPictures) => {
      setState(() => {
        _catsPictures = catPictures
      })
    });
  }

  ListTile _buildItemsForListView(BuildContext context, int index) {
    var catId = _catsPictures[index].id;
    return ListTile(
      title: Image.network(_catsPictures[index].url),
      subtitle: Text('This cat id: $catId', style: TextStyle(fontSize: 18)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cats'),
        ),
        body: ListView.builder(
          itemCount: _catsPictures.length,
          itemBuilder: _buildItemsForListView,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _populateCatPictures,
          tooltip: 'Refresh',
          child: Icon(IconData(58837, fontFamily: 'MaterialIcons')),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
  }
}
