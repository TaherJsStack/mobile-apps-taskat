import 'package:flutter/material.dart';
import 'package:travelflutterapp/pages/sign_in_page.dart';
import 'package:travelflutterapp/pages/sign_switch_page.dart';
import 'package:travelflutterapp/pages/sign_up_page.dart';
import 'package:travelflutterapp/pages/tabsbottom.dart';

void main() => runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  @override
  Widget build(BuildContext context) {
    // return TabsBottomPage();
    
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
          '/': (BuildContext context) => SignSwitchPage(),
          '/tabsPage': (BuildContext context) => TabsBottomPage(),
          '/signUpPage': (BuildContext context) => SignUpPage(),
          '/signInPage': (BuildContext context) => SignInPage(),
        },
      )
    );
  }





}





// import 'package:flutter/material.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// void main() => runApp(MaterialApp(home: BottomNavBar()));

// class BottomNavBar extends StatefulWidget {
//   @override
//   _BottomNavBarState createState() => _BottomNavBarState();
// }

// class _BottomNavBarState extends State<BottomNavBar> {
//   int _page = 0;
//   GlobalKey _bottomNavigationKey = GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         bottomNavigationBar: CurvedNavigationBar(
//           key: _bottomNavigationKey,
//           index: 0,
//           height: 50.0,
//           items: <Widget>[
//             Icon(Icons.add, size: 30),
//             Icon(Icons.list, size: 30),
//             Icon(Icons.compare_arrows, size: 30),
//             Icon(Icons.call_split, size: 30),
//             Icon(Icons.perm_identity, size: 30),
//           ],
//           color: Colors.white,
//           buttonBackgroundColor: Colors.white,
//           backgroundColor: Colors.blueAccent,
//           animationCurve: Curves.easeInOut,
//           animationDuration: Duration(milliseconds: 600),
//           onTap: (index) {
//             setState(() {
//               _page = index;
//             });
//           },
//         ),
//         body: Container(
//           color: Colors.blueAccent,
//           child: Center(
//             child: Column(
//               children: <Widget>[
//                 Text(_page.toString(), textScaleFactor: 10.0),
//                 RaisedButton(
//                   child: Text('Go To Page of index 2'),
//                   onPressed: () {
//                     final CurvedNavigationBarState navBarState =
//                         _bottomNavigationKey.currentState;
//                     navBarState.setPage(2);
//                   },
//                 )
//               ],
//             ),
//           ),
//         ));
//   }
// }


