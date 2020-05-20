import 'package:flutter/cupertino.dart';
import 'package:myshop/Models/Cart.dart';

class DishesBlocs extends ChangeNotifier {
  List<Cart> _cartList = [Cart(dishId: '100000001', count: 1)];

  List<Cart> get cartList => _cartList;

  int get getTotalCount {
    var total = 0;
    if (cartList.length > 0) {
      for (var item in cartList) {
        total = total + item.count.toInt();
      }
      return total;
    } else {
      return 0;
    }
  }

  void addTocart(String id) {
    var result = _cartList.where((element) => element.dishId == id);
    var index = _cartList.indexWhere((element) => element.dishId == id);
    if (result.isNotEmpty) {
      _cartList[index].count = _cartList[index].count + 1;
   
    } else {
       
      Cart cartItem = Cart(count: 1, dishId: id);
      _cartList.add(cartItem);
    }
    // _cartList.add(cart);
    notifyListeners();
  }

  void removeFromCart(String id) {
     var result = _cartList.where((element) => element.dishId == id);
    var index = _cartList.indexWhere((element) => element.dishId == id);
     if (result.isNotEmpty) {
       if(_cartList[index].count > 1){
          _cartList[index].count = _cartList[index].count - 1;
       }else{
         _cartList.removeAt(index);
       }

    } else {
        // _cartList.removeAt(index);
    }
      notifyListeners();
  }

  int cartById(String id) {
    var result = _cartList.where((element) => element.dishId == id);
    var index = _cartList.indexWhere((element) => element.dishId == id);
    if (result.isNotEmpty) {
      return _cartList[index].count.toInt();
    } else {
      return 0;
    }
  }
}
