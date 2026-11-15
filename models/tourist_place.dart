class TouristPlace {
  final String placeId;
  final String name;
  final String province;
  final String category;
  final String description;
  final List<String> images;

  const TouristPlace({
    required this.placeId,
    required this.name,
    required this.province,
    required this.category,
    required this.description,
    this.images = const [],
  });

  bool get hasImages => images.isNotEmpty;
  String? get coverImage => images.firstOrNull;

  @override
  bool operator ==(Object other) =>
      other is TouristPlace && other.placeId == placeId;

  @override
  int get hashCode => placeId.hashCode;

  @override
  String toString() => 'TouristPlace($placeId, $name)';
}
