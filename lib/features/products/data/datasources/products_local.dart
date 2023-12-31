import 'package:chat_app_max/features/products/data/models/product_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProdcutsLocaleDataSource {
  Future<List<ProductModel>> getCachedProducts();
  Future<Unit> cacheProducts(List<ProductModel> remoteProducts);
}
