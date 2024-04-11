import 'package:equatable/equatable.dart';

class Genre extends Equatable {
  const Genre({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  @override
  List<Object?> get props => [id, name];
}

const demoGenres = <Genre>[
  Genre(
    id: 1,
    name: 'Action',
  ),
  Genre(
    id: 2,
    name: 'Adventure',
  ),
  Genre(
    id: 3,
    name: 'Crime',
  ),
];
