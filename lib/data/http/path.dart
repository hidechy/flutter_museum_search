enum APIPath {
  getNearArtFacilities,
  getArtCity,
  getArtGenre,
}

extension APIPathExtension on APIPath {
  String? get value {
    switch (this) {
      case APIPath.getNearArtFacilities:
        return 'getNearArtFacilities';
      case APIPath.getArtCity:
        return 'getArtCity';
      case APIPath.getArtGenre:
        return 'getArtGenre';
    }
  }
}
