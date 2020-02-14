import 'package:flutter/material.dart';
import 'package:todo_flutter/screens/categories_screen.dart';
import 'package:todo_flutter/screens/home_screen.dart';

class DrawerNavigation extends StatefulWidget {
  @override
  _DrawerNavigationState createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Todo App'),
              accountEmail: Text('bla bla bla'),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.supervised_user_circle,color: Colors.red,),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              onTap:(){
                Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>new HomeScreen()));
              },
            ),

            ListTile(
              title: Text('Categories'),
              leading: Icon(Icons.category),
              onTap:(){
                Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>new CategoriesScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}
