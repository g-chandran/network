import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String connectivityString = 'Offline';
  Connectivity _connectivity = Connectivity();
  // StreamSubscription<ConnectivityResult> _streamSubscription;

  @override
  void initState() {
    checkNetwork();
    _connectivity.onConnectivityChanged
        .listen((event) => updateConnection(event));
    super.initState();
  }

  Future checkNetwork() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      print('mobile');
      setState(() {
        connectivityString = 'Mobile';
      });
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print('wifi');
      setState(() {
        connectivityString = 'Wi-Fi';
      });
    } else {
      print('Offline');
      setState(() {
        connectivityString = 'Offline';
      });
    }
  }

  Future updateConnection(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.mobile:
        setState(() {
          connectivityString = 'Mobile';
        });
        break;
      case ConnectivityResult.wifi:
        setState(() {
          connectivityString = 'Wi-Fi';
        });
        break;
      case ConnectivityResult.none:
        setState(() {
          connectivityString = 'Offline';
        });
        break;
      default:
        setState(() {
          connectivityString = 'Offline';
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                color: Colors.green,
                height: 20,
                width: 100,
                child: Text(connectivityString),
              ),
              Container(
                  child: RaisedButton(
                onPressed: () async {
                  await checkNetwork();
                },
                child: Text('Check Network'),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
