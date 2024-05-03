enum MovieStateEnum {
  showing(value: 'SHOWING', nameVN: 'Đang chiếu', nameEN: 'Now showing'),
  comingSoon(value: 'COMING_SOON', nameVN: 'Sắp chiếu', nameEN: 'Coming soon'),
  end(value: 'END', nameVN: 'Ngưng chiếu', nameEN: 'End');

  const MovieStateEnum({
    required this.value,
    required this.nameVN,
    required this.nameEN,
  });

  final String value;
  final String nameVN;
  final String nameEN;

  static MovieStateEnum fromValue(String value) {
    switch (value) {
      case 'showing':
        return MovieStateEnum.showing;
      case 'coming_soon':
        return MovieStateEnum.comingSoon;
      case 'end':
        return MovieStateEnum.end;
      default:
        throw ArgumentError('Invalid movie state value: $value');
    }
  }
}
