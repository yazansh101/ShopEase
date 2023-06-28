

class CategoryModel {
   late String name;
   late String imageUrl;
   late bool isSelectedForFilttering;

  CategoryModel(
    {
      required this.name,
      required this.imageUrl,
       this.isSelectedForFilttering=false,
    }
  );


}