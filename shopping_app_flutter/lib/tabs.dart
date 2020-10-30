import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shopping_app/scoped-models/main.dart';
import 'package:shopping_app/widgets/drawer.dart';
import './pages/about.dart';
import './pages/home.dart';
import './pages/profile.dart';
import './widgets/drawer.dart';
// import 'package:flutterapp/pages/products.dart';
// import 'package:flutterapp/widgets/products/products.dart';

class TabsPage extends StatefulWidget {
  final MainModel model;

  TabsPage(this.model);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<TabsPage> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    widget.model.fetchCategories();
    super.initState();
    _pageController = PageController();
    print('TabsPage => initState');
  }

  @override
  void dispose() {
    print('TabsPage => dispose');
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(),
      appBar: AppBar(
        title: Text('SHOPPING....'),
        actions: <Widget>[
          
            IconButton(
            icon: Icon( Icons.shopping_cart),
            onPressed: () {
              // Navigator.pushReplacementNamed(context, '/products');
              Navigator.of(context).pushNamed("/cart");
              // model.toggleDisplayMode();
            },
          ),

          ScopedModelDescendant<MainModel>(
            builder: (BuildContext context, Widget child, MainModel model) {
              return IconButton(
                icon: Icon(model.displayFavoritesOnly
                    ? Icons.shopping_cart
                    : Icons.shopping_cart),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/products');
                  model.toggleDisplayMode();
                },
              );
            },
          )
        
        ],
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);  
          },
          children: <Widget>[
            Container(
              color: Colors.indigo[50],
              child: HomePage(widget.model),
            ),
            Container(
              color: Colors.red,
              child: ProfilePage(),
            ),
            Container(
              color: Colors.green,
              child: AboutPage(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(title: Text('HOME'), icon: Icon(Icons.home)),
          BottomNavyBarItem(title: Text('PROFILE'), icon: Icon(Icons.person)),
          BottomNavyBarItem(title: Text('ABOUT US'), icon: Icon(Icons.info)),
          // BottomNavyBarItem(
          //   title: Text('Item One'),
          //   icon: Icon(Icons.settings)
          // ),
        ],
      ),
    );
  }
}
