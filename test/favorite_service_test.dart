import 'package:test/test.dart';
import '../models/traveler.dart';
import '../services/app_exceptions.dart';
import '../services/favorite_service.dart';
import '../services/place_service.dart';

void main() {
  late FavoriteService favoriteService;
  const angkorWat = 'p06';

  setUp(() {
    final traveler = Traveler(travelerId: 't1', name: 'Sokha');
    favoriteService = FavoriteService(traveler, PlaceService());
  });

  test('starts with no favorites', () {
    expect(favoriteService.getFavorites(), isEmpty);
  });

  test('adds an attraction to favorites', () {
    favoriteService.addFavorite(angkorWat);

    final favorites = favoriteService.getFavorites();
    expect(favorites.length, 1);
    expect(favorites.first.name, 'Angkor Wat');
    expect(favoriteService.isFavorite(angkorWat), isTrue);
  });

  test('prevents duplicate favorites', () {
    favoriteService.addFavorite(angkorWat);

    expect(() => favoriteService.addFavorite(angkorWat), throwsException);
    expect(favoriteService.getFavorites().length, 1);
  });

  test('removes an attraction from favorites', () {
    favoriteService.addFavorite(angkorWat);

    favoriteService.removeFavorite(angkorWat);

    expect(favoriteService.getFavorites(), isEmpty);
  });

  test('rejects a non-existing place', () {
    expect(
      () => favoriteService.addFavorite('nope'),
      throwsA(isA<NotFoundException>()),
    );
  });

  test('removing a place that is not a favorite throws NotFoundException', () {
    expect(
      () => favoriteService.removeFavorite(angkorWat),
      throwsA(isA<NotFoundException>()),
    );
  });
}