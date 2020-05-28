import 'package:connectivity_test/connectivity_manager.dart';
import 'package:connectivity_test/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider<ConnectivityManager>(
        create: (context) => locator<ConnectivityManager>(),
        child: Consumer<ConnectivityManager>(
          builder: (context, value, child) => Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    color: Colors.green,
                    height: 20,
                    width: 100,
                    child: Text(value.connectivityString),
                  ),
                  Container(
                      child: RaisedButton(
                    onPressed: () async {
                      await value.checkNetwork();
                    },
                    child: Text('Check Network'),
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
