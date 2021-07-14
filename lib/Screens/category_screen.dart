
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealsapp/Widgets/category_item.dart';
import 'package:mealsapp/Dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding:const EdgeInsets.all(15.0),
            children:DummyData.map((catData) =>
                CategoryItem(
                    catData.title,
                    catData.color,
                    catData.id)
            ) .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3/2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,

      )
    );
  }
}
