import 'package:flutter/material.dart';
import 'package:myshop/Blocs/DishesBlocs.dart';
import 'package:provider/provider.dart';

class AddToCart extends StatefulWidget {
  final dynamic dishId;
  AddToCart(this.dishId);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    final DishesBlocs dishBlocs = Provider.of<DishesBlocs>(context);
   

    return ButtonBar(
      buttonMinWidth: 50,
      alignment: MainAxisAlignment.start,
      buttonPadding: EdgeInsets.all(0),
      children: [
        RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(50))),
            onPressed: () {
               dishBlocs.removeFromCart(widget.dishId);
            },
            child: Icon(Icons.remove),
            color: Color(0xff4BAE51)),
        RaisedButton(
          onPressed: (){},
          child: Text(
            dishBlocs.cartById(widget.dishId).toString(),
            style: TextStyle(fontSize: 18),
          ),
          color: Color(0xff4BAE51),
        ),
        RaisedButton(
          onPressed: () {
        dishBlocs.addTocart(widget.dishId);
         
          },
          child: Icon(Icons.add),
          color: Color(0xff4BAE51),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomRight: Radius.circular(50))),
        )
      ],
    );
  }
}
