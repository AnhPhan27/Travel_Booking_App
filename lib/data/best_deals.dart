class BestDeals {
  final String path;
  final String place;
  final double rating;
  final int price;

  BestDeals({
    required this.path,
    required this.place,
    required this.rating,
    required this.price,
  });
}

List<BestDeals> bestDeals = [
  BestDeals(
    path: 'beach.png',
    place: 'Sakute Beach',
    rating: 3.5,
    price: 25,
  ),
  BestDeals(
    path: 'camping.png',
    place: 'Nagarkot Camping',
    rating: 4.0,
    price: 65,
  ),
  BestDeals(
    path: 'rafting1.png',
    place: 'Karnali Rafting',
    rating: 4.3,
    price: 70,
  ),
  BestDeals(
    path: 'mountain1.png',
    place: 'Mardi Himal Trek',
    rating: 4.7,
    price: 95,
  ),
];
