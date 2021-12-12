part of'ProductsCubit.dart';

abstract class ProductsState extends Equatable{
  const ProductsState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductsInitial extends ProductsState{}
class ProductsLoading extends ProductsState{}
// State sebagai get data success
class ProductsGetSuccess extends ProductsState{
  final List<Product> products;
  //Constructor
  ProductsGetSuccess(this.products);
  //Props biasanya digunakan untuk menentukan output data sebagai instances yang sama
  @override
  // TODO: implement props
  List<Object?> get props => [products];
}
// State sebagai get data success
class ProductDetailGetSuccess extends ProductsState{

  final List<ProductDetail> productDetail;
  //Constructor
  ProductDetailGetSuccess(this.productDetail);
  @override
  // TODO: implement props
  //Props biasanya digunakan untuk menentukan output data sebagai instances yang sama
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

// State ini bakal success dalam input data
class ProductAddImage extends ProductsState{
  final String state;
  //Consturctor
  ProductAddImage(this.state);
  @override
  // TODO: implement props
  //Props biasanya digunakan untuk menentukan   input data sebagai instances yang sama
  List<Object?> get props => [state];
}
//State ketika gagal melakukan fungsional yang diharapkan / handling error
class ProductsFailed extends ProductsState{
  final String error;
  ProductsFailed(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}