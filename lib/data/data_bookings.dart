class DataBookings {
  final String type;
  final String place;

  final String path;

  DataBookings({
    required this.path,
    required this.type,
    required this.place,
  });
}

List<DataBookings> dataBookings = [
  DataBookings(
      type: 'Jungle Safa',
      place: 'Indonesia',
      path: 'assets/images/jungleSafa.png'),
  DataBookings(
    path: 'assets/images/camping.png',
    type: 'Duca Camping Resort',
    place: 'ThotNot, Vietnam',
  ),
];
