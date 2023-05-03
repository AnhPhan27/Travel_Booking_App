class DataFavourite {
  final String type;
  final String place;
  final double rating;
  final String path;

  DataFavourite(
      {required this.path,
      required this.type,
      required this.place,
      required this.rating});
}

List<DataFavourite> dataFavourites = [
  DataFavourite(
      type: 'Global Camping ',
      place: 'Nagarkot, Nepal',
      rating: 4.5,
      path: 'assets/images/camping1.png'),
  DataFavourite(
      path: 'assets/images/camping.png',
      type: 'Duca Camping Resort',
      place: 'ThotNot, Vietnam',
      rating: 4.0),
];
