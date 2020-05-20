import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:myshop/Blocs/DishesBlocs.dart';
import 'package:myshop/Models/Cart.dart';
import 'package:myshop/Models/Dishes.dart';
import 'package:myshop/Services/HttpServices.dart';
import 'package:myshop/widgets/ProductTab.dart';
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  ProductList({Key key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final HttpService httpService = HttpService();
  List<Dishes> dishes = [];

// int getTotalCount(){
//   int total = 0;
//  if (cartList.length > 0) {
//     for (var item in cartList) {
//     total = total + item.count.toInt();
//   }
//    return total;
//  } else {
//     return total;
//  }

// }

  void getData() async {
    var data = await httpService.getDishes();

    setState(() {
      dishes = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final DishesBlocs dishBlocs = Provider.of<DishesBlocs>(context);
    if (dishes.length > 0) {
      return DefaultTabController(
        length: dishes.length,
        child: Scaffold(
            appBar: AppBar(
              leading: Icon(
                Icons.arrow_back,
                color: Colors.grey,
              ),
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text(
                'UNI Resto Cafe',
                style: TextStyle(color: Colors.grey),
              ),
              actions: [
                FlatButton(
                  onPressed: null,
                  child: Text(
                    'My Orders',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w600),
                  ),
                ),
                Badge(
                  position: BadgePosition.bottomRight(right: 5, bottom: 20),
                  animationType: BadgeAnimationType.scale,
                  badgeContent: Text(
                    dishBlocs.getTotalCount.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  child: IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                        size: 30,
                      ),
                      onPressed: null),
                ),
              ],
              bottom: TabBar(
                  indicatorColor: Colors.red,
                  isScrollable: true,
                  labelColor: Colors.grey,
                  tabs: [
                    for (var item in dishes)
                      (Tab(
                        text: item.menuCategory.toString(),
                      )),
                  ]),
            ),
            body: TabBarView(children: [
              for (var item in dishes) (ProductTab(item.categoryDishes))
            ])),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
