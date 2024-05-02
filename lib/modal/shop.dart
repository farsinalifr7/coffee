import 'package:cofee/modal/coffee.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  List<Coffee> cofeeitem = [
    Coffee(
        name: "Cappuccino",
        description:
            "A cappuccino is the perfect balance of espresso, steamed milk and foam.",
        image: "asset/images/coffee1-removebg-preview.png",
        price: "230"),
    Coffee(
        name: "Black Coffee",
        description:
            " Black coffee is simply coffeewith nothing added – no cream, no milk, no sweetener",
        image: "asset/images/coffeee-removebg-preview.png",
        price: "100"),
    Coffee(
        name: "Tea",
        description:
            "Tea is an aromatic beverage prepared by pouring hot or boiling water over cured or fresh leaves of Camellia sinensis",
        image: "asset/images/coffee3-removebg-preview.png",
        price: "83"),
    Coffee(
        name: "Latte",
        description:
            "A latte or caffè latte is a milk coffee that is a made up of one or two shots of espresso, steamed milk and a final, thin layer of frothed milk on top.",
        image: "asset/images/lattenew1-removebg-preview.png",
        price: "104"),
  ];

// get cofee list
  List<Coffee> getCoffeeList() {
    return cofeeitem;
  }

  // cartlist
  List<Coffee> cartList = [];

  List<Coffee> getCartlist() {
    return cartList;
  }

  // add item to cartlist
  void addItemToCart(Coffee item) {
    cartList.add(item);
    notifyListeners();
  }

  // remove item from cartlist
  void removeItemFromCart(Coffee item) {
    cartList.remove(item);
    notifyListeners();
  }

  String findtotal() {
    notifyListeners();
    double total = 0;
    for (int i = 0; i < cartList.length; i++) {
      total += double.parse(cartList[i].price);
    }
    return total.toString();
  }
}
