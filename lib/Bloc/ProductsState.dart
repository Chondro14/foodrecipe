part of'ProductsCubit.dart';

abstract class ProductsState extends Equatable{
  const ProductsState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductsInitial extends ProductsState{}
class ProductsLoading extends ProductsState{}
class ProductsGetSuccess extends ProductsState{
  final List<Product> products;
  ProductsGetSuccess(this.products);
  @override
  // TODO: implement props
  List<Object?> get props => [products];
}

class ProductDetailGetSuccess extends ProductsState{
  final List<ProductDetail> productDetail;
  ProductDetailGetSuccess(this.productDetail);
  @override
  // TODO: implement props
  List<Object?> get props => [productDetail];
}

class ProductAddReviewSuccess extends ProductsState{
  final String state ;
  ProductAddReviewSuccess({required this.state});
  @override
  // TODO: implement props
  List<Object?> get props => [state];
}
class ProductAddProduct extends ProductsState{
  final String state;
  ProductAddProduct(this.state);

  @override
  // TODO: implement props
  List<Object?> get props => [state];
}
class ProductAddImage extends ProductsState{
  final String state;
  ProductAddImage(this.state);
  @override
  // TODO: implement props
  List<Object?> get props => [state];
}

class ProductsFailed extends ProductsState{
  final String error;
  ProductsFailed(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}