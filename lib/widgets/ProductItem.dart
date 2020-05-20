import 'package:flutter/material.dart';
import 'package:myshop/Models/Dishes.dart';
import 'package:myshop/widgets/AddToCart.dart';


class ProductItem extends StatefulWidget {
 final CategoryDishes  dishItem;
     ProductItem(this.dishItem);

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
          child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
         
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 20,
                  width: 20,
                  color: widget.dishItem.dishType == 2 ? Colors.green[100]: Colors.red[100] ,
                  child: Icon(
                    Icons.fiber_manual_record,
                    size: 18,
                    color: widget.dishItem.dishType == 2 ? Colors.green: Colors.red ,
                  )),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.dishItem.dishName.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'SAR ' + widget.dishItem.dishPrice.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Colors.grey),
                        ),
                        Text(
                          '${widget.dishItem.dishCalories} calories',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${widget.dishItem.dishDescription}',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                        AddToCart(widget.dishItem.dishId),
                    SizedBox(
                      height: 4,
                    ),
                    widget.dishItem.addonCat.length > 0 ?  Text(
                      "Customizations Available",
                      style: TextStyle(color: Colors.red[300], fontSize: 16),
                    ): SizedBox()
                   
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 70,
                height: 70,
                child: Image.network('${widget.dishItem.dishImage}',fit: BoxFit.cover,),
                color: Colors.grey[100],
              )
            ],
          )),
    );
  }
}








// class ProductItem extends StatelessWidget {
  
   
  
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text('Working....'),
//     );
//   }
// }
