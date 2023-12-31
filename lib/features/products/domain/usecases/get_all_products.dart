import 'package:chat_app_max/core_c/errors/failures.dart';
import 'package:chat_app_max/features/products/data/models/product_model.dart';
import 'package:chat_app_max/features/products/domain/repositories/products_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllProductsUseCase {
  final ProductsRepository _productRepository;

  GetAllProductsUseCase(this._productRepository);

  Future<Either<Failure, List<ProductModel>>> call() async {
    return await _productRepository.getAllProducts();
  }
}
