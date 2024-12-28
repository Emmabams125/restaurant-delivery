import 'package:collection/collection.dart';
import 'package:delivery_app/models/cart_item.dart';
import 'package:delivery_app/models/food.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier {
  //list of food _menu
  final List<Food> _menu = [
    //main dish

    //jellof rice
    Food(
      name: "Jellof rice",
      description: "Tasty west Africa rice made from tomato spices and rice",
      imagePath: "lib/images/main_dish/jellof_rice_2.jpg",
      price: 0.99,
      category: FoodCategory.Maindish,
      availableAddons: [
        Addon(name: "Extra meat", price: 0.99),
        Addon(name: "Extra chicken", price: 1.99),
      ],
    ),
    Food(
      name: "Eba",
      description: "Tasty west Africa Eba with shredded beef soup",
      imagePath: "lib/images/main_dish/eba.jpeg",
      price: 0.99,
      category: FoodCategory.Maindish,
      availableAddons: [
        Addon(name: "Extra meat", price: 0.99),
        Addon(name: "Extra chicken", price: 1.99),
      ],
    ),
    Food(
      name: "Efo eriro",
      description: "Tasty Efo eriro soup",
      imagePath: "lib/images/main_dish/efo_eriro.jpeg",
      price: 0.99,
      category: FoodCategory.Maindish,
      availableAddons: [
        Addon(name: "Extra meat", price: 0.99),
        Addon(name: "Extra chicken", price: 1.99),
      ],
    ),
    Food(
      name: "moi moi",
      description: "Tasty moin moin made from beans",
      imagePath: "lib/images/main_dish/moi_moi.jpeg",
      price: 0.99,
      category: FoodCategory.Maindish,
      availableAddons: [
        Addon(name: "Extra meat", price: 0.99),
        Addon(name: "Extra chicken", price: 1.99),
      ],
    ),
    Food(
      name: "suya",
      description: "Nigerian north african dish",
      imagePath: "lib/images/main_dish/suya.jpeg",
      price: 0.99,
      category: FoodCategory.Maindish,
      availableAddons: [
        Addon(name: "Extra meat", price: 0.99),
        Addon(name: "Extra chicken", price: 1.99),
      ],
    ),

    //small chops
    Food(
      name: "samosa",
      description: "Indian dish with meat rapped in flour",
      imagePath: "lib/images/small_chops/AdobeStock_501769146_Preview.jpeg",
      price: 0.99,
      category: FoodCategory.SmallChops,
      availableAddons: [],
    ),
    Food(
      name: "puff puff",
      description: "small buns made from flour",
      imagePath: "lib/images/small_chops/AdobeStock_840533303_Preview.jpeg",
      price: 0.99,
      category: FoodCategory.SmallChops,
      availableAddons: [],
    ),

    //pastries
    Food(
      name: "chin chin",
      description: "Tasty west African dish",
      imagePath: "lib/images/pastries/AdobeStock_560575314_Preview.jpeg",
      price: 0.99,
      category: FoodCategory.Pastrie,
      availableAddons: [],
    ),
    Food(
      name: "meat pie",
      description: "Tasty west African dish",
      imagePath: "lib/images/pastries/AdobeStock_575647768_Preview.jpeg",
      price: 0.99,
      category: FoodCategory.Pastrie,
      availableAddons: [],
    ),
    Food(
      name: "Donut",
      description: "Tasty west African dish",
      imagePath: "lib/images/pastries/AdobeStock_854316389_Preview.jpeg",
      price: 0.99,
      category: FoodCategory.Pastrie,
      availableAddons: [],
    ),
    Food(
      name: "Hot dog",
      description: "Tasty west African dish",
      imagePath: "lib/images/pastries/AdobeStock_966058023_Preview.jpeg",
      price: 0.99,
      category: FoodCategory.Pastrie,
      availableAddons: [],
    ),

    //desserts
    Food(
      name: "Cake",
      description: "Sweet tasty cake",
      imagePath: "lib/images/desserts/AdobeStock_717760673_Preview.jpeg",
      price: 0.99,
      category: FoodCategory.Desserts,
      availableAddons: [],
    ),
    Food(
      name: " Cup Cake",
      description: "Sweet tasty Cupcake",
      imagePath: "lib/images/desserts/AdobeStock_808119935_Preview.jpeg",
      price: 0.99,
      category: FoodCategory.Desserts,
      availableAddons: [],
    ),
    Food(
      name: " Fruit Salad",
      description: "Sweet tasty Fruit Salad",
      imagePath: "lib/images/desserts/AdobeStock_971996156_Preview.jpeg",
      price: 0.99,
      category: FoodCategory.Desserts,
      availableAddons: [],
    ),

    //DRINKS
    Food(
      name: "Coke",
      description: "Cold coke",
      imagePath: "lib/images/drinks/AdobeStock_231297579_Preview.jpeg",
      price: 0.99,
      category: FoodCategory.Drinks,
      availableAddons: [],
    ),
    Food(
      name: "Sprite",
      description: "Cold Sprite",
      imagePath:
          "lib/images/drinks/AdobeStock_282944552_Preview_Editorial_Use_Only.jpeg",
      price: 0.99,
      category: FoodCategory.Drinks,
      availableAddons: [],
    ),
    Food(
      name: "Fanta",
      description: "Cold Fanta",
      imagePath:
          "lib/images/drinks/AdobeStock_286118600_Preview_Editorial_Use_Only.jpeg",
      price: 0.99,
      category: FoodCategory.Drinks,
      availableAddons: [],
    ),
    Food(
      name: "Maltina",
      description: "Cold Maltina",
      imagePath:
          "lib/images/drinks/AdobeStock_669807756_Preview_Editorial_Use_Only.jpeg",
      price: 0.99,
      category: FoodCategory.Drinks,
      availableAddons: [],
    ),
  ];

  //user cart
  List<CartItem> _cart = [];

  //delivery address (which user can change/update)
  String _deliveryAddress = 'Nigeria';

/*
  G E T T E R S
   */
  List<Food> get menu => _menu;

  List<CartItem> get cart => _cart;

  String get deliveryAddress => _deliveryAddress;

/*
 O P E R A T O R S
 */

//add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    //see if there is a cart item already with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if the food items are the same
      bool isSameFood = item.food == food;

      //check if the list of selected items are the same
      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    //if cart already exists ,increase its quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }

    //otherwise, add anew cart item
    else {
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
        ),
      );
    }
  }

//remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

//get total price of cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

//get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

//clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  //update delivery address
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

/*
H E L P E R S
 */
//generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    //format the date to include up to seconds only
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("----------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} -${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln("Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
    }
    receipt.writeln("----------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to:$deliveryAddress");

    return receipt.toString();
  }

//format double value into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

//format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name}(${_formatPrice(addon.price)})")
        .join(",");
  }
}
