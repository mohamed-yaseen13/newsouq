class SearchProductEntity {
  final String name;
  final double price;
  final String imageUrl;
  final double discountPercentage;
  final String id;

  SearchProductEntity({
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.discountPercentage,
    required this.id,
  });
}
