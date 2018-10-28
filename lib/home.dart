import 'package:flutter/material.dart';

import 'model/products_repository.dart';
import 'model/product.dart';
import 'dropmenu.dart';
import 'search.dart';
import 'detail.dart';
import 'language_selector_page.dart';

// import 'search.dart';

class HomePage extends StatefulWidget {
  Product product;
  List<Product> products = ProductsRepository.loadProducts(Category.all);
  final Set<Product> saved;
  HomePage({Key key, @required this.saved}) : super(key: key);
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  List<Card> _buildGridCards(BuildContext context) {
// Set<Product> _saved = new Set<Product>();
    if (widget.products == null || widget.products.isEmpty) {
      return const <Card>[];
    }
    Widget _starIcon(int rank) {
      // return
      switch (rank) {
        case 1:
          return Row(
            children: <Widget>[
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 15.0,
              ),
            ],
          );
          break;
        case 2:
          return Row(
            children: <Widget>[
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 15.0,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 15.0,
              ),
            ],
          );
          break;
        case 3:
          return Row(
            children: <Widget>[
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 15.0,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 15.0,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 15.0,
              ),
            ],
          );
          break;
        case 4:
          return Row(
            children: <Widget>[
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 15.0,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 15.0,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 15.0,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 15.0,
              ),
            ],
          );
          break;
        case 5:
          return Row(
            children: <Widget>[
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 15.0,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 15.0,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 15.0,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 15.0,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 15.0,
              ),
            ],
          );
          break;
      }
    }

// final ThemeData theme = Theme.of(context);
// final NumberFormat formatter = NumberFormat.simpleCurrency(
// locale: Localizations.localeOf(context).toString());
    return widget.products.map((product) {
      return Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 20 / 11,
              child: PhotoHero(
                photo: product.himage,
                width: double.infinity,
                onTap: () {
                  print(widget.saved);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                            product: widget.products[product.id],
                            hsaved: widget.saved,
                          ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _starIcon(product.ranking),
                    Text(
                      product.name,
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold),
                      maxLines: 1,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 8.0),
                        Icon(
                          Icons.location_on,
                          size: 15.0,
                        ),
                        Expanded(
                          child: Text(
                            product.hlocation,
                            softWrap: true,
                            style: TextStyle(fontSize: 10.0),
                          ),
                        ),
                      ],
                    ),
                    new Container(
                      alignment: Alignment.bottomRight,
                      child: new FlatButton(
                          child: new Text(
                            "more",
                            style: TextStyle(color: Colors.blue),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                      product: widget.products[product.id],
                                      hsaved: widget.saved,
                                    ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
// automaticallyImplyLeading: false,
        title: new Center(
          child: new Text('Main', textAlign: TextAlign.center),
        ),

        actions: <Widget>[
          new IconButton(
            icon: new Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExpansionPanelsDemo(),
                ),
              );
            },
          ),
          new IconButton(
            icon: new Icon(
              Icons.tune,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return LanguageSelectorPage();
                }),
              );
            },
          )
        ],
      ),
      body: Center(
        child: OrientationBuilder(builder: (context, orientation) {
          return GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
            padding: EdgeInsets.all(16.0),
            childAspectRatio: 8.0 / 9.0,
            children: _buildGridCards(context),
          );
        }),
      ),
      
      drawer:
       DropMenu(
        saved: widget.saved,
      ),
    );
  }
}

//Hero Animation
class PhotoHero extends StatelessWidget {
  const PhotoHero({Key key, this.photo, this.onTap, this.width})
      : super(key: key);
  final String photo;
  final VoidCallback onTap;
  final double width;
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
