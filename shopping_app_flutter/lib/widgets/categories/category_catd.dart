import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

// import './price_tag.dart';
// import './address_tag.dart';
import '../ui_elements/title_default.dart';
import '../../models/category.dart';
import '../../scoped-models/main.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final int categoryIndex;

  CategoryCard(this.category, this.categoryIndex);

  Widget _buildNameRow() {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TitleDefault(category.name),
          SizedBox(
            width: 8.0,
          ),
          // PriceTag(category.creator.toUpperCase())
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.info),
                color: Theme.of(context).accentColor,
                onPressed: () {
                  print('object');
                },
                // onPressed: () => Navigator
                //         .pushNamed<bool>(context,
                //             '/product/' + model.allProducts[productIndex].id),
              ),
              IconButton(
                icon: Icon(model.allProducts[categoryIndex].isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border),
                color: Colors.red,
                onPressed: () {
                  print('IconButton category card....');
                  // model.selectedCategory(model.allCategories[categoryIndex].id);
                  // model.toggleProductFavoriteStatus();
                },
              ),
            ]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          FadeInImage(
            // image: NetworkImage(category.image),
            height: 300.0,
            fit: BoxFit.cover,
            placeholder: AssetImage('assets/food.jpg'),
          ),
          _buildNameRow(),
          // AddressTag('Union Square, San Francisco'),
          Text(category.description),
          _buildActionButtons(context)
        ],
      ),
    );
  }
}
