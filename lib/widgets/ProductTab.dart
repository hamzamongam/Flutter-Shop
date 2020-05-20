

import 'package:flutter/material.dart';

import 'package:myshop/widgets/ProductItem.dart';

class ProductTab extends StatelessWidget {
  const ProductTab(this.categorydishes);
  final List categorydishes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categorydishes.length,
      itemBuilder: (BuildContext context, int index) {
      return ProductItem(categorydishes[index]);
     },
    );
  }
}