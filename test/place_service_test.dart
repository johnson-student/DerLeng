import 'package:test/test.dart';
import '../models/tourist_place.dart';
import '../services/app_exceptions.dart';
import '../services/place_service.dart';

void main() {
  late PlaceService placeService;

  setUp(() {
    placeService = PlaceService();
  });

  test('retrieves the preloaded tourist attractions', () {
    final places = placeService.getAllPlaces();

    expect(places, isNotEmpty);
    for (final p in places) {
      expect(p.placeId, isNotEmpty);
      expect(p.name, isNotEmpty);
      expect(p.province, isNotEmpty);
      expect(p.category, isNotEmpty);
      expect(p.description, isNotEmpty);
    }
  });

  test('includes the required provinces', () {
    final provinces = placeService.getProvinces();

    expect(
      provinces,
      containsAll(['Phnom Penh', 'Siem Reap', 'Kampot', 'Sihanoukville']),
    );
  });

  test('filters attractions by province', () {
    final results = placeService.filterPlaces(province: 'Siem Reap');

    expect(results, isNotEmpty);
    expect(results.every((p) => p.province == 'Siem Reap'), isTrue);
  });

  test('filters attractions by category', () {
    final results = placeService.filterPlaces(category: 'Beach');

    expect(results, isNotEmpty);
    expect(results.every((p) => p.category == 'Beach'), isTrue);
  });

  test('searches by name without caring about letter case', () {
    final results = placeService.searchPlaces('ANGKOR');

    expect(results.length, 1);
    expect(results.first.name, 'Angkor Wat');
  });

  test('combines search and province filter', () {
    final results =
        placeService.searchAndFilter(query: 'temple', province: 'Siem Reap');

    expect(results.length, 1);
    expect(results.first.name, 'Bayon Temple');
  });

  test('returns an empty list when nothing matches', () {
    expect(placeService.searchPlaces('does not exist'), isEmpty);
  });

  test('no filters (cleared filters) returns all attractions', () {
    expect(placeService.filterPlaces().length,
        placeService.getAllPlaces().length);
  });

  test('getPlaceById returns a place or throws NotFoundException', () {
    expect(placeService.getPlaceById('p06').name, 'Angkor Wat');
    expect(() => placeService.getPlaceById('nope'),
        throwsA(isA<NotFoundException>()));
  });

  test('every preloaded attraction has at least one image', () {
    for (final place in placeService.getAllPlaces()) {
      expect(place.images, isNotEmpty, reason: place.name);
    }
  });

  test('stores several images as a list and uses the first as cover', () {
    final angkorWat = placeService.getPlaceById('p06');

    expect(angkorWat.images, isA<List<String>>());
    expect(angkorWat.images.length, greaterThan(1));
    expect(angkorWat.coverImage, angkorWat.images.first);
  });

  test('a place without images has no cover image', () {
    const noImages = TouristPlace(
      placeId: 'x1',
      name: 'Test Place',
      province: 'Test',
      category: 'Test',
      description: 'No images here.',
    );
    final service = PlaceService(places: [noImages]);

    final place = service.getPlaceById('x1');
    expect(place.images, isEmpty);
    expect(place.hasImages, isFalse);
    expect(place.coverImage, isNull);
  });
}
