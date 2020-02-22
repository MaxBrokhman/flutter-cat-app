import 'dart:convert' as JSON;

import 'package:flutter_application/resource.dart';

const catsUrl = 'https://api.thecatapi.com/v1/images/search?limit=10&page=1&order=Desc';

class CatPicture {
  final String id; 
  final String url; 

  CatPicture({this.id, this.url});

  factory CatPicture.fromJson(Map<String,dynamic> json) {
    return CatPicture(
      id: json['id'], 
      url: json['url']
    );
  }
  static Resource<List<CatPicture>> get all {
    return Resource(
      url: catsUrl,
      parse: (response) {
        final result = JSON.jsonDecode(response.body); 
        Iterable list = result;
        return list.map((model) => CatPicture.fromJson(model)).toList();
      }
    );
  }
}
