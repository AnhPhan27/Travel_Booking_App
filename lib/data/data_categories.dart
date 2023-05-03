class DataCategories {
  final String type;
  final String path;

  DataCategories({required this.type, required this.path});
}

List<DataCategories> dataCategories = [
  DataCategories(type: 'Mountain', path: 'mountain.png'),
  DataCategories(type: 'Jungle Safa', path: 'jungleSafa.png'),
  DataCategories(type: 'Camping', path: 'camping.png'),
  DataCategories(type: 'Beach', path: 'beach.png'),
  DataCategories(type: 'Lake', path: 'lake.png'),
  DataCategories(type: 'Rafting', path: 'rafting.png'),
];
