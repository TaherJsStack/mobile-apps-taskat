import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Directionality(textDirection: TextDirection.ltr, child: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountEmail: Text("email@g.com....."), 
                accountName: Text('taher ahmed'),
                currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  image: DecorationImage(
                    // image: NetworkImage("https://blogs.esa.int/space19plus/files/2019/03/nebula.jpg"),
                    image: AssetImage('assets/images/nebula.jpg'), 
                    fit: BoxFit.cover )
                ),
              ),

              ListTile(
                  leading: Icon(Icons.tab),
                  title: Text('Tabs'),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/tabs');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.edit),
                  title: Text('Manage Products'),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/admin');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings_applications),
                  title: Text('Manage Products'),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                ),

              ListTile(
                title:  Text( "الصفحة الرئيسيى", style: TextStyle( color: Colors.black, fontSize: 15, ), ),
                leading: Icon(Icons.home),
                trailing: Icon(Icons.hot_tub),
                subtitle: Text('data'),
                isThreeLine: true,
                dense: true,
                onLongPress: (){ print('LongPress'); },
                onTap: (){ 
                  Navigator.of(context).pushNamed("categories");
                 },
              ),
              ListTile(
                title:  Text("الاقسام", style: TextStyle( color: Colors.black, fontSize: 15, ), ),
                leading: Icon(Icons.home),
                trailing: Icon(Icons.hot_tub),
                subtitle: Text('data'),
                isThreeLine: true,
                dense: true,
                onLongPress: (){ print('LongPress'); },
                onTap: (){ 
                  Navigator.pushReplacementNamed(context, "/categories");
                 },
              ),
              Divider(color: Colors.blue,),
              ListTile(
                title:  Text( "حول التطبيق", style: TextStyle( color: Colors.black, fontSize: 15, ), ),
                leading: Icon(Icons.home),
                trailing: Icon(Icons.hot_tub),
                subtitle: Text('data'),
                isThreeLine: true,
                dense: true,
                onLongPress: (){ print('LongPress'); },
                onTap: (){ print('tab'); },
              ),
              ListTile(
                title:  Text( "الاعدادت", style: TextStyle( color: Colors.black, fontSize: 15, ), ),
                leading: Icon(Icons.home),
                trailing: Icon(Icons.hot_tub),
                subtitle: Text('data'),
                isThreeLine: true,
                dense: true,
                onLongPress: (){ print('LongPress'); },
                onTap: (){ print('tab'); },
              ),
              ListTile(
                title:  Text( "تسجيل الخروج", style: TextStyle( color: Colors.black, fontSize: 15, ), ),
                leading: Icon(Icons.home),
                trailing: Icon(Icons.hot_tub),
                subtitle: Text('data'),
                isThreeLine: true,
                dense: true,
                onLongPress: (){ print('LongPress'); },
                onTap: (){ print('tab'); },
              ),

            ],
          ),
        )
      );
    // Drawer(
      
    //   child: Column(
        
    //     children: <Widget>[
    //       AppBar(
    //         automaticallyImplyLeading: false,
    //         // title: Text('Choose'),
    //       ),
    //       DrawerHeader(
    //         // margin: EdgeInsets.all(0.0),
    //         // padding: EdgeInsets.all(0.0),
    //         child: Text('Drawer Header'),
    //         decoration: BoxDecoration(
    //           color: Colors.blue,
    //         ),
    //       ),
    //       ListTile(
    //         leading: Icon(Icons.tab),
    //         title: Text('Tabs'),
    //         onTap: () {
    //           Navigator.pushReplacementNamed(context, '/tabs');
    //         },
    //       ),
    //       // ListTile(
    //       //   leading: Icon(Icons.edit),
    //       //   title: Text('Manage Products'),
    //       //   onTap: () {
    //       //     Navigator.pushReplacementNamed(context, '/admin');
    //       //   },
    //       // ),
    //       ListTile(
    //         leading: Icon(Icons.settings_applications),
    //         title: Text('Manage Products'),
    //         onTap: () {
    //           Navigator.pushReplacementNamed(context, '/');
    //         },
    //       )
    //     ],
    //   ),
    // );
  }
}
