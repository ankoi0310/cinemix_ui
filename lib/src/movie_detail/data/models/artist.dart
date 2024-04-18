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
