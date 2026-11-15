/// A single place inside a trip.
class TripPlace {
  //fields
  final String tripId;
  final String placeId;

  /// Constructor
  const TripPlace({required this.tripId, required this.placeId});

  @override
  String toString() => 'TripPlace(trip: $tripId, place: $placeId)';
}
