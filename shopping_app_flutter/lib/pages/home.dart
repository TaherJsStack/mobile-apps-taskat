
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shopping_app/models/category.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/scoped-models/main.dart';
import 'package:shopping_app/widgets/categories/categories.dart';
//import 'package:shopping_app/widgets/products/products.dart';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/rendering.dart';



class HomePage extends StatefulWidget {
  final MainModel model;
  HomePage(this.model);
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<HomePage> {

  List data;

  @override
  initState() {
    // print('State<HomePage>');
    // widget.model.fetchCategories();
    super.initState();
  }

 
  Widget buildListViewCarsd(BuildContext context) {
    return ListView.builder(
      itemCount: data == null ? 0 : data.length,
      itemBuilder: (BuildContext context, int index) {
        return new Container(
          child: Text(data[index]['name']),
        );
      }
    );
  }

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter:
        ColorFilter.mode(Colors.black.withOpacity(1), BlendMode.dstATop),
      image: AssetImage('assets/home.jpg'),
    );
  }

  Widget image_carousel = new Container(
    height: 400.0,
    child: CarouselSlider(
      height: 300,
      aspectRatio: 16 / 19,
      viewportFraction: 0.7,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      // autoPlayInterval: Duration(seconds: 3),
      // autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      // pauseAutoPlayOnTouch: Duration(seconds: 3),
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
      items: [
        'https://www.dhoumm.co/cdn-k1/ho/home-decoration-cheap-decor-items-online-sintowin_room-interior-and-decoration.jpg',
        'https://images-na.ssl-images-amazon.com/images/I/71ylJRHtzRL._SY679_.jpg',
        'https://media.architecturaldigest.in/wp-content/uploads/2018/08/Artesia-Tree-Shape-Wall-Shelf_INR979.jpg',
        'https://cdn.home-designing.com/wp-content/uploads/2016/12/LED-birch-tree-vintage-christmas-decorations-600x891.jpg'
      ].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(color: Colors.amber),
              child: GestureDetector(
                child: Image.network(i, fit: BoxFit.fill),
                // onTap: () {
                //   Navigator.push<Widget>(
                //     context,
                //     MaterialPageRoute(
                //         // builder: (context) => ImageScreen(i),
                //         ),
                //   );
                // },
              ),
            );
          },
        );
      }).toList(),
      autoPlay: true,
    ),
  );


  @override
  Widget build(BuildContext context) {
    return ListView(
      // child: Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(40, 50, 100, 50),
          width: 100,
          // color: Colors.black54,
          child: Text('BEST SELLING PRODUCTS ON SALE',
              style: TextStyle(
                  wordSpacing: 2,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  fontSize: 40)),
          height: 500.0,
          decoration: BoxDecoration(
            image: _buildBackgroundImage(),
          ),
        ),
        

        Container(padding: EdgeInsets.all(5), child: Text('الاقسام', style: TextStyle(fontSize: 20),), ),
        Container(    
          // margin: const EdgeInsets.all(40.0),
          height: 110, 
          child: ScopedModelDescendant(
          builder: (BuildContext context, Widget child, MainModel model) {
            Widget content = Center(child: Text('No category Found!'));
            if (model.displayedCategories.length > 0 && !model.isLoading) {
              content =SizedBox(
                height: 200.0, child: new ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: model.displayedCategories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return new  InkWell( child:
                        Container(
                        height: 110,
                        width: 110,
                        child: ListTile(
                          title: Image.asset("assets/images/icons/icon5.png"),
                          subtitle:  Text(model.displayedCategories[index].name, textAlign: TextAlign.center,),
                          ),
                        ),
                        onTap: () { print(model.displayedCategories[index].id); },
                      );
                    }
                  )
                );
              }
              else if (model.isLoading) {
              content = Center(child: CircularProgressIndicator());
            }
            return RefreshIndicator(onRefresh: model.fetchCategories, child: content,);
          }
          )
        ),
        

        Container(
          child: image_carousel,
        ),
        
        Container(
          child: Text('data 3'),
        ),


        Container(
              height: 250.0,
              width: double.infinity,
              child: Carousel(
                images: [
                  AssetImage("assets/images/slider/slider1.jpg"),
                  AssetImage("assets/images/slider/slider2.jpg"),
                ]
              ),
            ),


        Container(padding: EdgeInsets.all(5), child: Text('اخر المنتجات ...', style: TextStyle(fontSize: 20),), ),
        Container(
          height: 400,
          child: 
          GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: <Widget>[
              InkWell( child:
                GridTile(
                child: Image.asset("assets/images/products/prod1.jpg"), 
                footer: Container( 
                  margin: new EdgeInsets.symmetric(horizontal: 40.0),
                  color: Colors.brown, 
                  child: Text('pro name', 
                    textAlign: TextAlign.center, 
                    style: TextStyle(color: Colors.white),),)
                ),
                onTap: (){ print('object...');},
              ),

              InkWell( child:
                GridTile(
                child: Image.asset("assets/images/products/prod1.jpg"), 
                footer: Container( 
                  margin: new EdgeInsets.symmetric(horizontal: 40.0),
                  color: Colors.brown, 
                  child: Text('pro name', 
                    textAlign: TextAlign.center, 
                    style: TextStyle(color: Colors.white),),)
                ),
                onTap: (){ print('object...');},
              ),
              
              InkWell( child:
                GridTile(
                child: Image.asset("assets/images/products/prod1.jpg"), 
                footer: Container( 
                  margin: new EdgeInsets.symmetric(horizontal: 40.0),
                  color: Colors.brown, 
                  child: Text('pro name', 
                    textAlign: TextAlign.center, 
                    style: TextStyle(color: Colors.white),),)
                ),
                onTap: (){ print('object...');},
              ),

              InkWell( child:
                GridTile(
                child: Image.asset("assets/images/products/prod1.jpg"), 
                footer: Container( 
                  margin: new EdgeInsets.symmetric(horizontal: 40.0),
                  color: Colors.brown, 
                  child: Text('pro name', 
                    textAlign: TextAlign.center, 
                    style: TextStyle(color: Colors.white),),)
                ),
                onTap: (){ print('object...');},
              ),

              InkWell( child:
                GridTile(
                child: Image.asset("assets/images/products/prod1.jpg"), 
                footer: Container( 
                  margin: new EdgeInsets.symmetric(horizontal: 40.0),
                  color: Colors.brown, 
                  child: Text('pro name', 
                    textAlign: TextAlign.center, 
                    style: TextStyle(color: Colors.white),),)
                ),
                onTap: (){ print('object...');},
              ),

                
            ],

          ),
        ),

      ],
      // ),
    );
  }
}
