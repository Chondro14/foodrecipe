import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:foodsdelivery/Model/Product.dart';
import 'package:foodsdelivery/Service/ProductService.dart';

part 'ProductsState.dart';

class ProductsCubit extends Cubit<ProductsState>{
  ProductsCubit() : super(ProductsInitial());

  //Function Asyncronous
  Future<void> fetchProducts()async{
    // Handling error try and catch
    try{
      //Sebagai pengunpdate state atau sebagai reactive state yang akan menentukan state ini bener atau tidak
      emit(ProductsLoading());
      //Instances
      List<Product> products = await ProductService().getProducts();
      //Sebagai pengunpdate state atau sebagai reactive state yang akan menentukan state ini bener atau tidak
      emit(ProductsGetSuccess(products));
    }catch(e){
      emit(ProductsFailed("Get data Failed"));
      print(e);
    }
  }
  //
  void fetchDetailProduct(String id)async{
    try{
      emit(ProductsLoading());
      List<ProductDetail> productDetail = await ProductService().getDetailProduct(id);
      emit(ProductDetailGetSuccess(productDetail));
    }catch(e){
      emit(ProductsFailed("Get Detail Data Failed"));
      print(e);
    }
  }

  void addReviewProduct(String review,String idProduct,String userId)async{
    try{
      emit(ProductsLoading());
      String state = await ProductService().addReview(review, idProduct, userId);

      emit(ProductAddReviewSuccess(state: state));
    }catch(e){
      emit(ProductsFailed("Error add Review"));
    }
  }
  void addPictProduct(String image,String idproduct)async{
    try{
      emit(ProductsLoading());
      String state = await ProductService().addImageProduct(image, idproduct);
      emit(ProductAddImage(state));
    }catch(e){
      emit(ProductsFailed("Error add picture"));
    }
  }
  void addProduct(String name,String price,String creator,String category,String userid)async{
    try{
      emit(ProductsLoading());
      String state = await ProductService().addProduct(name, price, creator, category, userid);
      emit(ProductAddProduct(state));
    }catch(e){
      emit(ProductsFailed("Error add product"));
    }
  }

}