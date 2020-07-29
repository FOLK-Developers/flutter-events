import 'package:flutter/material.dart';
import 'package:flutter_appfinal1/eventlist.dart';
import 'package:flutter_appfinal1/eventdetail.dart';
import 'package:folkeventsapp_ui/eventdetail.dart';





void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // https://stackoverflow.com/questions/44004451/navigator-operation-requested-with-a-context-that-does-not-include-a-navigator
  final _navKey  = GlobalKey<NavigatorState>();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Folk Event',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade300,
        primarySwatch: Colors.red,
        accentColor: Colors.indigo,
      ),
      home:  EventDetail(),


    );
  }
}