import 'package:news_homework/models/category_model.dart';

List<CategoryModel> getCategories() {

  List<CategoryModel> categories = List<CategoryModel>.empty(growable: true);

  CategoryModel category = CategoryModel();
  category.categoryName = "Science";
  categories.add(category);
  
  category = CategoryModel();
  category.categoryName = "Business";
  categories.add(category);

  category = CategoryModel();
  category.categoryName = "Business";
  categories.add(category);

  category = CategoryModel();
  category.categoryName = "General";
  categories.add(category);

  category = CategoryModel();
  category.categoryName = "Sports";
  categories.add(category);

  category = CategoryModel();
  category.categoryName = "Technology";
  categories.add(category);
  

  return categories;
}