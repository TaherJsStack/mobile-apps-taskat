import 'package:flutter/material.dart';
import 'package:travelflutterapp/pages/home.dart';
import 'package:travelflutterapp/pages/page1.dart';
import 'package:travelflutterapp/pages/ticket.dart';
class HomePageRoutes extends StatefulWidget {
  HomePageRoutes({Key key}) : super(key: key);

  @override
  _HomePageRoutesState createState() => _HomePageRoutesState();
}

class _HomePageRoutesState extends State<HomePageRoutes> {
  @override
  Widget build(BuildContext context) {
        return Container( 
      child: MaterialApp(
          debugShowCheckedModeBanner: false,

        // debugShowMaterialGrid: true,
        // theme: ThemeData(
        //     brightness: Brightness.light,
        //     primarySwatch: Colors.pink,
        //     accentColor: Colors.deepPurple,
        //     buttonColor: Colors.indigo),
        // home: AuthPage(),
        routes: {
          '/': (BuildContext context) => HomePage(),
          '/ticketpage': (BuildContext context) => TicketPage(),
          '/page1': (BuildContext context) => Page1(),
        },
      )
    );
  }
}