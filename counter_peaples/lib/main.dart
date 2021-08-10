import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de Pessoas", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _infoText = "Pode Entrar!";

  int _peaple = 0;

  void _changePeaple(int delta) {
    setState(() {
      _peaple += delta;

      if (_peaple < 0) {
        _infoText = "Mundo Invertido :O";
      } else if (_peaple <= 9) {
        _infoText = "Pode Entrar!";
      } else {
        _infoText = "Lotado!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Image.asset(
        "img/restaurant.jpg",
        fit: BoxFit.cover,
        height: 1000.0,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Pessoas $_peaple",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                child: Text(
                  "+1",
                  style: TextStyle(color: Colors.white, fontSize: 40.0),
                ),
                onPressed: () {
                  _changePeaple(1);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                  child: Text(
                    "-1",
                    style: TextStyle(color: Colors.white, fontSize: 40.0),
                  ),
                  onPressed: () {
                    _changePeaple(-1);
                  }),
            ),
          ]),
          Text(
            _infoText,
            style: TextStyle(
                color: Colors.blue,
                fontStyle: FontStyle.italic,
                fontSize: 30.0),
          )
        ],
      )
    ]);
  }
}
