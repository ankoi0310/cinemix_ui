enum Censorship {
  P('P', 'Phim dành cho khán giả mọi lứa tuổi'),
  K('K',
      'Phim dành cho khán giả từ dưới 13 tuổi với điều kiện xem cùng cha, mẹ hoặc người giám hộ'),
  C13('C13', 'Phim dành cho khán giả từ đủ 13 tuổi trở lên'),
  C16('C16', 'Phim dành cho khán giả từ đủ 16 tuổi trở lên'),
  C18('C18', 'Phim dành cho khán giả từ đủ 18 tuổi trở lên');

  const Censorship(this.value, this.description);

  final String value;
  final String description;
}
