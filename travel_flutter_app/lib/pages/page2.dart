import 'package:flutter/material.dart';


class Page2 extends StatefulWidget {
  Page2({Key key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.blue,
                ),
                onPressed: () {}),
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                  onPressed: () {})
            ],
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(70),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: TabBar(
                        unselectedLabelColor: Colors.blue,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.blue),
                        tabs: [
                          Tab(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      color: Colors.blue, width: 1)),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("Home"),
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      color: Colors.blue, width: 1)),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("Gallery"),
                              ),
                            ),
                          ),
                        ]),
                  ),
                )),
          ),
          body: TabBarView(children: [
            Center(
              child: Container(
                color: Colors.white,
                child: Text("Home",style: TextStyle(fontSize: 22,color: Colors.blue),),
              ),
            ),
            Center(
              child: Container(
                color: Colors.white,
                child: Text("Gallery",style: TextStyle(fontSize: 22,color:Colors.blue),),
              ),
            ),
          ]),
        ));
  
  }
}