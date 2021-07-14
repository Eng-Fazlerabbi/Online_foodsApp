import 'package:flutter/material.dart';
import 'package:mealsapp/Widgets/main_drawer.dart';


class FilterScreen extends StatefulWidget {
  static const routName='/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FilterScreen(this.currentFilters,this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree=false;
  bool _vegetarian=false;
  bool _vegan=false;
  bool _lactoseFree=false;

  @override
  initState(){
    _glutenFree=widget.currentFilters['gluten'];
    _lactoseFree=widget.currentFilters['lactose'];
    _vegan=widget.currentFilters['vegan'];
    _vegetarian=widget.currentFilters['vegetarian'];
  super.initState();
   }

  Widget _buildSwitchListTile(
      String title,
      String description,
      bool currentValue,
      Function updateValue,
      ){
    return  SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: currentValue,
        onChanged:updateValue,
     );
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(icon: Icon(Icons.save), onPressed:() {
            final selectFilters={
              'gluten':_glutenFree,
              'lactose':_lactoseFree,
              'vegan':_vegan,
              'vegetarian':_vegetarian,
            };
            widget.saveFilters(selectFilters);
          })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text('Adjust your meal Screen',
          style: Theme.of(context).textTheme.headline6,),
        ),
        Expanded(
            child: ListView(
              children: [
              _buildSwitchListTile('Gluten-Free', 'Only include gluten-free meals',
                  _glutenFree , (newValue){
                setState(() {
                  _glutenFree=newValue;
                });
                  }
                  ),
                _buildSwitchListTile('Lactose-Free', 'Only include lactose-free meals',
                    _lactoseFree , (newValue){
                      setState(() {
                        _lactoseFree=newValue;
                      });
                    }
                    ),
                _buildSwitchListTile('Vegetarian', 'Only include vegetarian meals',
                    _vegetarian , (newValue){
                      setState(() {
                        _vegetarian=newValue;
                      });
                    }
                    ),
                _buildSwitchListTile('Vegan', 'Only include vegane meals',
                    _vegan , (newValue){
                      setState(() {
                        _vegan=newValue;
                      });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
