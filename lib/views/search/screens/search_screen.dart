// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app_max/view_models/search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../view_models/products_view_model.dart';
import '../../home/widgets/search_field.dart';
import '../../item_details/screens/item_details_screen.dart';
import '../widgets/filter_list.dart';
import '../widgets/result_search_item.dart';


class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final searchViewModel = Get.find<SearchViewModel>();
  final productsViewModel = Get.find<ProductsViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Obx(
              () => AnimatedContainer(
                decoration: BoxDecoration(
                  //border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade200,
                ),
                duration: const Duration(milliseconds: 300),
                height: searchViewModel.isFiltterListVisible.value ? 160 : 60,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SearchField(
                        onChanged: searchViewModel.onChanged,
                        onFieldSubmitted: () {},
                        onTab: () {
                          searchViewModel.isFiltterListVisible.value =
                              !searchViewModel.isFiltterListVisible.value;
                        },
                      ),
                      GetBuilder<SearchViewModel>(
                        builder: (controller) => 
                         FilterList(
                          filterList: controller.filtersList,
                          isVisible: controller.isFiltterListVisible.value,
                        
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GetBuilder<SearchViewModel>(
              builder: (searchViewModel) => _buildResults(
                searchViewModel
                    .getListOfsearchProducts(searchViewModel.getFilteredList(productsViewModel.products)),
                searchViewModel.queryNotFound)),
          ],
        ),
      ),
    );
  }

  Widget _buildResults(List<dynamic> myList, bool queryNotFound) {
    return Expanded(
      child: queryNotFound
          ? Lottie.asset(
              'assets/lottiefiles/94729-not-found.json',
            )
          : AnimationLimiter(
              child: ListView.builder(
                itemCount: myList.length,
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: GestureDetector(
                          onTap: () {
                            Get.to(
                              () => DetailScreen(
                                productModel: myList[index],
                              ),
                            );
                          },
                          child: _buildResultSearchItem(myList, index),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }

  Widget _buildResultSearchItem(List<dynamic> myList, int index) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 6,
        left: 0,
        right: 0,
      ),
      child: Container(
        height: 95,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 0.9, color: Colors.grey.shade200)),
        child: ResultSearchItem(
          id: myList[index].id,
          image: myList[index].image,
          price: myList[index].price,
          category: myList[index].title,
        ),
      ),
    );
  }
}

