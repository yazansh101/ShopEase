import 'package:chat_app_max/core_c/errors/exceptions.dart';
import 'package:chat_app_max/core_c/errors/failures.dart';
import 'package:chat_app_max/core_c/network_info/network_helper.dart';
import 'package:chat_app_max/features/products/data/datasources/products_local.dart';
import 'package:chat_app_max/features/products/data/datasources/products_remote.dart';
import 'package:chat_app_max/features/products/data/models/product_model.dart';
import 'package:chat_app_max/features/products/domain/repositories/products_repository.dart';
import 'package:dartz/dartz.dart';

class ProductsRepoImpl implements ProductsRepository {
  final ProdcutsLocaleDataSource localSource;
  final ProdcutsRemoteDataSource remoteSource;
  final NetworkInfo networkInfo;

  ProductsRepoImpl(this.localSource, this.remoteSource, this.networkInfo);
  @override
  Future<Either<Failure, List<ProductModel>>> getAllProducts() async {
    if (await networkInfo.isConnected) {
      try {
        var remoteProducts = await remoteSource.getAllProducts();
        await localSource.cacheProducts(remoteProducts);
        return Right(remoteProducts);
      } on ServerExceptions {
        return Left(ServerFailure());
      }
    } else {
      try {
        var localeProdcuts = await localSource.getCachedProducts();
        return Right(localeProdcuts);
      } on EmptyCasheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getBestSellingProducts() {
    // TODO: implement getBestSellingProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getFavoriteProducts() {
    // TODO: implement getFavoriteProducts
    throw UnimplementedError();
  }
}
