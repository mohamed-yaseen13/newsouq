class HomeProductEntity {
  final String name;
  final double price;
  final String imageUrl;
  final double discountPercentage;
  final String id;

  HomeProductEntity({
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.discountPercentage,
    required this.id,
  });
}
