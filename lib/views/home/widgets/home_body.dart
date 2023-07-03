import 'dart:developer';

import 'package:chat_app_max/views/products_view/widgets/products_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../core/utils/constants.dart';
import '../../../core/widgets/animated_text.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../view_models/categories_view_model.dart';
import '../../../view_models/home_view_model.dart';
import '../../../view_models/products_view_model.dart';
import '../../cart/screens/view_cart_screen.dart';
import '../../orders/cart_view_model.dart';
import '../../products_view/screens/all_products_scree.dart';
import 'banner_card.dart';
import 'category_list.dart';
import 'icon_btn_with_counter.dart';
import 'scrollable_section.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    HomeViewModel homeViewModel = Get.find<HomeViewModel>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sayHello(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                _buildScrollableBanner(homeViewModel.indexforPageOfBanner),
                scrollerDot(),
                const SizedBox(
                  height: 10,
                ),
                _buildCategorySection(),
                const SizedBox(
                  height: 10,
                ),
                _buildBestSellingSection(),
              ],
            ),
          ),
        )
      ],
    );
  }
}

SizedBox _buildBestSellingSection() {
  final categoriesViewModel = Get.find<CategoriesViewModel>();
  final productsViewModel = Get.find<ProductsViewModel>();

  return SizedBox(
    height: 300,
    child: ScroallableSection(
      titleOfSecton: CustomText(
        text: 'Best Selling',
        fontSize: 18,
      ),
      seeAllText: TextButton(
          child: const Text('see all'),
          onPressed: () {
            categoriesViewModel.categorySelected = '';
            Get.to(
                transition: Transition.fadeIn,
                () => AllProducts(
                      categoryName: categoriesViewModel.categorySelected,
                    ));
          }),
      listoF: ProductsList(
          productsList: productsViewModel.listOfBestSellingProducts()),
    ),
  );
}

Widget _buildCategorySection() {
  return ScroallableSection(
    titleOfSecton: CustomText(
      text: 'Categories',
      fontSize: 18,
    ),
    listoF: const CategoryList(),
  );
}

Row scrollerDot() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(3, (index) => buildDot(index)),
  );
}

Widget buildDot(int index) {
  return GetBuilder<HomeViewModel>(builder: (controller) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.all(6),
      height: 5,
      width: controller.indexforPageOfBanner == index ? 13 : 8,
      decoration: BoxDecoration(
        color: controller.indexforPageOfBanner == index
            ? primaryColor
            : Colors.grey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  });
}

Widget _buildScrollableBanner(
  indexforPageOfBanner,
) {
  HomeViewModel homeViewModel = Get.find();
  final listOFbannerCard = [
    '20% OFF DURING\nTHE WEEKEND FOR SHOES',
    '40% OFF DURING\nTHE WEEKEND FOR MEN CLOTHING',
    '10% OFF DURING\nTHE WEEKEND FOR MEN ELECTRONICS',
  ];
  return SizedBox(
    height: 120,
    child: AnimationLimiter(
      child: PageView.builder(
        onPageChanged: (value) {
          homeViewModel.onBannerPagedChanged(value);
        },
        scrollDirection: Axis.horizontal,
        itemCount: listOFbannerCard.length,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: BannerCard(
                  discountTitle: listOFbannerCard[index],
                  cardColor: index.isEven ? primaryColor : Colors.blueGrey,
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
}

Widget sayHello() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          AnimatedText(
            'Welcome back!',
            fontSize: 15,
          ),
          SizedBox(
            height: 3,
          ),
          AnimatedText(
            'Let\'s start shopping!',
            fontSize: 14,
          ),
        ],
      ),
      GetX<CartViewModel>(
        builder: (productsViewModel) => IconBtnWithCounter(
          svgSrc: 'assets/icons/Cart Icon.svg',
          onTap: () {
            log('pressed');
            Get.to(transition: Transition.fadeIn, () => CartScreen());
          },
          numOfitem: productsViewModel.itemCount.toInt(),
        ),
      ),
    ],
  );
}
