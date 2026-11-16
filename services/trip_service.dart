import '../models/traveler.dart';
import '../models/trip.dart';
import 'app_exceptions.dart';

/// Creates, edits, deletes, and lists a traveler's trips.
class TripService {
  final Traveler _traveler;
  int _nextId = 1;

  TripService(this._traveler);

  /// A trip needs a title, destination, and a valid date range
  Trip createTrip({
    required String title,
    required String destination,
    required DateTime startDate,
    required DateTime endDate,
  }) {
    _validate(title, destination, startDate, endDate);
    final trip = Trip(
      tripId: 'trip_${_nextId++}',
      title: title.trim(),
      destination: destination.trim(),
      startDate: startDate,
      endDate: endDate,
    );
    _traveler.addTrip(trip);
    return trip;
  }

  Trip editTrip(
    String tripId, {
    required String title,
    required String destination,
    required DateTime startDate,
    required DateTime endDate,
  }) {
    final trip = getTripById(tripId);
    // Validate first so an invalid edit doesn't change the trip
    _validate(title, destination, startDate, endDate);
    trip.updateDetails(
      title: title.trim(),
      destination: destination.trim(),
      startDate: startDate,
      endDate: endDate,
    );
    return trip;
  }

  void deleteTrip(String tripId) {
    if (!_traveler.removeTrip(tripId)) {
      throw NotFoundException('Trip not found: $tripId');
    }
  }

  List<Trip> getAllTrips() => _traveler.trips;

  Trip getTripById(String tripId) {
    final trip = _traveler.findTrip(tripId);
    if (trip == null) throw NotFoundException('Trip not found: $tripId');
    return trip;
  }

  void _validate(
    String title,
    String destination,
    DateTime startDate,
    DateTime endDate,
  ) {
    if (title.trim().isEmpty) {
      throw const ValidationException('Trip title cannot be empty.');
    }
    if (destination.trim().isEmpty) {
      throw const ValidationException('Trip destination cannot be empty.');
    }
    if (endDate.isBefore(startDate)) {
      throw const ValidationException(
        'End date cannot be earlier than the start date.',
      );
    }
  }
}
