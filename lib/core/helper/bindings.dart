import 'package:chat_app_max/core/services/navigator_service.dart';
import 'package:chat_app_max/view_models/search_view_model.dart';
import 'package:get/get.dart';

import '../../repositories/category_repository.dart';
import '../../repositories/product_repository.dart';
import '../../view_models/auth_view_model.dart';
import '../../view_models/categories_view_model.dart';
import '../../view_models/home_view_model.dart';
import '../../view_models/location_view_model.dart';
import '../../view_models/products_screen_view_model.dart';
import '../../view_models/products_view_model.dart';
import '../../view_models/splash_view_model.dart';
import '../../views/orders/cart_view_model.dart';
import '../../views/orders/orders_view_model.dart';
import '../services/firebase_auth_service.dart';
import '../services/image_picker_service.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.put(CartViewModel());
    Get.put(OrderViewModel());
    Get.lazyPut(() => ImagePickerService(), fenix: true);
    Get.put(SearchViewModel());
    Get.put(AuthViewModel(
      authService: FirebaseAuthService(),
      navigationService: GetNavigationService(),
    ));
    Get.lazyPut(() => ProductsViewModel(ProductRepository()), fenix: true);
    Get.lazyPut(() => CategoriesViewModel(CategoryRepository()), fenix: true);
    Get.put(ProductsScreenViewModel());
    Get.put(LocationViewModel());
    Get.put(HomeViewModel(
    Get.find<ProductsViewModel>(), Get.find<CategoriesViewModel>()));
   
        Get.lazyPut(() => SplashScreenViewModel());

  }
}
