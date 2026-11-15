import '../data/sample_places.dart';
import '../models/tourist_place.dart';
import './app_exceptions.dart';

class PlaceService {
  final List<TouristPlace> _places;

  PlaceService({List<TouristPlace>? places})
      : _places = List.of(places ?? sampleTouristPlaces);

  List<TouristPlace> getAllPlaces() => List.unmodifiable(_places);

  TouristPlace getPlaceById(String placeId) {
    return _places.firstWhere(
      (p) => p.placeId == placeId,
      orElse: () =>
          throw NotFoundException('Tourist place not found: $placeId'),
    );
  }

  List<TouristPlace> searchPlaces(String query) =>
      searchAndFilter(query: query);

  List<TouristPlace> filterPlaces({String? province, String? category}) =>
      searchAndFilter(province: province, category: category);

  List<TouristPlace> searchAndFilter({
    String query = '',
    String? province,
    String? category,
  }) {
    final q = query.trim().toLowerCase();
    return _places.where((p) {
      final matchesName = q.isEmpty || p.name.toLowerCase().contains(q);
      final matchesProvince = province == null || p.province == province;
      final matchesCategory = category == null || p.category == category;
      return matchesName && matchesProvince && matchesCategory;
    }).toList();
  }

  List<String> getProvinces() =>
      _places.map((p) => p.province).toSet().toList()..sort();

  List<String> getCategories() =>
      _places.map((p) => p.category).toSet().toList()..sort();
}
