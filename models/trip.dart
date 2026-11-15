import 'trip_place.dart';

/// A trip created for a traveler.
/// It owns the places added to the trip and removes them when the trip is deleted.
class Trip {
  /// Fields 
  final String tripId;
  String _title;
  String _destination;
  DateTime _startDate;
  DateTime _endDate;
  final List<TripPlace> _tripPlaces = [];
  
  /// Constructor
  Trip({
    required this.tripId,
    required String title,
    required String destination,
    required DateTime startDate,
    required DateTime endDate,
  }) : _title = title,
       _destination = destination,
       _startDate = startDate,
       _endDate = endDate;

  /// Getters
  String get title => _title;
  String get destination => _destination;
  DateTime get startDate => _startDate;
  DateTime get endDate => _endDate;

  /// A read-only view so outside code cannot change the list directly
  List<TripPlace> get tripPlaces => List.unmodifiable(_tripPlaces);
  List<String> get placeIds => _tripPlaces.map((tripPlace) => tripPlace.placeId).toList();


  /// Methods
  bool containsPlace(String placeId) => _tripPlaces.any((tripPlace) => tripPlace.placeId == placeId);

  void addPlace(String placeId) {
    _tripPlaces.add(TripPlace(tripId: tripId, placeId: placeId));
  }

  /// Returns true if something was removed
  bool removePlace(String placeId) {
    final before = _tripPlaces.length;
    _tripPlaces.removeWhere((tripPlace) => tripPlace.placeId == placeId);
    return _tripPlaces.length < before;
  }

  /// Validates data before this is called
  void updateDetails({
    required String title,
    required String destination,
    required DateTime startDate,
    required DateTime endDate,
  }) {
    _title = title;
    _destination = destination;
    _startDate = startDate;
    _endDate = endDate;
  }

  @override
  String toString() => 'Trip($tripId, $_title, $_destination)';
}
