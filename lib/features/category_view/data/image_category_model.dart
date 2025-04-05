import 'package:wallpaper_app/core/utils/app_images.dart';

class ImageCategory {
  final String topic;
  final String imagePath;

  ImageCategory({required this.topic, required this.imagePath});
}

List<ImageCategory> images = [
  ImageCategory(topic: "Bicycle", imagePath: Assets.imagesCategories1),
  ImageCategory(topic: "Abstract", imagePath: Assets.imagesCategories2),
  ImageCategory(topic: "Art", imagePath: Assets.imagesCategories3),
  ImageCategory(topic: "Beach", imagePath: Assets.imagesCategories4),
  ImageCategory(topic: "Car", imagePath: Assets.imagesCategories5),
  ImageCategory(topic: "Food", imagePath: Assets.imagesCategories6),
  ImageCategory(topic: "Gaming", imagePath: Assets.imagesCategories7),
  ImageCategory(topic: "NNature", imagePath: Assets.imagesCategories8),
  ImageCategory(topic: "PLant", imagePath: Assets.imagesCategories9),
  ImageCategory(topic: "Rain", imagePath: Assets.imagesCategories10),
  ImageCategory(topic: "Plane", imagePath: Assets.imagesCategories11),
  ImageCategory(topic: "Travel", imagePath: Assets.imagesCategories12),
  ImageCategory(topic: "Wildlife", imagePath: Assets.imagesCategories13),
  ImageCategory(topic: "Space", imagePath: Assets.imagesCategories14),
  ImageCategory(topic: "Bike", imagePath: Assets.imagesCategories15),
];
