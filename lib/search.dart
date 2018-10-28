import 'package:flutter/material.dart';
import 'dart:async';

import 'package:intl/intl.dart';
import 'app.dart';

@visibleForTesting
enum Location {
  Seoul,
  Busan,
  Daegu,
}
@visibleForTesting
enum Room {
  Single,
  Double,
  Family,
}
@visibleForTesting
enum Classes {
  One,
  Two,
  Three,
  Four,
  Five,
}

typedef DemoItemBodyBuilder<T> = Widget Function(DemoItem<T> item);
typedef ValueToString<T> = String Function(T value);

class DualHeaderWithHint extends StatelessWidget {
  const DualHeaderWithHint({this.name, this.value, this.hint, this.showHint});

  final String name;
  final String value;
  final String hint;
  final bool showHint;

  Widget _crossFade(Widget first, Widget second, bool isExpanded) {
    return AnimatedCrossFade(
      firstChild: first,
      secondChild: second,
      firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
      secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
      sizeCurve: Curves.fastOutSlowIn,
      crossFadeState:
          isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return Row(children: <Widget>[
      Expanded(
        flex: 2,
        child: Container(
          margin: const EdgeInsets.only(left: 24.0),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              name,
              style: textTheme.body1.copyWith(fontSize: 15.0),
            ),
          ),
        ),
      ),
      Expanded(
          flex: 3,
          child: Container(
              margin: const EdgeInsets.only(left: 24.0),
              child: _crossFade(
                  Text(value,
                      style: textTheme.caption.copyWith(fontSize: 15.0)),
                  Text(hint, style: textTheme.caption.copyWith(fontSize: 15.0)),
                  showHint)))
    ]);
  }
}

class CollapsibleBody extends StatelessWidget {
  const CollapsibleBody(
      {this.margin = EdgeInsets.zero, this.child, this.onSave, this.onCancel});

  final EdgeInsets margin;
  final Widget child;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return Column(children: <Widget>[
      Container(
          margin: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0) -
              margin,
          child: Center(
              child: DefaultTextStyle(
                  style: textTheme.caption.copyWith(fontSize: 15.0),
                  child: child))),
      const Divider(height: 1.0),
      Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            Container(
                margin: const EdgeInsets.only(right: 8.0),
                child: FlatButton(
                    onPressed: onCancel,
                    child: const Text('CANCEL',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500)))),
            Container(
                margin: const EdgeInsets.only(right: 8.0),
                child: FlatButton(
                    onPressed: onSave,
                    textTheme: ButtonTextTheme.accent,
                    child: const Text('SAVE')))
          ]))
    ]);
  }
}

class DemoItem<T> {
  DemoItem({this.name, this.value, this.hint, this.builder, this.valueToString})
      : textController = TextEditingController(text: valueToString(value));

  final String name;
  final String hint;
  final TextEditingController textController;
  final DemoItemBodyBuilder<T> builder;
  final ValueToString<T> valueToString;
  T value;
  bool isExpanded = false;

  ExpansionPanelHeaderBuilder get headerBuilder {
    return (BuildContext context, bool isExpanded) {
      return DualHeaderWithHint(
          name: name,
          value: valueToString(value),
          hint: hint,
          showHint: isExpanded);
    };
  }

  Widget build() => builder(this);
}

class ExpansionPanelsDemo extends StatefulWidget {
  static const String routeName = '/material/expansion_panels';

  @override
  _ExpansionPanelsDemoState createState() => _ExpansionPanelsDemoState();
}

