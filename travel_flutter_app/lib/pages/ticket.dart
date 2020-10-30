import 'package:flutter/material.dart';

class TicketPage extends StatefulWidget {
  TicketPage({Key key}) : super(key: key);

  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.90;

    return Scaffold(
      
      appBar: AppBar(
        title: Text('Ticket'),
        centerTitle: true,
      ),
      // backgroundColor: Colors.green,
      body: 
      Stack(
        children: <Widget>[ 
          Container(
            height: 210,
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
                  Container( ),
                )
                
              ],
            ),
          ),

          Align(alignment: 
            Alignment(0, .1), 
            child:Container(
                  width: targetWidth,
                  height: 350,
                  // color: Colors.red[100],
                  child: Column(
                    children: <Widget>[
                      Row( 
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0)
                            ),
                            elevation: 5.0,
                            child: new Container(
                              // height: 150,
                              // width: 150,
                              padding: EdgeInsets.all(30),
                              child: Image.asset("assets/images/icons/bus.png", width: 80, height: 70, fit: BoxFit.cover,) 
                            ),
                          ),
                        ],
                      ),
      
                      SizedBox(height: 30.0),

                    ],
                  ),
                ),
                
          ),
        
        
        ],
        
      )
    );
  }
}