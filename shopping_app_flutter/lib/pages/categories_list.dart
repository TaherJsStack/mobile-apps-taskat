import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped-models/main.dart';


class CategoriesList extends StatefulWidget {
  final MainModel model;

  CategoriesList(this.model);

  @override
  _CategoriesListState createState() {return _CategoriesListState(); }
}

class _CategoriesListState extends State<CategoriesList> {

  @override
  initState() {
    widget.model.allCategories;
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(model.allCategories[index].name),
              onDismissed: (DismissDirection direction) {
                if (direction == DismissDirection.endToStart) {
                  // model.selectProduct(model.allProducts[index].id);
                  // model.deleteProduct();
                } else if (direction == DismissDirection.startToEnd) {
                  print('Swiped start to end');
                } else {
                  print('Other swiping');
                }
              },
              background: Container(color: Colors.red),
              child: Column(
                children: <Widget>[
                  Text(model.allCategories[index].name)
                  // ListTile(
                  //   leading: CircleAvatar(
                  //     backgroundImage:
                  //         NetworkImage(model.allProducts[index].image),
                  //   ),
                  //   title: Text(model.allProducts[index].title),
                  //   subtitle:
                  //       Text('\$${model.allProducts[index].price.toString()}'),
                  //   // trailing: _buildEditButton(context, index, model),
                  // ),
                  // Divider()
                ],
              ),
            );
          },
          itemCount: model.allProducts.length,
        );
      },
    );
  }
}