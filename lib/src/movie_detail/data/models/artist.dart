import 'package:cinemix_ui/core/shared/enums/artist_type.dart';
import 'package:equatable/equatable.dart';

class Artist extends Equatable {
  const Artist({
    required this.id,
    required this.name,
    required this.avatar,
    required this.type,
  });

  final int id;
  final String name;
  final String avatar;
  final ArtistType type;

  @override
  List<Object?> get props => [id, name, avatar, type];
}

const demoDirector = Artist(
  id: 1,
  name: 'Matt Reeves',
  avatar: 'assets/images/directors/anthony_russo.png',
  type: ArtistType.director,
);

const demoActors = <Artist>[
  Artist(
    id: 1,
    name: 'Robert Downey Jr.',
    avatar: 'assets/images/actors/robert_downey_jr.png',
    type: ArtistType.actor,
  ),
  Artist(
    id: 2,
    name: 'Robert Downey Jr.',
    avatar: 'assets/images/actors/robert_downey_jr.png',
    type: ArtistType.actor,
  ),
  Artist(
    id: 3,
    name: 'Robert Downey Jr.',
    avatar: 'assets/images/actors/robert_downey_jr.png',
    type: ArtistType.actor,
  ),
  Artist(
    id: 4,
    name: 'Robert Downey Jr.',
    avatar: 'assets/images/actors/robert_downey_jr.png',
    type: ArtistType.actor,
  ),
];
