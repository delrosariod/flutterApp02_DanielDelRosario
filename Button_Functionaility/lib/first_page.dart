import 'package:flutter/material.dart';

class MyFirstPage extends StatefulWidget {
  @override
  _MyFirstPageState createState() => _MyFirstPageState();
}

class _MyFirstPageState extends State<MyFirstPage> {
  bool _enabled = false;
  String _msg2 = '';
  int _count = 0;

  String _msg1(bool isEnabled, int count) {
    if(!isEnabled) {
      return '';
    }
    else if (count==0) {
      return 'Click Me';
    }
    else{
      return 'Clicked $count';
    }
  }


  @override
  Widget build(BuildContext context) {
    Object onPressed1() {
      if (_enabled) {
        return () {
          setState(() {
            _count++;
            print('count is $_count');
          },
          );
        };
      } else {
        return null;
      }
    }

    Object resetCounter() {
      if (_enabled) {
        return () {
          setState(() {
            _count = 0;
            print('Count Reset!');
          },
          );
        };
      } else {
        return null;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Button Functionality'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('enable functionality'),
                Switch(
                    value: _enabled,
                    onChanged: (bool onChangedValue) {
                      _enabled = onChangedValue;
                      setState(() {
                        if (_enabled) {
                          _msg2 = 'Reset';
                        } else {
                          _msg2 = '';
                        }
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 8,
                    textColor: Colors.red.shade100,
                    color: Colors.redAccent,
                    highlightColor: Colors.blue,
                    splashColor: Colors.green.shade300,
                    padding: EdgeInsets.all(20.0),
                    onPressed: onPressed1(),
                    child: Text(_msg1(_enabled, _count)),
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(20),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 8,
                      textColor: Colors.red.shade100,
                      color: Colors.blueAccent,
                      highlightColor: Colors.red,
                      splashColor: Colors.green.shade300,
                      padding: EdgeInsets.all(20.0),
                      onPressed: resetCounter(),
                      child: Text(_msg2),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
