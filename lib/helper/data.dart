import '../models/category_model.dart';

List<CategoryModel> getCategories() {

  List<CategoryModel> categories = List<CategoryModel>.empty(growable: true);

  CategoryModel categoryModel = CategoryModel();
  categoryModel.categoryName = "Business";
  categories.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "General";
  categories.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Sports";
  categories.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Technology";
  categories.add(categoryModel);

  return categories;
}