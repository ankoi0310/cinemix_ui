enum ArtistType {
  director(
    value: 'director',
    nameVN: 'Đạo diễn',
    nameEN: 'Director',
  ),
  actor(
    value: 'actor',
    nameVN: 'Diễn viên',
    nameEN: 'Actor',
  );

  const ArtistType({
    required this.value,
    required this.nameVN,
    required this.nameEN,
  });

  final String value;
  final String nameVN;
  final String nameEN;

  static ArtistType? fromValue(String value) {
    switch (value.toLowerCase()) {
      case 'director':
        return director;
      case 'actor':
        return actor;
      default:
        return null;
    }
  }
}
