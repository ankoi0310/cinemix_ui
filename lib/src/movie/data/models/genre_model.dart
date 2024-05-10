import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/movie/domain/entities/genre.dart';

class GenreModel extends Genre {
  const GenreModel({
    required super.name,
  });

  factory GenreModel.fromMap(DataMap map) {
    return GenreModel(
      name: map['name'] as String,
    );
  }

  GenreModel copyWith({
    String? name,
  }) {
    return GenreModel(
      name: name ?? this.name,
    );
  }

  DataMap toMap() {
    return {
      'name': name,
    };
  }
}