import 'package:chat_app_max/views/home/widgets/home_body.dart';
import 'package:chat_app_max/views/search/screens/search_screen.dart';
import 'package:chat_app_max/views/shimmer/shimmer_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view_models/home_view_model.dart';
import '../../products_view/screens/favorit_products_screen.dart';
import '../../profile/screens/profile_screen.dart';
import '../widgets/bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Get.find<HomeViewModel>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 20,
          right: 20,
        ),
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: homeViewModel.pageController,
          children: [
            GetBuilder<HomeViewModel>(
                builder: (homeViewModel) => homeViewModel.isLoading
                    ? const ShimmerScreen()
                    : const HomeBody()),
            SearchScreen(),
            FavoritProductsScreen(),
            ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: GetX<HomeViewModel>(
        builder: (homeViewModel) => RoundedNavigationBar(
          currentIndex: homeViewModel.currentIndexForBottomNavigationBar.value,
          onTap: homeViewModel.onHomePageChanged,
        ),
      ),
    );
  }
}
