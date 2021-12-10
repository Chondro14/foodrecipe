import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodsdelivery/Model/Category.dart';
import 'package:foodsdelivery/Service/CategoryService.dart';
part 'CategoryState.dart';

class CategoryCubit extends Cubit<CategoryState>{
  CategoryCubit() : super(CategoryInitial());

  void getDataCategoryList()async{
    try{
      emit(CategoryLoading());
      List<Category> categoryList = await CategoryService().getCategoryProduct();
      emit(CategoryGetSuccess(categoryList));
    }catch(e){
      emit(CategoryFailed("Error get Data"));
    }
  }

  void getCategoryProductList(String id)async{
    try{
      emit(CategoryLoading());
      List<CategoryProductList> categoryList = await CategoryService().getProductCategoryList(id);
      emit(CategoryGetProduct(categoryList));
    }catch(e){
      emit(CategoryFailed("Error get data"));
    }
  }



}