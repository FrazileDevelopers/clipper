import 'package:clipper/constants/constants.dart';
import 'package:clipper/provider/provider.dart';
import 'package:clipper/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfigApp extends StatefulWidget {
  @override
  _ConfigAppState createState() => _ConfigAppState();
}

class _ConfigAppState extends State<ConfigApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.providers(),
      child: MaterialApp(
        title: 'Login',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routers.generateRoute,
        initialRoute: Constants.initial,
      ),
    );
  }
}
