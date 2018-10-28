import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
class SimpleBarChart extends StatelessWidget {
@override
Widget build(BuildContext context) {
var data = [
new HotelRanking('Silla Stay', 12),
new HotelRanking('Ramada', 42),
new HotelRanking('Pohang', 34),
];
var series = [
new charts.Series(
domainFn: (HotelRanking clickData, _) => clickData.hotelName,
measureFn: (HotelRanking clickData, _) => clickData.rank,
id: 'Ranking',
data: data,
),
];
var chart = new charts.BarChart(
series,
animate: true,
);
var chartWidget = new Padding(
padding: new EdgeInsets.all(32.0),
child: new SizedBox(
height: 200.0,
child: chart,
),
);
return new Scaffold(
appBar: new AppBar(
title: new Text('Hotel Users Ranking'),
),
body: new Center(
child: new Column(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
chartWidget,
],
),
),
);
}
}
class HotelRanking {
final String hotelName;
final int rank;
HotelRanking(this.hotelName, this.rank);
}
