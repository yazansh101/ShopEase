// ignore_for_file: prefer_final_fields

import 'dart:developer';

import 'package:chat_app_max/repositories/product_repository.dart';
import 'package:get/get.dart';

import '../core/utils/app_strings.dart';
import '../models/product_model.dart';

class ProductsViewModel extends GetxController {
  ProductRepository _productRepository;
  ProductsViewModel(this._productRepository);
  int indexforPage = 0;
  RxList<Product> _products = <Product>[].obs;
  List<Product> get products => [..._products];

  RxInt currentIndex = 0.obs;
  RxBool isLoading = false.obs;

  String getPlaceHolderImage(String category) {
    if (category == AppStrings.electronics) {
      return 'assets/images/electronics.png';
    } else if (category == AppStrings.mens) {
      return 'assets/images/men.png';
    } else if (category == AppStrings.womens) {
      return 'assets/images/women.png';
    } else {
      return "assets/images/jewelery.png";
    }
  }

  List<double> listOfPriceOfProducts() {
    final List<double> thisList = [];
    for (var product in products) {
      thisList.add(product.price);
    }
    return thisList;
  }

  List<Product> listOfFavoriteProducts() {
    final List<Product> thisList = [];
    for (var product in products) {
      if (product.isFavorite) {
        thisList.add(product);
      }
    }
    return thisList;
  }

  List<Product> getListOfSelectedCategory(String categorySelected) {
    if (categorySelected == '') {
      return products;
    } else {
      
      return listOfSelectedCategory(categorySelected);
    }
  }

  getIndex(int index) {
    indexforPage = index;
    update();
  }

  List<Product> listOfSelectedCategory(String productCategory) {
    final List<Product> mylist = _products
        .where((product) => product.category == productCategory)
        .toList();
    // for (int i = 0; i < _products.length; i++) {
    //   if (_products[i].category == productCategory) {

    //     log(_products[i].category);
    //     log(mylist.length.toString());
    //     mylist.add(_products[i]);
    //   }
    // }
    log(mylist[0].title);
    return mylist;
  }

  Future<void> initListOfPRoducts() async {
    isLoading.value = true;
    final myProducts = await _productRepository.fetchProducts();
    _products.value = myProducts;
    isLoading.value = false;

    //  _products.assignAll(myProducts);
  }

  List<Product> listOfBestSellingProducts() {
    _products.sort((a, b) => b.rating['rate'].compareTo(a.price));
    return products.take(5).toList();
  }

  void toggleIsFavorite(Product product) {
    product.isFavorite = !product.isFavorite;
    update();
  }
}
