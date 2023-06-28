import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../core/utils/app_strings.dart';
import '../models/category_model.dart';
import '../repositories/category_repository.dart';

class CategoriesViewModel extends GetxController {
  final CategoryRepository _categoryRepository;
  CategoriesViewModel(this._categoryRepository);
  String categorySelected = '';
  List<CategoryModel> get categories => List.generate(
      _categories.length,
      (index) => CategoryModel(
            name: _categories[index],
            imageUrl: _categoriesIcons[index],
          ));
  List _categories = [];

  String getCategorySelected() {
    return categorySelected;
  }

  Future<void> initListOfCategories() async {
    _categories = await _categoryRepository.fetchCategories();
    update();
  }

  final List<String> _categoriesIcons = [
    "assets/images/electronics.png", //e
    "assets/images/jewelery.png", //je
    "assets/images/men.png", //m
    "assets/images/women.png", //w
    //sh
  ];

  String getCategoryTitle(categortTitle) {
    if (categortTitle == AppStrings.electronics) {
      return 'Electronics';
    }
    if (categortTitle == AppStrings.jewelery) {
      return 'Jewlery';
    }
    if (categortTitle == AppStrings.mens) {
      return 'Men';
    }
    if (categortTitle == AppStrings.womens) {
      return 'Women';
    } else {
      return '';
    }
  }
}
