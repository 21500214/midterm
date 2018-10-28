import 'package:flutter/material.dart';
import 'device.dart';
import 'favorite.dart';
import 'language_selector_page.dart';
import 'search.dart';
import 'app_translations.dart';
import 'chart.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'app_translations_delegate.dart';
import 'model/product.dart';
import 'application.dart';
import 'home.dart';
import 'dropmenu.dart';

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final Set<Product> _saved = new Set<Product>();

  AppTranslationsDelegate _newLocaleDelegate;

  @override
  void initState() {
    super.initState();
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: null);
    application.onLocaleChanged = onLocaleChange;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(
        saved: _saved,
      ),
      routes:{ 
        '/home': (context) =>HomePage(saved: _saved,),
        '/dropmenu':(context)=>DropMenu(),
        '/device':(context)=>DeviceInfo(),
        '/chart':(context)=>SimpleBarChart(),
        '/favorite':(context)=>FavoriteHotel(),
        },
      // routes: widget.routes,
      localizationsDelegates: [
        _newLocaleDelegate,
        const AppTranslationsDelegate(),
        //provides localised strings
        GlobalMaterialLocalizations.delegate,
        //provides RTL support
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: application.supportedLocales(),
    );
  }

  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
    });
  }
}
