enum MovieState {
  nowPlaying(value: 'now_playing', nameVN: 'Đang chiếu', nameEN: 'Now playing'),
  comingSoon(value: 'coming_soon', nameVN: 'Sắp chiếu', nameEN: 'Coming soon'),
  end(value: 'end', nameVN: 'Kết thúc', nameEN: 'End');

  const MovieState({
    required this.value,
    required this.nameVN,
    required this.nameEN,
  });

  final String value;
  final String nameVN;
  final String nameEN;
}
