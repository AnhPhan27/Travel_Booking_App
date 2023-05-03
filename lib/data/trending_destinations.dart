class TrendingDestination {
  final String path;
  final String place;
  final double rating;
  final int price;

  TrendingDestination(
      {required this.path,
      required this.place,
      required this.rating,
      required this.price});
}

List<TrendingDestination> trendingDestinations = [
  TrendingDestination(
      path: 'beach.png', place: 'Sakute Beach', rating: 3.5, price: 25),
  TrendingDestination(
      path: 'camping.png', place: 'Nagarkot Camping', rating: 4.0, price: 65),
  TrendingDestination(
      path: 'rafting.png', place: 'Karnali Rafting', rating: 4.3, price: 70),
  TrendingDestination(
      path: 'mountain.png', place: 'Mardi Himal Trek', rating: 4.7, price: 95),
];