class _ExpansionPanelsDemoState extends State<ExpansionPanelsDemo> {
  DateTime _date = new DateTime.now();
  TimeOfDay _time = new TimeOfDay.now();
  DateTime _dateout = new DateTime.now();
  TimeOfDay _timeout = new TimeOfDay.now();
  Location savelocation;
  Room saveroom;
  Classes classes;
  final f = new DateFormat('yyyy.MM.dd');

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2020),
    );

    if (picked != null && picked != _date) {
      print("Date selected: ${_date.toString()}");
      setState(() {
        _date = picked;
      });
    }
  }

  Widget _starIcon(String str) {
    // return
    switch (str) {
      case "Classes.One":
        return Row(
          children: <Widget>[
            Icon(Icons.star),
          ],
        );
        break;
      case "Classes.Two":
        return Row(
          children: <Widget>[
            Icon(Icons.star),
            Icon(Icons.star),
          ],
        );
        break;
      case "Classes.Three":
        return Row(
          children: <Widget>[
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
          ],
        );
        break;
      case "Classes.Four":
        return Row(
          children: <Widget>[
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
          ],
        );
        break;
      case "Classes.Five":
        return Row(
          children: <Widget>[
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
          ],
        );
        break;
    }
  }

  Future<Null> _selectOutDate(BuildContext context) async {
    final DateTime pickedout = await showDatePicker(
      context: context,
      initialDate: _dateout,
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2020),
    );

    if (pickedout != null && pickedout != _dateout) {
      print("Date selected: ${_dateout.toString()}");
      setState(() {
        _dateout = pickedout;
      });
    }
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: _time);
    if (picked != null && picked != _time) {
      print("Date selected: ${_time.toString()}");
      setState(() {
        _time = picked;
      });
    }
  }

  Future<Null> _selectOutTime(BuildContext context) async {
    final TimeOfDay pickedout =
        await showTimePicker(context: context, initialTime: _timeout);
    if (pickedout != null && pickedout != _timeout) {
      print("Date selected: ${_timeout.toString()}");

      setState(() {
        _timeout = pickedout;
      });
    }
  }

  Future<Null> _neverSatisfied() async {
    return showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text('Please check your choice:)'),
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.location_on),
                      Text(savelocation.toString()),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.credit_card),
                      Text(saveroom.toString()),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("Rank: "),
                      _starIcon(classes.toString()),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.calendar_today),
                      Row(
                        children: <Widget>[
                          Text('In'),
                          Text(
                            new DateFormat('yyyy-MMM-dd').format(_date),
                            // _date.toString()
                          ),
                          Text(_time.toString()),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text('Out'),
                          Text(
                            new DateFormat('yyyy-MMM-dd').format(_dateout),
                            // _dateout.toString()
                          ),
                          Text(_timeout.toString()),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              new RaisedButton(
                  child: new Text(
                    'Search',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              new RaisedButton(
                  child: new Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }

  bool _value = false;

  //switch
  // void _onChanged(bool active) {
  //   setState(() {
  //     _value = active;
  //     if (_value) {
  //       ExpansionPanelList(
  //           expansionCallback: (int index, bool isExpanded) {
  //             setState(() {
  //               _demoDate[index].isExpanded = !isExpanded;
  //             });
  //           },
  //           children: _demoDate.map<ExpansionPanel>((DemoItem<dynamic> item) {
  //             return ExpansionPanel(
  //                 isExpanded: item.isExpanded,
  //                 headerBuilder: item.headerBuilder,
  //                 body: item.build());
  //           }).toList());
  //     }
  //   });
  // }

//   Widget _onDate() {
//     return ExpansionTile(
// // SwitchListTile(
//       title: Text('Date'),
//       backgroundColor: Colors.white,
//       children: <Widget>[
//         Container(
//           alignment: Alignment.topCenter,
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   (Padding(
//                     padding: EdgeInsets.only(
//                       right: 1.0,
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Row(
//                           children: <Widget>[
//                             Icon(Icons.calendar_today),
//                             Text('Check-in'),
//                           ],
//                         ),
//                         Text(
//                           new DateFormat('yyyy-MMM-dd').format(_date),
//                           // '${_date.toString()}'
//                         ),
//                         Text(
//                             // new DateFormat('hh:mm').format(_time),
//                             '${_time.toString()}'),
//                       ],
//                     ),
//                   )),
//                   Column(
//                     children: <Widget>[
//                       RaisedButton(
//                         child: Text('select date'),
//                         onPressed: () {
//                           _selectDate(context);
//                         },
//                       ),
//                       RaisedButton(
//                         child: Text('select time'),
//                         onPressed: () {
//                           _selectTime(context);
//                         },
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               Row(
//                 children: <Widget>[
//                   (Padding(
//                     padding: EdgeInsets.only(
//                       right: 1.0,
//                     ),
//                     child: Column(
//                       children: <Widget>[
//                         Row(
//                           children: <Widget>[
//                             Icon(Icons.calendar_today),
//                             Text('Check-out'),
//                           ],
//                         ),
//                         Text(
//                           new DateFormat('yyyy-MMM-dd').format(_dateout),
//                           // '${_dateout.toString()}'
//                         ),
//                         Text('${_timeout.toString()}'),
//                       ],
//                     ),
//                   )),
//                   Column(
//                     children: <Widget>[
//                       RaisedButton(
//                         child: Text('select date'),
//                         onPressed: () {
//                           _selectOutDate(context);
//                         },
//                       ),
//                       RaisedButton(
//                         child: Text('select time'),
//                         onPressed: () {
//                           _selectOutTime(context);
//                         },
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
  // }

  List<DemoItem<dynamic>> _demoItems;
  // List<DemoItem<dynamic>> _demoDate;
  List<DemoItem<dynamic>> _demofee;

  @override
  void initState() {
    super.initState();

    _demoItems = <DemoItem<dynamic>>[
      DemoItem<Location>(
          name: 'Location',
          value: Location.Seoul,
          hint: 'Select location',
          valueToString: (Location location) =>
              location.toString().split('.')[1],
          builder: (DemoItem<Location> item) {
            void close() {
              setState(() {
                item.isExpanded = false;
              });
            }

            savelocation = item.value;

            return Form(child: Builder(builder: (BuildContext context) {
              return CollapsibleBody(
                onSave: () {
                  Form.of(context).save();
                  close();
                },
                onCancel: () {
                  Form.of(context).reset();
                  close();
                },
                child: FormField<Location>(
                    initialValue: item.value,
                    onSaved: (Location result) {
                      item.value = result;
                      savelocation = result;
                    },
                    builder: (FormFieldState<Location> field) {
                      return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            RadioListTile<Location>(
                              value: Location.Seoul,
                              title: const Text('Seoul'),
                              groupValue: field.value,
                              onChanged: field.didChange,
                            ),
                            RadioListTile<Location>(
                              value: Location.Busan,
                              title: const Text('Busan'),
                              groupValue: field.value,
                              onChanged: field.didChange,
                            ),
                            RadioListTile<Location>(
                              value: Location.Daegu,
                              title: const Text('Daegu'),
                              groupValue: field.value,
                              onChanged: field.didChange,
                            ),
                          ]);
                    }),
              );
            }));
          }),
      DemoItem<Room>(
          name: 'Room',
          value: Room.Single,
          hint: 'Select room',
          valueToString: (Room room) => room.toString().split('.')[1],
          builder: (DemoItem<Room> item) {
            void close() {
              setState(() {
                item.isExpanded = false;
              });
            }

            saveroom = item.value;

            return Form(child: Builder(builder: (BuildContext context) {
              return CollapsibleBody(
                onSave: () {
                  Form.of(context).save();
                  close();
                },
                onCancel: () {
                  Form.of(context).reset();
                  close();
                },
                child: FormField<Room>(
                    initialValue: item.value,
                    onSaved: (Room result) {
                      item.value = result;
                      saveroom = result;
                    },
                    builder: (FormFieldState<Room> field) {
                      return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            RadioListTile<Room>(
                              value: Room.Single,
                              title: const Text('Signle'),
                              groupValue: field.value,
                              onChanged: field.didChange,
                            ),
                            RadioListTile<Room>(
                              value: Room.Double,
                              title: const Text('Double'),
                              groupValue: field.value,
                              onChanged: field.didChange,
                            ),
                            RadioListTile<Room>(
                              value: Room.Family,
                              title: const Text('Family'),
                              groupValue: field.value,
                              onChanged: field.didChange,
                            ),
                          ]);
                    }),
              );
            }));
          }),
      DemoItem<Classes>(
          name: 'Class',
          value: Classes.Five,
          hint: 'Select hotel Classes',
          valueToString: (Classes classes) => classes.toString().split('.')[1],
          builder: (DemoItem<Classes> item) {
            void close() {
              setState(() {
                item.isExpanded = false;
              });
            }

            classes = item.value;

            return Form(child: Builder(builder: (BuildContext context) {
              return CollapsibleBody(
                onSave: () {
                  Form.of(context).save();
                  close();
                },
                onCancel: () {
                  Form.of(context).reset();
                  close();
                },
                child: FormField<Classes>(
                    initialValue: item.value,
                    onSaved: (Classes result) {
                      item.value = result;
                    },
                    builder: (FormFieldState<Classes> field) {
                      return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            CheckboxListTile(
                              value: false,
                              title: Row(
                                children: <Widget>[
                                  Icon(Icons.star),
                                ],
                              ),
                              onChanged: (bool newValue) {
                                setState(() {
                                  field.didChange(Classes.One);
                                });
                              },
                            ),
                            CheckboxListTile(
                              value: false,
                              title: Row(
                                children: <Widget>[
                                  Icon(Icons.star),
                                  Icon(Icons.star),
                                ],
                              ),
                              onChanged: (bool newValue) {
                                setState(() {
                                  field.didChange(Classes.Two);
                                });
                              },
                            ),
                            CheckboxListTile(
                              value: false,
                              title: Row(
                                children: <Widget>[
                                  Icon(Icons.star),
                                  Icon(Icons.star),
                                  Icon(Icons.star),
                                ],
                              ),
                              onChanged: (bool newValue) {
                                setState(() {
                                  field.didChange(Classes.Three);
                                });
                              },
                            ),
                            CheckboxListTile(
                              value: false,
                              title: Row(
                                children: <Widget>[
                                  Icon(Icons.star),
                                  Icon(Icons.star),
                                  Icon(Icons.star),
                                  Icon(Icons.star),
                                ],
                              ),
                              onChanged: (bool newValue) {
                                setState(() {
                                  field.didChange(Classes.Four);
                                });
                              },
                            ),
                            CheckboxListTile(
                              value: false,
                              title: Row(
                                children: <Widget>[
                                  Icon(Icons.star),
                                  Icon(Icons.star),
                                  Icon(Icons.star),
                                  Icon(Icons.star),
                                  Icon(Icons.star),
                                ],
                              ),
                              onChanged: (bool newValue) {
                                setState(() {
                                  field.didChange(Classes.Five);
                                });
                              },
                            ),
                          ]);
                    }),
              );
            }));
          }),
    ];

    _demofee = <DemoItem<dynamic>>[
      DemoItem<double>(
          name: 'Fee',
          value: 150.0,
          hint: 'Up to 150',
          valueToString: (double amount) => '${amount.round()}',
          builder: (DemoItem<double> item) {
            void close() {
              setState(() {
                item.isExpanded = false;
              });
            }

            return Form(child: Builder(builder: (BuildContext context) {
              return CollapsibleBody(
                onSave: () {
                  Form.of(context).save();
                  close();
                },
                onCancel: () {
                  Form.of(context).reset();
                  close();
                },
                child: FormField<double>(
                  initialValue: item.value,
                  onSaved: (double value) {
                    item.value = value;
                  },
                  builder: (FormFieldState<double> field) {
                    return Slider(
                      min: 150.0,
                      max: 500.0,
                      divisions: 5,
                      activeColor:
                          Colors.blue[100 + (field.value * 5.0).round()],
                      label: '${field.value.round()}',
                      value: field.value,
                      onChanged: field.didChange,
                    );
                  },
                ),
              );
            }));
          }),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var _datePressed;
    var _timePressed;
    var _dateOutPressed;
    var _timeOutPressed;
    if (_value) {
      _datePressed = () {
        _selectDate(context);
      };
    }
    if (_value) {
      _timePressed = () {
        _selectTime(context);
      };
    }
    if (_value) {
      _dateOutPressed = () {
        _selectOutDate(context);
      };
    }
    if (_value) {
      _timeOutPressed = () {
        _selectOutTime(context);
      };
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expansion panels'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          top: false,
          bottom: false,
          child: Container(
            margin: const EdgeInsets.all(24.0),
            child: Column(
              children: <Widget>[
                ExpansionPanelList(
                    expansionCallback: (int index, bool isExpanded) {
                      setState(() {
                        _demoItems[index].isExpanded = !isExpanded;
                      });
                    },
                    children: _demoItems
                        .map<ExpansionPanel>((DemoItem<dynamic> item) {
                      return ExpansionPanel(
                          isExpanded: item.isExpanded,
                          headerBuilder: item.headerBuilder,
                          body: item.build());
                    }).toList()),
                ListTile(
                  title: Container(
                    color: Colors.white,
                    child: new Row(
                      children: <Widget>[
                        Text('Date'),
                        Switch(
                          value: _value,
                          onChanged: (bool value) {
                            setState(() {
                              _value = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  title: new Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Icon(Icons.calendar_today),
                          Text('Check-in'),
                          Text(
                            new DateFormat('yyyy-MMM-dd').format(_date),
                          ),
                          Text('${_time.toString()}'),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          new RaisedButton(
                            child: Text('select date'),
                            onPressed: _datePressed,

                            // _selectDate(context);
                          ),
                          new RaisedButton(
                            child: Text('select time'),
                            onPressed: _timePressed,
                            // _selectTime(context);
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: new Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Icon(Icons.calendar_today),
                          Text('Check-out'),
                          Text(
                            new DateFormat('yyyy-MMM-dd').format(_dateout),
                          ),
                          Text('${_timeout.toString()}'),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          new RaisedButton(
                            child: Text('select date'),
                            onPressed: _dateOutPressed,

                            // _selectDate(context);
                          ),
                          new RaisedButton(
                            child: Text('select time'),
                            onPressed: _timeOutPressed,
                            // _selectTime(context);
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                new ExpansionPanelList(
                    expansionCallback: (int index, bool isExpanded) {
                      setState(() {
                        _demofee[index].isExpanded = !isExpanded;
                      });
                    },
                    children:
                        _demofee.map<ExpansionPanel>((DemoItem<dynamic> fee) {
                      return ExpansionPanel(
                          isExpanded: fee.isExpanded,
                          headerBuilder: fee.headerBuilder,
                          body: fee.build());
                    }).toList()),
                RaisedButton(
                  child: Text('Search'),
                  color: Colors.blue,
                  onPressed: () {
                    _neverSatisfied();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
