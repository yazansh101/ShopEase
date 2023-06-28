// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: body_might_complete_normally_nullable

import 'package:chat_app_max/core/utils/app_strings.dart';
import 'package:chat_app_max/models/product_model.dart';
import 'package:get/get.dart';

class FilterItemModel {
  String title;
  bool isSelected;

  FilterItemModel({
    required this.title,
    this.isSelected = false,
  });
}

class SearchViewModel extends GetxController {
  String query = '';
  bool queryNotFound = false;
  RxBool isFiltterListVisible = false.obs;
  RxBool isSelected = false.obs;

  List<FilterItemModel> filtersList = [
    FilterItemModel(title: AppStrings.electronics),
    FilterItemModel(title: AppStrings.jewelery),
    FilterItemModel(title: AppStrings.mens),
    FilterItemModel(title: AppStrings.womens),
  ];

  List filteredList = [];

  setNewFilter(int index) {
    filtersList[index].isSelected = !filtersList[index].isSelected;
    update();
  }

  void onChanged(value) {
    query = value.trim();
    queryNotFound = false;
    update();
  }

  getFilteredList(List<Product> productsList) {
    List filteredList = [];
    filteredList.addAll(productsList
        .where((element) =>
            element.category ==
                (filtersList[0].isSelected ? filtersList[0].title : '') ||
            element.category ==
                (filtersList[1].isSelected ? filtersList[1].title : '') ||
            element.category ==
                (filtersList[2].isSelected ? filtersList[2].title : '') ||
            element.category ==
                (filtersList[3].isSelected ? filtersList[3].title : ''))
        .toList());
    if (filteredList.isEmpty) {
      return productsList;
    } else {
      return filteredList;
    }
  }

  List<dynamic> getListOfsearchProducts(List<dynamic> productsList) {
    final fliterdList = productsList
        .where((element) => (element.title.startsWith(query.capitalize)))
        .toList();
    if (query == '') {
      queryNotFound = false;
      return productsList;
    } else {
      if (fliterdList.isEmpty && query != '') {
        queryNotFound = true;
      }
      return fliterdList;
    }
  }
}
