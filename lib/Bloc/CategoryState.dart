part of 'CategoryCubit.dart';

abstract class CategoryState extends Equatable{
  const CategoryState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CategoryInitial extends CategoryState{}
class CategoryLoading extends CategoryState{}
class CategoryGetSuccess extends CategoryState{
  final List<Category> categoryList ;
  CategoryGetSuccess(this.categoryList);

  @override
  // TODO: implement props
  List<Object?> get props => [categoryList];
}

class CategoryGetProduct extends CategoryState{
  final List<CategoryProductList> categoryList;
  CategoryGetProduct(this.categoryList);
  @override
  // TODO: implement props
  List<Object?> get props => [categoryList];
}
class CategoryFailed extends CategoryState{
  final String state;
  CategoryFailed(this.state);
  @override
  // TODO: implement props
  List<Object?> get props => [state];
}