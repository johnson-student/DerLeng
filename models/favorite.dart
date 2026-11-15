class Favorite {
  final String favoriteId;
  final String travelerId;
  final String placeId;

  const Favorite({
    required this.favoriteId,
    required this.travelerId,
    required this.placeId,
  });

  @override
  String toString() =>
      'Favorite($favoriteId, traveler: $travelerId, place: $placeId)';
}
