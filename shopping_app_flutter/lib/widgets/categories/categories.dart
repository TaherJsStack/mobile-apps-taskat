import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';
import 'package:shopping_app/widgets/categories/category_catd.dart';

import '../../models/category.dart';
import '../../scoped-models/main.dart';

class Categories extends StatelessWidget {
  Widget _buildCategoriesList(List<Category> category) {
    Widget categoryCards;
    if (category.length > 0) {
   
      categoryCards = ListView.builder(
        itemCount: category.length,
        itemBuilder: (BuildContext context, int index) {
          Container(child: Text(category[index].name),);
        }
            // CategoryCard(category[index], index),
      );
    } else {
      categoryCards = Container( child: Text('_buildCategoriesList'),);
    }
    return categoryCards;
  }

  @override
  Widget build(BuildContext context) {
    print('[categories Widget] build()');
    return ScopedModelDescendant<MainModel>(builder: (BuildContext context, Widget child, MainModel model) {
      return  _buildCategoriesList(model.displayedCategories);
    },);
  }
}
