import 'package:flutter/material.dart';
import 'model/product.dart';
import 'model/products_repository.dart';
import 'dropmenu.dart';
import 'home.dart';

class FavoriteHotel extends StatefulWidget {
  Product product;
  List<Product> products = ProductsRepository.loadProducts(Category.all);
  Set<Product> saved;
  FavoriteHotel({Key key, @required this.saved}) : super(key: key);
  @override
  FavoriteHotelState createState() => new FavoriteHotelState();
}

class FavoriteHotelState extends State<FavoriteHotel> {
  @override
  Widget build(BuildContext context) {
    final List<String> items = widget.saved.map((Product product) {
      return product.name;
    }).toList();
    return new Scaffold(
        appBar: new AppBar(
          title: const Text('Saved Suggestions'),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return new Dismissible(
              key: new Key(item),
              onDismissed: (direction) {
                items.remove(item);
                widget.saved.remove(item);
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text("$item dismissed")));
              },
              background: Container(color: Colors.red),
              child: ListTile(title: Text("${item}")),
            );
          },
        ));
  }
}
