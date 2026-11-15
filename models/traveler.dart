import 'favorite.dart';
import 'trip.dart';

class Traveler {
  final String travelerId;
  String name;
  final List<Trip> _trips = [];
  final List<Favorite> _favorites = [];

  Traveler({required this.travelerId, required this.name});

  List<Trip> get trips => List.unmodifiable(_trips);
  List<Favorite> get favorites => List.unmodifiable(_favorites);

  void addTrip(Trip trip) => _trips.add(trip);

  bool removeTrip(String tripId) {
    final count = _trips.length;
    _trips.removeWhere((t) => t.tripId == tripId);
    return _trips.length < count;
  }

  Trip? findTrip(String tripId) =>
      _trips.where((t) => t.tripId == tripId).firstOrNull;

  void addFavorite(Favorite favorite) => _favorites.add(favorite);

  bool hasFavorite(String placeId) =>
      _favorites.any((f) => f.placeId == placeId);

  bool removeFavorite(String placeId) {
    final count = _favorites.length;
    _favorites.removeWhere((f) => f.placeId == placeId);
    return _favorites.length < count;
  }

  @override
  String toString() => 'Traveler($travelerId, $name)';
}
