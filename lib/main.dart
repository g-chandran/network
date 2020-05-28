import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

enum Status { Mobile, Wifi, Offline }

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
  Status status = Status.Offline;

  Future checkNetwork() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      print('mobile');
      setState(() {
        status = Status.Mobile;
      });
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print('wifi');
      setState(() {
        status = Status.Wifi;
      });
    } else {
      print('No network');
      setState(() {
        status = Status.Mobile;
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
                child: Text(status == Status.Offline
                    ? 'Offline'
                    : status == Status.Mobile ? 'Mobile' : 'Wi-Fi'),
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
