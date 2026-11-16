import '../models/tourist_place.dart';
import '../models/trip_place.dart';
import 'app_exceptions.dart';
import 'place_service.dart';
import 'trip_service.dart';

/// Keeps trip and place data in sync.
class TripPlanningService {
  final TripService _tripService;
  final PlaceService _placeService;

  TripPlanningService(this._tripService, this._placeService);

  /// A place must exist and can only be added once to the same trip.
  TripPlace addPlaceToTrip(String tripId, String placeId) {
    final trip = _tripService.getTripById(tripId);
    final place = _placeService.getPlaceById(placeId);
    if (trip.containsPlace(placeId)) {
      throw DuplicateException(
        '"${place.name}" is already in the trip "${trip.title}".',
      );
    }
    trip.addPlace(placeId);
    return trip.tripPlaces.last;
  }

  void removePlaceFromTrip(String tripId, String placeId) {
    final trip = _tripService.getTripById(tripId);
    if (!trip.removePlace(placeId)) {
      throw const NotFoundException('This place is not in the trip.');
    }
  }

  /// Returns the place details for every stop in a trip.
  List<TouristPlace> getTripPlaces(String tripId) {
    final trip = _tripService.getTripById(tripId);
    return trip.placeIds.map(_placeService.getPlaceById).toList();
  }
}
