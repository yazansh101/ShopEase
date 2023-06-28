import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../view_models/categories_view_model.dart';
import '../../products_view/screens/all_products_scree.dart';
import 'category_item.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoriesViewModel = Get.find<CategoriesViewModel>();
    return SizedBox(
      height: 110,
      child: AnimationLimiter(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: CategoryItem(
                    categoryTitle: categoriesViewModel.categories[index].name,
                    categoryIcon: categoriesViewModel.categories[index].imageUrl,
                    onTap: () {
                      categoriesViewModel.categorySelected =
                          categoriesViewModel.categories[index].name;
                      Get.to(
                        transition: Transition.fadeIn,
                        () => AllProducts(
                            categoryName: categoriesViewModel.categories[index].name,
                         
                          ));
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
