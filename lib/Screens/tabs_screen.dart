import 'package:flutter/material.dart';
import 'package:mealsapp/Screens/category_screen.dart';
import 'package:mealsapp/Screens/favourite_screen.dart';
import 'package:mealsapp/Widgets/main_drawer.dart';
import 'package:mealsapp/model/Meal.dart';

class TabScreen extends StatefulWidget {
  final List<Meal>favoriteMeals;
  TabScreen(this.favoriteMeals);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

 List<Map<String, Object>>_pages;
  int _selectedPageIndex=0;

  @override
  void initState() {
   _pages= [
      {
        'page':CategoryScreen(),
        'title':'Categories'
      },
      {
        'page':FavouriteScreen(widget.favoriteMeals),
        'title':'Your Favourites'
      },
    ];
    super.initState();
  }


  void _selectPage(int index){
    setState(() {
      _selectedPageIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title']),
          centerTitle: true,
        ),
        drawer: MainDrawer(),
        body: _pages[_selectedPageIndex]['page'],
         bottomNavigationBar: BottomNavigationBar(
        onTap:_selectPage ,
          backgroundColor:Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: ('Categoroes')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: ('Favourites')
            ),
          ],
      ),
    );
  }
}
