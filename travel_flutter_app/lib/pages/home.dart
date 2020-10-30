import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.90;

    return Scaffold(
      // appBar: AppBar(
      //   // title: Text('Flutter Scaffold'),
      // ),
      // backgroundColor: Colors.green,
      body: 
      Stack(
        children: <Widget>[ 
          Container(
            height: 270,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                // begin: Alignment.centerLeft,
                // end: Alignment.bottomRight,
                colors: [
                  Colors.blue[700],
                  Colors.blue[300],
                ],
              ),
            ),
            child: Column(
              
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                Center(child: 
                  Container(
                    child: Text(
                      "You Will Travel By ?", 
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                )
                
              ],
            ),
          ),

          Align(alignment: 
            Alignment(0, .3), 
            child:Container(
                  width: targetWidth,
                  height: 310,
                  // color: Colors.red[100],
                  child: Column(
                    children: <Widget>[
                      Row( 
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                          
                            child:  Card(
                              child: Container(
                                height: 130,
                                child: Center(
                                  child: ListTile(
                                    // leading: Image.asset("assets/images/icons/plane.png"),
                                    title: Image.asset("assets/images/icons/plane.png", height: 40),
                                    subtitle: Container(
                                      // alignment: Alignment(0, .2),
                                      margin: EdgeInsets.only(top: 15),
                                      child: new Text(
                                        'Plane', 
                                        textAlign: TextAlign.center, 
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20
                                        ), 
                                      ),  
                                    ),
                                    
                                      
                                    onTap: () {
                                      // Navigator.pushReplacementNamed(context, '/tabs');
                                        Navigator.pushNamed(context, "/ticketpage");
                                    },
                                  ),

                                ) 
                              ),
                            ),

                          ),
                          Expanded(
                            
                            child:  Card(
                              child: Container(
                                height: 130,
                                child: Center(
                                  child: ListTile(
                                    // leading: Image.asset("assets/images/icons/plane.png"),
                                    title: Image.asset("assets/images/icons/bus.png", height: 40),
                                    subtitle: Container(
                                      // alignment: Alignment(0, .2),
                                      margin: EdgeInsets.only(top: 15),
                                      child: new Text(
                                        'Bus', 
                                        textAlign: TextAlign.center, 
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20
                                        ), 
                                      ),  
                                    ),
                                    
                                    onTap: () {
                                      // Navigator.pushReplacementNamed(context, '/tabs');
                                        Navigator.pushNamed(context, "/ticketpage");
                                    },
                                  ),

                                ) 
                              ),
                            ),

                          ),
                        ],
                      ),
      
                      SizedBox(height: 30.0),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            
                            child:  Card(
                              child: Container(
                                height: 130,
                                child: Center(
                                  child: ListTile(
                                    // leading: Image.asset("assets/images/icons/plane.png"),
                                    title: Image.asset("assets/images/icons/car.png", height: 40),
                                    subtitle: Container(
                                      // alignment: Alignment(0, .2),
                                      margin: EdgeInsets.only(top: 15),
                                      child: new Text(
                                        'Car', 
                                        textAlign: TextAlign.center, 
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20
                                        ), 
                                      ),  
                                    ),
                                    onTap: () {
                                      // Navigator.pushReplacementNamed(context, '/tabs');
                                        Navigator.pushNamed(context, "/ticketpage");
                                    },
                                  ),

                                ) 
                              ),
                            ),
                          ),
                        ]
                      ),

                      
                    ],
                  ),
                ),
                
          ),
        
        
        ],
        
      )
    );
  
  
  }
}