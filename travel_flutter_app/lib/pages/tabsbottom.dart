import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:travelflutterapp/pages/home_page_routes.dart';
import './page1.dart';
import './page2.dart';

class TabsBottomPage extends StatefulWidget {
  TabsBottomPage({Key key}) : super(key: key);

  @override
  _TabsBottomPageState createState() => _TabsBottomPageState();
}

class _TabsBottomPageState extends State<TabsBottomPage> {

  int _pageIndex = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

// ListTile(
//   leading: Icon(Icons.tab),
//   title: Text('Home'),
//   onTap: () {
//     Navigator.pushReplacementNamed(context, '/tabs');
//   },
// ),


  List pages = [
    MyRoute(
      iconData: Icons.home,
      page: HomePageRoutes(),
    ),
    MyRoute(
      iconData: Icons.room_service,
      page: Page1(),
    ),
    MyRoute(
      iconData: Icons.explore,
      page:  Page2(),
    ),
    MyRoute(
      // iconData: Icons.person_pin_circle,
      iconData: Icons.all_out,
      page: Page1(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 50.0,
        items: pages
            .map((p) => Icon(
                  p.iconData,
                  size: 30,
                  color: Colors.white,
                ))
            .toList(),
            
        color: Colors.blue,
        buttonBackgroundColor: Colors.blue,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
      backgroundColor: Colors.white,
      body: pages[_pageIndex].page,
    );
  
  }
}


class MyRoute {
  final IconData iconData;
  final Widget page;
  MyRoute({this.iconData, this.page});
}

