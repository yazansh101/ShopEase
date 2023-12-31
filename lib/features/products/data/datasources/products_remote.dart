import 'package:chat_app_max/features/products/data/models/product_model.dart';

abstract class ProdcutsRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
}

class ProdcutsRemoteDataSourceImpl extends ProdcutsRemoteDataSource {
  @override
  Future<List<ProductModel>> getAllProducts() {
    throw UnimplementedError();
  }
}
