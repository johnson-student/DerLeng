import 'package:test/test.dart';
import '../models/traveler.dart';
import '../services/app_exceptions.dart';
import '../services/trip_service.dart';

void main() {
  late TripService tripService;
  final startDate = DateTime(2026, 12, 1);
  final endDate = DateTime(2026, 12, 5);

  setUp(() {
    tripService = TripService(Traveler(travelerId: 't1', name: 'Sokha'));
  });

  test('creates a trip with valid details', () {
    final trip = tripService.createTrip(
      title: 'Angkor Adventure',
      destination: 'Siem Reap',
      startDate: startDate,
      endDate: endDate,
    );

    expect(trip.title, 'Angkor Adventure');
    expect(trip.destination, 'Siem Reap');
    expect(tripService.getAllTrips(), contains(trip));
  });

  test('rejects a trip with an empty title', () {
    expect(
      () => tripService.createTrip(
        title: '   ',
        destination: 'Siem Reap',
        startDate: startDate,
        endDate: endDate,
      ),
      throwsA(isA<ValidationException>()),
    );
    expect(tripService.getAllTrips(), isEmpty);
  });

  test('rejects a trip with an empty destination', () {
    expect(
      () => tripService.createTrip(
        title: 'My Trip',
        destination: '',
        startDate: startDate,
        endDate: endDate,
      ),
      throwsA(isA<ValidationException>()),
    );
  });

  test('rejects a trip whose end date is before the start date', () {
    expect(
      () => tripService.createTrip(
        title: 'My Trip',
        destination: 'Kampot',
        startDate: endDate,
        endDate: startDate,
      ),
      throwsA(isA<ValidationException>()),
    );
  });

  test('allows a trip to start and end on the same day', () {
    final trip = tripService.createTrip(
      title: 'Day Trip',
      destination: 'Kep',
      startDate: startDate,
      endDate: startDate,
    );
    expect(trip.startDate, trip.endDate);
  });

  test('edits an existing trip', () {
    final trip = tripService.createTrip(
      title: 'Old',
      destination: 'Kampot',
      startDate: startDate,
      endDate: endDate,
    );

    tripService.editTrip(
      trip.tripId,
      title: 'New',
      destination: 'Kep',
      startDate: startDate,
      endDate: endDate,
    );

    expect(tripService.getTripById(trip.tripId).title, 'New');
    expect(tripService.getTripById(trip.tripId).destination, 'Kep');
  });

  test('keeps the original trip when an edit is invalid', () {
    final trip = tripService.createTrip(
      title: 'Keep Me',
      destination: 'Kampot',
      startDate: startDate,
      endDate: endDate,
    );

    expect(
      () => tripService.editTrip(
        trip.tripId,
        title: '',
        destination: 'Kep',
        startDate: startDate,
        endDate: endDate,
      ),
      throwsA(isA<ValidationException>()),
    );
    expect(trip.title, 'Keep Me');
  });

  test('deletes a trip', () {
    final trip = tripService.createTrip(
      title: 'Temp',
      destination: 'Kampot',
      startDate: startDate,
      endDate: endDate,
    );

    tripService.deleteTrip(trip.tripId);

    expect(tripService.getAllTrips(), isEmpty);
  });

  test('throws when deleting a trip that does not exist', () {
    expect(
      () => tripService.deleteTrip('missing'),
      throwsA(isA<NotFoundException>()),
    );
  });

  test('returns every created trip', () {
    tripService.createTrip(
      title: 'A',
      destination: 'Kampot',
      startDate: startDate,
      endDate: endDate,
    );
    tripService.createTrip(
      title: 'B',
      destination: 'Kep',
      startDate: startDate,
      endDate: endDate,
    );

    expect(tripService.getAllTrips().length, 2);
  });
}
