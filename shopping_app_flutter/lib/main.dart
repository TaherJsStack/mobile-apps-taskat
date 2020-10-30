import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';
import 'package:shopping_app/pages/cart.dart';
import 'package:shopping_app/pages/categories.dart';
import 'package:shopping_app/pages/register.dart';
import 'package:shopping_app/tabs.dart';
// import 'package:flutter/rendering.dart';

import './pages/auth.dart';
import './pages/products_admin.dart';
import './pages/products.dart';
import './pages/product.dart';
import './scoped-models/main.dart';
import './models/product.dart';

void main() {
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final MainModel model = MainModel();
    return ScopedModel<MainModel>(
      model: model,
      child: MaterialApp(
        // debugShowMaterialGrid: true,
        theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.pink,
            accentColor: Colors.deepPurple,
            buttonColor: Colors.indigo),
        // home: AuthPage(),
        routes: {
          // '/': (BuildContext context) => AuthPage(model),
          '/': (BuildContext context) => AuthPage(model),
          '/tabs': (BuildContext context) => TabsPage(model),
          '/login': (BuildContext context) => AuthPage(model),
          '/cart': (BuildContext context) => CartPage(),
          '/register': (BuildContext context) => RegisterPage(model),
          '/categories': (BuildContext context) => CategoriesPage(model),
          '/products': (BuildContext context) => ProductsPage(model),
          '/admin': (BuildContext context) => ProductsAdminPage(model),
        },
        onGenerateRoute: (RouteSettings settings) {
          final List<String> pathElements = settings.name.split('/');
          if (pathElements[0] != '') {
            return null;
          }
          if (pathElements[1] == 'product') {
            final String productId = pathElements[2];
            final Product product = model.allProducts.firstWhere((Product product) {
              return product.id == productId;
            });
            return MaterialPageRoute<bool>(
              builder: (BuildContext context) => ProductPage(product),
            );
          }
          return null;
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
              builder: (BuildContext context) => ProductsPage(model));
        },
      ),
    );
  }
}
