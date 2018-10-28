import 'package:flutter/material.dart';
import 'home.dart';
// import 'search.dart';
import 'chart.dart';
import 'search.dart';
import 'device.dart';
import 'favorite.dart';
import 'model/product.dart';
import 'model/products_repository.dart';

class DropMenu extends StatefulWidget {
  Product product;
  List<Product> products = ProductsRepository.loadProducts(Category.all);
  Set<Product> saved;
  DropMenu({Key key, @required this.saved}) : super(key: key);
  @override
  DropMenuState createState() => new DropMenuState();
}

class DropMenuState extends State<DropMenu> {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new Column(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text(
              'Pages',
              style: TextStyle(fontSize: 20.0),
            ),
            accountEmail: null,
          ),
          new Column(
            children: <Widget>[
              new ListTile(
                title: new Text(
                  'Home',
                  style: TextStyle(color: Colors.blue),
                ),
                leading: new Icon(
                  Icons.home,
                  color: Colors.blue,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(
                            saved: widget.saved,
                          ),
                    ),
                  );
                },
              ),
              new ListTile(
                title: new Text('Search'),
                leading: new IconButton(
                  icon: new Icon(
                    Icons.search,
                    color: Colors.blue,
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
              ),
              new ListTile(
                title: new Text('Favorite Hotel'),
                leading: new Icon(
                  Icons.location_city,
                  color: Colors.blue,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FavoriteHotel(
                            saved: widget.saved,
                          ),
                    ),
                  );
                },
              ),
              new ListTile(
                title: new Text('Ranking'),
                leading: new Icon(
                  Icons.insert_chart,
                  color: Colors.blue,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => new SimpleBarChart(),
                    ),
                  );
                },
              ),
              new ListTile(
                title: new Text('My Page'),
                leading: new Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => new DeviceInfo(),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
