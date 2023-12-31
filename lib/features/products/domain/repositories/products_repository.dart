import 'package:chat_app_max/core_c/errors/failures.dart';
import 'package:chat_app_max/features/products/data/models/product_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<ProductModel>>> getAllProducts();
  Future<Either<Failure, List<ProductModel>>> getFavoriteProducts();
  Future<Either<Failure, List<ProductModel>>> getBestSellingProducts();
}
