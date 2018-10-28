import 'package:flutter/foundation.dart';

enum Category { all, hotel, resort, }

class Product {
  const Product({
    @required this.isFeatured,
    @required this.name,
    @required this.himage,
    @required this.hlocation,
    @required this.category,
    @required this.id,
    @required this.number,
    @required this.comment,
    @required this.ranking,
    // @required this.hicon,

  })  : assert(isFeatured != null),
        assert(name != null),
        assert(himage != null),
        assert(category!= null),
        assert(id!=null),
        assert(number!=null),
        assert(comment!=null),
        assert(ranking!=null),
        assert(hlocation!= null);

  final bool isFeatured;
  final String name;
  final String himage;
  final String hlocation;
  final int id;
  final Category category;
  final String number;
  final String comment;
  final int ranking;
  // final String hicon;

  @override
  String toString() => "$name (id=$id)";
}