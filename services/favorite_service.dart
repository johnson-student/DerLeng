import '../models/favorite.dart';
import '../models/tourist_place.dart';
import '../models/traveler.dart';
import './app_exceptions.dart';
import 'place_service.dart';

class FavoriteService {
  final Traveler _traveler;
  final PlaceService _placeService;
  int _nextId = 1;

  FavoriteService(this._traveler, this._placeService);

  Favorite addFavorite(String placeId) {
    final place = _placeService.getPlaceById(placeId);
    if (_traveler.hasFavorite(placeId)) {
      throw DuplicateException('"${place.name}" is already in your favorites.');
    }

    final favorite = Favorite(
      favoriteId: 'fav_${_nextId++}',
      travelerId: _traveler.travelerId,
      placeId: placeId,
    );
    _traveler.addFavorite(favorite);
    return favorite;
  }

  void removeFavorite(String placeId) {
    if (!_traveler.removeFavorite(placeId)) {
      throw const NotFoundException('This place is not in your favorites.');
    }
  }

  List<TouristPlace> getFavorites() => _traveler.favorites
      .map((f) => _placeService.getPlaceById(f.placeId))
      .toList();

  bool isFavorite(String placeId) => _traveler.hasFavorite(placeId);
}
