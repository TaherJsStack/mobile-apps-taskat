import 'package:flutter/material.dart';
import 'package:shopping_app/models/category.dart';
import 'package:shopping_app/scoped-models/main.dart';

import 'package:scoped_model/scoped_model.dart';
import '../scoped-models/main.dart';

class CategoriesPage extends StatefulWidget {
  final MainModel model;
  
  CategoriesPage(this.model);

  @override
  _CategoriesPageState createState() {
    return _CategoriesPageState();
    }
}

class _CategoriesPageState extends State<CategoriesPage> {

  @override
  initState() {
    // widget.model.fetchCategories();
    super.initState();
  }

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Choose'),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/tabs');
            },
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/categories');
            },
          )
        ],
      ),
    );
  }

  Widget _buildCategoriesList(List<Category> category) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        Widget content = Center(child: Text('No category Found!'));
        if (model.displayedCategories.length > 0 && !model.isLoading) {
          content = GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: category.length,
                itemBuilder: (BuildContext context, int index) {
                  return new  InkWell( child:
                    GridTile(
                    child: Image.asset("assets/images/products/prod1.jpg"), 
                    footer: Container( 
                      margin: new EdgeInsets.symmetric(horizontal: 40.0),
                      color: Colors.brown, 
                      child: Text(category[index].name, 
                        textAlign: TextAlign.center, 
                        style: TextStyle(color: Colors.white),),)
                    ),
                    onTap: (){ print('object...');},
                  );
                }
          );
        } else if (model.isLoading) {
          content = Center(child: CircularProgressIndicator());
        }
        return RefreshIndicator(onRefresh: model.fetchCategories, child: content,) ;
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: _buildSideDrawer(context),
      appBar: AppBar(
        title: Text('Categories List'),
        actions: <Widget>[
          ScopedModelDescendant<MainModel>(
            builder: (BuildContext context, Widget child, MainModel model) {
              return IconButton(
                icon: Icon(model.displayFavoritesOnly
                    ? Icons.favorite
                    : Icons.favorite_border),
                onPressed: () {
                  model.toggleDisplayMode();
                },
              );
            },
          )
        ],
      ),
      body: _buildCategoriesList(widget.model.displayedCategories),
    );
  }
}




