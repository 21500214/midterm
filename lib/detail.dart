import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dropmenu.dart';
import 'model/products_repository.dart';
import 'model/product.dart';

// import 'favorite.dart';
class DetailScreen extends StatefulWidget {
  Product product;
  List<Product> products = ProductsRepository.loadProducts(Category.all);
  Set<Product> hsaved;
  DetailScreen({Key key, @required this.product, @required this.hsaved})
      : super(key: key);
  @override
  DetailScreenState createState() => new DetailScreenState();
}

class DetailScreenState extends State<DetailScreen> {
   Widget _starIcon(int rank) {
    // return
    switch (rank) {
      case 1:
        return Row(
          children: <Widget>[
            Icon(Icons.star, color: Colors.yellow, size: 20.0,),
          ],
        );
        break;
      case 2:
        return Row(
          children: <Widget>[
            Icon(Icons.star,color: Colors.yellow, size: 20.0,),
            Icon(Icons.star,color: Colors.yellow, size: 20.0,),
          ],
        );
        break;
      case 3:
        return Row(
          children: <Widget>[
            Icon(Icons.star,color: Colors.yellow, size: 20.0,),
            Icon(Icons.star,color: Colors.yellow, size: 20.0,),
            Icon(Icons.star,color: Colors.yellow, size: 20.0,),
          ],
        );
        break;
      case 4:
        return Row(
          children: <Widget>[
            Icon(Icons.star,color: Colors.yellow, size: 20.0,),
            Icon(Icons.star,color: Colors.yellow, size: 20.0,),
            Icon(Icons.star,color: Colors.yellow, size: 20.0,),
            Icon(Icons.star,color: Colors.yellow, size: 20.0,),
          ],
        );
        break;
      case 5:
        return Row(
          children: <Widget>[
            Icon(Icons.star,color: Colors.yellow, size: 20.0,),
            Icon(Icons.star,color: Colors.yellow, size: 20.0,),
            Icon(Icons.star,color: Colors.yellow, size: 20.0,),
            Icon(Icons.star,color: Colors.yellow, size: 20.0,),
            Icon(Icons.star,color: Colors.yellow, size: 20.0,),
          ],
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool alreadySaved = widget.hsaved.contains(widget.product);
    Widget titleSection = Container(
      padding: const EdgeInsets.fromLTRB(0.0, 32.0, 20.0, 10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  widget.product.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo[800],
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
    );
    
    Widget informationSection = Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.location_on,
                color: Colors.blue,
              ),
              Text(
                widget.product.hlocation,
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.phone,
                color: Colors.blue,
              ),
              Text(
                widget.product.number,
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ],
      ),
    );
    Widget commentSection = Container(
      child: Text(
        widget.product.comment,
        style: TextStyle(color: Colors.blue),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: ListView(children: [
        Stack(
          children: <Widget>[
            PhotoHero(
              photo: widget.product.himage,
              width: double.infinity,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                          product: widget.products[widget.product.id],
                          hsaved: widget.hsaved,
                        ),
                  ),
                );
              },
            ),
            Container(
              alignment: Alignment.topRight,
              child: IconButton(
                  icon: Icon(
                    alreadySaved ? Icons.favorite : Icons.favorite_border,
                    color: alreadySaved ? Colors.red : null,
                    size: 30.0,
                  ),
                  onPressed: () {
                    setState(() {
                      if (alreadySaved) {
                        widget.hsaved.remove(widget.product);
                        print(widget.product);
                      } else {
                        widget.hsaved.add(widget.product);
                      }
                    });
                  }),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20.0, 6.0, 10.0, 0.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
              child:_starIcon(widget.product.ranking),
              ),
              titleSection,
              informationSection,
              Divider(
                height: 40.0,
              ),
              commentSection,
            ],
          ),
        ),
      ]),
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
