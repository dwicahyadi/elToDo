import 'package:flutter/material.dart';
import 'package:todo_flutter/models/category.dart';
import 'package:todo_flutter/screens/home_screen.dart';
import 'package:todo_flutter/services/category_service.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  var _categoryName = TextEditingController();
  var _categorDescription = TextEditingController();

  var _category = Category();
  var _categoryServis = CategoryService();

  List<Widget> _categoryList = List<Widget>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllCategories();
  }

  getAllCategories() async {
    var catagories = await _categoryServis.getCatagories();
    catagories.forEach((catagory){
      print(catagory['name']);
      _categoryList.add(
          Card(
            child: ListTile(
              title: Text(catagory['name']),
              subtitle: Text(catagory['description']) ,
            ),
          ),
      );
    });
  }

  _showFormInDialog(BuildContext context){
    return showDialog(context: context,barrierDismissible: true, builder: (param){
      return AlertDialog(
        title: Text('Category Form'),
        actions: <Widget>[
          FlatButton(
            onPressed: (){},
            child: Text('Cancel'),
          ),

          FlatButton(
            onPressed: () async {
              _category.name = _categoryName.text;
              _category.description = _categorDescription.text;
              var result = await _categoryServis.saveCategory(_category);
              print(result);

            },
            child: Text('Save'),
          ),
        ],
        content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              controller: _categoryName,
              decoration: InputDecoration(
                labelText: 'Category Name',
                hintText: 'Category Name',
              ),
            ),

            TextField(
              controller: _categorDescription,
              decoration: InputDecoration(
                labelText: 'Category Description',
                hintText: 'Category Description',
              ),
            ),
          ],
        ),
      ),);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        leading: RaisedButton(
          elevation: 0.0,
          color: Colors.red,
          child: Icon(Icons.arrow_left,color: Colors.white,),
          onPressed: (){
            Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new HomeScreen()));
          },
        ),
      ),

      body: Column(
        children: _categoryList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _showFormInDialog(context);
        },
        child: Icon(Icons.add, color: Colors.white,),
      ),
    );
  }
}
