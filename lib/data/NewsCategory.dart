import 'package:news_app/model/CategoryModel.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = new List<CategoryModel>();

  CategoryModel categorymodel = new CategoryModel();
  categorymodel.categoryName = "business";
  categorymodel.imageUrl =
      "https://images.unsplash.com/photo-1460925895917-afdab827c52f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=815&q=80";
  category.add(categorymodel);

  categorymodel = new CategoryModel();
  categorymodel.categoryName = "entertainment";
  categorymodel.imageUrl =
      "https://images.unsplash.com/photo-1499364615650-ec38552f4f34?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=772&q=80";
  category.add(categorymodel);

  categorymodel = new CategoryModel();
  categorymodel.categoryName = "general";
  categorymodel.imageUrl =
      "https://images.unsplash.com/photo-1602288637781-5ca78e8af9d4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80";
  category.add(categorymodel);


  categorymodel = new CategoryModel();
  categorymodel.categoryName = "health";
  categorymodel.imageUrl =
  "https://images.unsplash.com/photo-1532938911079-1b06ac7ceec7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1032&q=80";
  category.add(categorymodel);

  categorymodel = new CategoryModel();
  categorymodel.categoryName = "science";
  categorymodel.imageUrl =
  "https://images.unsplash.com/photo-1517976487492-5750f3195933?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80";
  category.add(categorymodel);

  categorymodel = new CategoryModel();
  categorymodel.categoryName = "sports";
  categorymodel.imageUrl =
  "https://images.unsplash.com/photo-1472108482137-8df36ccf0d7b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80";
  category.add(categorymodel);

  categorymodel = new CategoryModel();
  categorymodel.categoryName = "technology";
  categorymodel.imageUrl =
  "https://images.unsplash.com/photo-1518770660439-4636190af475?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80";
  category.add(categorymodel);

  return category;
}
