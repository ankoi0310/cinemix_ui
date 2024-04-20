import 'package:cinemix_ui/core/shared/enums/artist_type.dart';
import 'package:cinemix_ui/core/shared/utils/typedefs.dart';

class Artist {
  Artist({
    this.id = 0,
    this.name,
    this.avatar,
    this.type,
  });

  factory Artist.fromMap(DataMap map) {
    return Artist(
      id: map['id'] as int,
      name: map['name'] as String,
      avatar: map['avatar'] as String,
      type: ArtistType.fromValue(map['type'] as String),
    );
  }

  int id;
  String? name;
  String? avatar;
  ArtistType? type;

  Artist copyWith({
    int? id,
    String? name,
    String? avatar,
    ArtistType? type,
  }) {
    return Artist(
      id: id ?? this.id,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'avatar': avatar,
      'type': type?.value,
    };
  }
}
