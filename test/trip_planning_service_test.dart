import 'package:test/test.dart';
import '../models/traveler.dart';
import '../models/trip.dart';
import '../services/app_exceptions.dart';
import '../services/place_service.dart';
import '../services/trip_planning_service.dart';
import '../services/trip_service.dart';

void main() {
  late TripService tripService;
  late TripPlanningService planningService;
  late Trip tripA;
  late Trip tripB;

  const angkorWat = 'p06';
  const bayon = 'p07';

  setUp(() {
    final placeService = PlaceService();
    tripService = TripService(Traveler(travelerId: 't1', name: 'Sokha'));
    planningService = TripPlanningService(tripService, placeService);

    tripA = tripService.createTrip(
      title: 'Siem Reap Trip',
      destination: 'Siem Reap',
      startDate: DateTime(2026, 12, 1),
      endDate: DateTime(2026, 12, 5),
    );
    tripB = tripService.createTrip(
      title: 'Temple Tour',
      destination: 'Cambodia',
      startDate: DateTime(2027, 1, 10),
      endDate: DateTime(2027, 1, 15),
    );
  });

  test('adds a place to a trip', () {
    planningService.addPlaceToTrip(tripA.tripId, angkorWat);

    final places = planningService.getTripPlaces(tripA.tripId);
    expect(places.length, 1);
    expect(places.first.name, 'Angkor Wat');
  });

  test('prevents the same place from being added twice to one trip', () {
    planningService.addPlaceToTrip(tripA.tripId, angkorWat);

    expect(
      () => planningService.addPlaceToTrip(tripA.tripId, angkorWat),
      throwsA(isA<DuplicateException>()),
    );
    expect(planningService.getTripPlaces(tripA.tripId).length, 1);
  });

  test('removes a place from a trip', () {
    planningService.addPlaceToTrip(tripA.tripId, angkorWat);

    planningService.removePlaceFromTrip(tripA.tripId, angkorWat);

    expect(planningService.getTripPlaces(tripA.tripId), isEmpty);
  });

  test('allows the same place in different trips', () {
    planningService.addPlaceToTrip(tripA.tripId, angkorWat);
    planningService.addPlaceToTrip(tripB.tripId, angkorWat);

    expect(planningService.getTripPlaces(tripA.tripId).length, 1);
    expect(planningService.getTripPlaces(tripB.tripId).length, 1);
  });

  test('removing from one trip does not affect the other trip', () {
    planningService.addPlaceToTrip(tripA.tripId, angkorWat);
    planningService.addPlaceToTrip(tripB.tripId, angkorWat);

    planningService.removePlaceFromTrip(tripA.tripId, angkorWat);

    expect(planningService.getTripPlaces(tripA.tripId), isEmpty);
    expect(planningService.getTripPlaces(tripB.tripId).length, 1);
  });

  test('rejects a place that does not exist', () {
    expect(
      () => planningService.addPlaceToTrip(tripA.tripId, 'nope'),
      throwsA(isA<NotFoundException>()),
    );
    expect(planningService.getTripPlaces(tripA.tripId), isEmpty);
  });

  test('rejects a trip that does not exist', () {
    expect(
      () => planningService.addPlaceToTrip('missing', angkorWat),
      throwsA(isA<NotFoundException>()),
    );
  });

  test('throws when removing a place that is not in the trip', () {
    expect(
      () => planningService.removePlaceFromTrip(tripA.tripId, bayon),
      throwsA(isA<NotFoundException>()),
    );
  });

  test('keeps the order in which places were added', () {
    planningService.addPlaceToTrip(tripA.tripId, bayon);
    planningService.addPlaceToTrip(tripA.tripId, angkorWat);

    final names = planningService
        .getTripPlaces(tripA.tripId)
        .map((place) => place.name)
        .toList();
    expect(names, ['Bayon Temple', 'Angkor Wat']);
  });
}
