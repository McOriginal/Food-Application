class Food {
  final String category;
  final String title;
  final String description;
  final double price;
  final String image;
  bool isFavorite;

  Food({
    required this.category,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.isFavorite,
  });
}

class Category {
  final String name;

  Category({
    required this.name,
  });
}
