class Category{
  String? categoryId;
  String? categoryName;

  Category({required this.categoryId,required this.categoryName});

  Category.fromJson(Map<String,dynamic> json){
    categoryId = json["idkategori"];

    categoryName = json["nama_kategori"];
  }

  Map<String,dynamic> toJson(){
    return{
      'idkategori':categoryId,
      'nama_kategori':categoryName
    };
  }
}

class CategoryProductList{
  String? id;
  String? name;
  String? image;
  String? categoryId;
  String? categoryName;

  CategoryProductList({required this.categoryName,required this.categoryId,required this.image,required this.id,required this.name});

  CategoryProductList.fromJson(Map<String,dynamic> json){
    id = json['idproduct'];
    name = json['nama'];
    image = json['image'];
    categoryId = json['idkategori'];
    categoryName = json['nama_kategori'];
  }

  Map<String,dynamic> toJson(){
    return {
      'idproduct':id,
      'nama':name,
      'image':image,
      'idkategori':categoryId,
      'nama_kategori':categoryName
    };
  }

}

