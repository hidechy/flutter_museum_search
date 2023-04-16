enum APIPath {
  getNearArtFacilities,

  //
  //
  // getArtGenre,
  //
  //

  getArtCity,
}

extension APIPathExtension on APIPath {
  String? get value {
    switch (this) {
      case APIPath.getNearArtFacilities:
        return 'getNearArtFacilities';

      //
      //
      // case APIPath.getArtGenre:
      //   return 'getArtGenre';
      //
      //

      case APIPath.getArtCity:
        return 'getArtCity';
    }
  }
}
